<?php
/* ***** BEGIN LICENSE BLOCK *****
 * Classe PhpToPdf modifi� par Sogelis
 * Version originale : jean-Christophe CORNIC
 *
 * ***** END LICENSE BLOCK *****
 */

require_once(dirname(__FILE__). "/html2pdf.php");


$red = array(255,0,0);
$green = array(0,255,0);
$blue = array(0,0,255);
$black = array(0,0,0);
$formatA4 = array(595.28,841.89);

function isInteger($val)
{
	if ($val - round($val) == 0) return true;
	else return false;
}
function plus10pourcentArrondi($valeur)
{
	if ($valeur > 10000) 		$ratio=1000;
	else if ($valeur > 1000) 	$ratio=100;
	else if ($valeur > 100) 	$ratio=10;
	else 				$ratio=1;

	$res = $valeur + (0.1*$valeur);
	$res = round($res/$ratio) * $ratio;

	return $res;
}

function moins10pourcentArrondi($valeur)
{
	if ($valeur > 10000) 		$ratio=1000;
	else if ($valeur > 1000) 	$ratio=100;
	else if ($valeur > 100) 	$ratio=10;
	else 				$ratio=1;

	if ($valeur >0)
		$res = $valeur - (0.1*$valeur);
	else $res = $valeur + (0.1*$valeur);
	
	$res = round($res/$ratio) * $ratio;
	return $res;
}
function stripAccents($string){
	return strtr($string,'���������������������������������������������������',
'aaaaaceeeeiiiinooooouuuuyyAAAAACEEEEIIIINOOOOOUUUUY');
}


class phpToPDF extends PDF_HTML
{
	var $legends;
	var $wLegend;
	var $sum;
	var $NbVal;

	var $_toc=array();
	var $_numbering=false;
	var $_numberingFooter=false;
	var $_numPageNum=1;

	var $tb_columns; 		//number of columns of the table
	var $tb_header_type; 	//array which contains the header characteristics and texts
	var $tb_header_draw;	//TRUE or FALSE, the header is drawed or not
	var $tb_border_draw;	//TRUE or FALSE, the table border is drawed or not
	var $tb_data_type; 		//array which contains the data characteristics (only the characteristics)
	var $tb_table_type; 	//array which contains the table charactersitics
	var $table_startx, $table_starty, $table_starty_origin;	//the X and Y position where the table starts

	var $Draw_Header_Command;	//command which determines in the DrawData first the header draw
	var $New_Page_Commit;	// = true/false if a new page has been comited
	var $Data_On_Current_Page; // = true/false ... if on current page was some data written	
	var $minHeight; // = hauteur minimum de la bordure
	var $titre_rubrique; // = Titre de la rubrique (juste avant le tableau
	
	var $first_header = false;

	function phpToPDF($orientation='P', $unit='mm', $format='A4') {
	   // parent::PDF_HTML($orientation,$unit,$format);
			$this->PDF_HTML($orientation,$unit,$format);
	}


	function AddPage($orientation='') {
		FPDF::AddPage($orientation);
		//parent::AddPage($orientation);
		//$this->ln(30);
		if($this->_numbering)
			$this->_numPageNum++;
	}

	function startPageNums() {
		$this->_numbering=true;
		$this->_numberingFooter=true;
	}

	function stopPageNums() {
		$this->_numbering=false;
	}

	function numPageNo() {
		return $this->_numPageNum;
	}

	function TOC_Entry($txt,$level=0) {
		$this->_toc[]=array('t'=>$txt,'l'=>$level,'p'=>$this->numPageNo());
	}

	function insertTOC( $location=1,
						$labelSize=20,
						$entrySize=10,
						$tocfont='Times',
						$label='Table des mati�res'
						) {
		//make toc at end
		$this->stopPageNums();
		$this->AddPage();
		$tocstart=$this->page;

		$this->SetFont($tocfont,'B',$labelSize);
		$this->Cell(0,5,$label,0,1,'C');
		$this->Ln(20);


		$this->SetLeftMargin(20);



		foreach($this->_toc as $t) {

			//Offset
			$level=$t['l'];
			if($level>0)
				$this->Cell($level*8);
			$weight='';
			if($level==0)
				$weight='B';
			$str=$t['t'];
			$this->SetFont($tocfont,$weight,$entrySize);
			$strsize=$this->GetStringWidth($str);
			$this->Cell($strsize+2,$this->FontSize+2,$str);

			//Filling dots
			$this->SetFont($tocfont,'',$entrySize);
			$PageCellSize=$this->GetStringWidth($t['p'])+2;
			$w=$this->w-$this->lMargin-$this->rMargin-$PageCellSize-($level*8)-($strsize+2);
			$nb=$w/$this->GetStringWidth('.');
			$dots=str_repeat('.',$nb);
			$this->Cell($w,$this->FontSize+2,$dots,0,0,'R');

			//Page number
			$this->Cell($PageCellSize,$this->FontSize+2,$t['p'],0,1,'R');

			$this->Ln(2);
		}

		//grab it and move to selected location
		$n=$this->page;
		$n_toc = $n - $tocstart + 1;
		$last = array();

		//store toc pages
		for($i = $tocstart;$i <= $n;$i++)
			$last[]=$this->pages[$i];

		//move pages
		for($i=$tocstart - 1;$i>=$location-1;$i--)
			$this->pages[$i+$n_toc]=$this->pages[$i];

		//Put toc pages at insert point
		for($i = 0;$i < $n_toc;$i++)
			$this->pages[$location + $i]=$last[$i];
	}

	function Footer() {
		if($this->_numberingFooter==false)
			return;
		//Go to 1.5 cm from bottom
		$this->SetY(-15);
		//Select Arial italic 8
		$this->SetFont('Arial','I',8);
		$this->Cell(0,7,$this->numPageNo(),0,0,'C'); 
		if($this->_numbering==false)
			$this->_numberingFooter=false;
	}

	function SetDash($black=false,$white=false)
	{
		if($black and $white)
			$s=sprintf('[%.3f %.3f] 0 d',$black*$this->k,$white*$this->k);
		else
			$s='[] 0 d';
		$this->_out($s);
	}
	
	function SetLegends($data, $format)
	{
		$this->legends=array();
		$this->wLegend=0;
		$this->sum=array_sum($data);
		$this->NbVal=count($data);
		foreach($data as $l=>$val)
		{
			$p=sprintf('%.2f',$val/$this->sum*100).'%';
			$legend=str_replace(array('%l','%v','%p'),array($l,$val,$p),$format);
			$this->legends[]=$legend;
			$this->wLegend=max($this->GetStringWidth($legend),$this->wLegend);
		}
	}

	function DiagCirculaire($largeur, $hauteur, $data, $format, $couleurs=null, $legend=1)
	{
		$this->SetFont('Courier', '', 10);
		$this->SetLegends($data,$format);

		$XPage = $this->GetX();
		$YPage = $this->GetY();
		$marge = 2;
		$hLegende = 5;
		$rayon = min($largeur - $marge * 4 - $hLegende - $this->wLegend, $hauteur - $marge * 2);
		$rayon = floor($rayon / 2);
		$XDiag = $XPage + $marge + $rayon;
		$YDiag = $YPage + $marge + $rayon;
		if($couleurs == null) {
			for($i = 0;$i < $this->NbVal; $i++) {
				$gray = $i * intval(255 / $this->NbVal);
				$couleurs[$i] = array($gray,$gray,$gray);
			}
		}

		//Secteurs
		$this->SetLineWidth(0.2);
		$angleDebut = 0;
		$angleFin = 0;
		$i = 0;
		foreach($data as $val) {
			$angle = floor(($val * 360) / doubleval($this->sum));
			if ($angle != 0) {
				$angleFin = $angleDebut + $angle;
				$this->SetFillColor($couleurs[$i][0],$couleurs[$i][1],$couleurs[$i][2]);
				$this->Sector($XDiag, $YDiag, $rayon, $angleDebut, $angleFin);
				$angleDebut += $angle;
			}
			$i++;
		}
		if ($angleFin != 360) {
			$this->Sector($XDiag, $YDiag, $rayon, $angleDebut - $angle, 360);
		}

		//L�gendes
		if ($legend == 1)
		{
			$this->SetFont('Courier', '', 10);
			$x1 = $XPage + 2 * $rayon + 4 * $marge;
			$x2 = $x1 + $hLegende + $marge;
			$y1 = $YDiag - $rayon + (2 * $rayon - $this->NbVal*($hLegende + $marge)) / 2;
			for($i=0; $i<$this->NbVal; $i++) {
				$this->SetFillColor($couleurs[$i][0],$couleurs[$i][1],$couleurs[$i][2]);
				$this->Rect($x1, $y1, $hLegende, $hLegende, 'DF');
				$this->SetXY($x2,$y1);
				$this->Cell(0,$hLegende,$this->legends[$i]);
				$y1+=$hLegende + $marge;
			}
		}
	}


	function DiagBatons($largeur, $hauteur, $data, $format, $couleur=null, $maxValRepere=0, $nbIndRepere=4)
	{
		$this->SetFont('Courier', '', 10);
		$this->SetLegends($data,$format);

		$XPage = $this->GetX();
		$YPage = $this->GetY();
		$marge = 2;
		$YDiag = $YPage + $marge;
		$hDiag = floor($hauteur - $marge * 2);
		$XDiag = $XPage + $marge * 2 + $this->wLegend;
		$lDiag = floor($largeur - $marge * 3 - $this->wLegend);
		if($couleur == null)
			$couleur=array(155,155,155);
		if ($maxValRepere == 0) {
			$maxValRepere = max($data);
		}
		$valIndRepere = ceil($maxValRepere / $nbIndRepere);
		$maxValRepere = $valIndRepere * $nbIndRepere;
		$lRepere = floor($lDiag / $nbIndRepere);
		$lDiag = $lRepere * $nbIndRepere;
		$unite = $lDiag / $maxValRepere;
		$hBaton = floor($hDiag / ($this->NbVal + 1));
		$hDiag = $hBaton * ($this->NbVal + 1);
		$eBaton = floor($hBaton * 80 / 100);

		$this->SetLineWidth(0.2);
		$this->Rect($XDiag, $YDiag, $lDiag, $hDiag);

		$this->SetFont('Courier', '', 10);
		$this->SetFillColor($couleur[0],$couleur[1],$couleur[2]);
		$i=0;
		foreach($data as $val) {
			//Barre
			$xval = $XDiag;
			$lval = (int)($val * $unite);
			$yval = $YDiag + ($i + 1) * $hBaton - $eBaton / 2;
			$hval = $eBaton;
			$this->Rect($xval, $yval, $lval, $hval, 'DF');
			//L�gende
			$this->SetXY(0, $yval);
			$this->Cell($xval - $marge, $hval, $this->legends[$i],0,0,'R');
			$i++;
		}

		//Echelles
		for ($i = 0; $i <= $nbIndRepere; $i++) {
			$xpos = $XDiag + $lRepere * $i;
			$this->Line($xpos, $YDiag, $xpos, $YDiag + $hDiag);
			$val = $i * $valIndRepere;
			$xpos = $XDiag + $lRepere * $i - $this->GetStringWidth($val) / 2;
			$ypos = $YDiag + $hDiag - $marge;
			$this->Text($xpos, $ypos, $val);
		}
	}	

	function Sector($xc, $yc, $r, $a, $b, $style='FD', $cw=true, $o=90)
	{
		if($cw){
			$d = $b;
			$b = $o - $a;
			$a = $o - $d;
		}else{
			$b += $o;
			$a += $o;
		}
		$a = ($a%360)+360;
		$b = ($b%360)+360;
		if ($a > $b)
			$b +=360;
		$b = $b/360*2*M_PI;
		$a = $a/360*2*M_PI;
		$d = $b-$a;
		if ($d == 0 )
			$d =2*M_PI;
		$k = $this->k;
		$hp = $this->h;
		if($style=='F')
			$op='f';
		elseif($style=='FD' or $style=='DF')
			$op='b';
		else
			$op='s';
		if (sin($d/2))
			$MyArc = 4/3*(1-cos($d/2))/sin($d/2)*$r;
		//first put the center
		$this->_out(sprintf('%.2f %.2f m',($xc)*$k,($hp-$yc)*$k));
		//put the first point
		$this->_out(sprintf('%.2f %.2f l',($xc+$r*cos($a))*$k,(($hp-($yc-$r*sin($a)))*$k)));
		//draw the arc
		if ($d < M_PI/2){
			$this->_Arc($xc+$r*cos($a)+$MyArc*cos(M_PI/2+$a),
						$yc-$r*sin($a)-$MyArc*sin(M_PI/2+$a),
						$xc+$r*cos($b)+$MyArc*cos($b-M_PI/2),
						$yc-$r*sin($b)-$MyArc*sin($b-M_PI/2),
						$xc+$r*cos($b),
						$yc-$r*sin($b)
						);
		}else{
			$b = $a + $d/4;
			$MyArc = 4/3*(1-cos($d/8))/sin($d/8)*$r;
			$this->_Arc($xc+$r*cos($a)+$MyArc*cos(M_PI/2+$a),
						$yc-$r*sin($a)-$MyArc*sin(M_PI/2+$a),
						$xc+$r*cos($b)+$MyArc*cos($b-M_PI/2),
						$yc-$r*sin($b)-$MyArc*sin($b-M_PI/2),
						$xc+$r*cos($b),
						$yc-$r*sin($b)
						);
			$a = $b;
			$b = $a + $d/4;
			$this->_Arc($xc+$r*cos($a)+$MyArc*cos(M_PI/2+$a),
						$yc-$r*sin($a)-$MyArc*sin(M_PI/2+$a),
						$xc+$r*cos($b)+$MyArc*cos($b-M_PI/2),
						$yc-$r*sin($b)-$MyArc*sin($b-M_PI/2),
						$xc+$r*cos($b),
						$yc-$r*sin($b)
						);
			$a = $b;
			$b = $a + $d/4;
			$this->_Arc($xc+$r*cos($a)+$MyArc*cos(M_PI/2+$a),
						$yc-$r*sin($a)-$MyArc*sin(M_PI/2+$a),
						$xc+$r*cos($b)+$MyArc*cos($b-M_PI/2),
						$yc-$r*sin($b)-$MyArc*sin($b-M_PI/2),
						$xc+$r*cos($b),
						$yc-$r*sin($b)
						);
			$a = $b;
			$b = $a + $d/4;
			$this->_Arc($xc+$r*cos($a)+$MyArc*cos(M_PI/2+$a),
						$yc-$r*sin($a)-$MyArc*sin(M_PI/2+$a),
						$xc+$r*cos($b)+$MyArc*cos($b-M_PI/2),
						$yc-$r*sin($b)-$MyArc*sin($b-M_PI/2),
						$xc+$r*cos($b),
						$yc-$r*sin($b)
						);
		}
		//terminate drawing
		$this->_out($op);
	}

	function _Arc($x1, $y1, $x2, $y2, $x3, $y3 )
	{
		$h = $this->h;
		$this->_out(sprintf('%.2f %.2f %.2f %.2f %.2f %.2f c',
			$x1*$this->k,
			($h-$y1)*$this->k,
			$x2*$this->k,
			($h-$y2)*$this->k,
			$x3*$this->k,
			($h-$y3)*$this->k));
	}	

	
	//returns the width of the page in user units
	function PageWidth(){
		return (int) $this->w-$this->rMargin-$this->lMargin;
	}

	//constructor(not a real one, but have to call it first)
	//we initialize all the variables that we use
	function Table_Init($col_no = 0, $header_draw = true, $border_draw = true){
		$this->tb_columns = $col_no;
		$this->tb_header_type = Array();
		$this->tb_header_draw = $header_draw;
		$this->tb_border_draw = $border_draw;
		$this->tb_data_type = Array();
		$this->tb_type = Array();
		$this->table_startx = $this->GetX();
		$this->table_starty = $this->GetY();
		$this->table_starty_origin = $this->GetY();
		$this->first_header = false;

		$this->Draw_Header_Command = false; //by default we don't draw the header
		$this->New_Page_Commit = false;		//NO we do not consider first time a new page
		$this->Data_On_Current_Page = false;
	}

	//Sets the number of columns of the table
	function Set_Table_Columns($nr){
		$this->tb_columns = $nr;
	}

	/*
	Characteristics constants for Header Type:
	EVERY CELL FROM THE TABLE IS A MULTICELL

		WIDTH - this is the cell width. This value must be sent only to the HEADER!!!!!!!!
		T_COLOR - text color = array(r,g,b);
		T_SIZE - text size
		T_FONT - text font - font type = "Arial", "Times"
		T_ALIGN - text align - "RLCJ"
		V_ALIGN - text vertical alignment - "TMB"
		T_TYPE - text type (Bold Italic etc)
		LN_SPACE - space between lines
		BG_COLOR - background color = array(r,g,b);
		BRD_COLOR - border color = array(r,g,b);
		BRD_SIZE - border size --
		BRD_TYPE - border size -- up down, with border without!!! etc
		BRD_TYPE_NEW_PAGE - border type on new page - this is user only if specified(<>'')
		TEXT - header text -- THIS ALSO BELONGS ONLY TO THE HEADER!!!!

		all these setting conform to the settings from the multicell functions!!!!
	*/

	/*
	Function: Set_Header_Type($type_arr) -- sets the array for the header type

	type array =
		 array(
			0=>array(
					"WIDTH" => 10,
					"T_COLOR" => array(120,120,120),
					"T_SIZE" => 5,
					...
					"TEXT" => "Header text 1"
				  ),
			1=>array(
					...
				  ),
		 );
	where 0,1... are the column number
	*/

	function Set_Header_Type($type_arr){
		$this->tb_header_type = $type_arr;
	}


	/*
	Characteristics constants for Data Type:
	EVERY CELL FROM THE TABLE IS A MULTICELL
		T_COLOR - text color = array(r,g,b);
		T_SIZE - text size
		T_FONT - text font - font type = "Arial", "Times"
		T_ALIGN - text align - "RLCJ"
		V_ALIGN - text vertical alignment - "TMB"
		T_TYPE - text type (Bold Italic etc)
		LN_SPACE - space between lines
		BG_COLOR - background color = array(r,g,b);
		BRD_COLOR - border color = array(r,g,b);
		BRD_SIZE - border size --
		BRD_TYPE - border size -- up down, with border without!!! etc
		BRD_TYPE_NEW_PAGE - border type on new page - this is user only if specified(<>'')
		CUT_TEXT - coupe la cellule en deux si bas de page

		all these settings conform to the settings from the multicell functions!!!!
	*/

	/*
	Function: Set_data_Type($type_arr) -- sets the array for the header type

	type array =
		 array(
			0=>array(
					"T_COLOR" => array(120,120,120),
					"T_SIZE" => 5,
					...
					"BRD_TYPE" => 1
				  ),
			1=>array(
					...
				  ),
		 );
	where 0,1... are the column number
	*/

	function Set_Data_Type($type_arr){
		$this->tb_data_type = $type_arr;
	}



	/*
	Function Set_Table_Type

	$type_arr = array(
					"BRD_COLOR"=> array (120,120,120), //border color
					"BRD_SIZE"=>5), //border line width
					"TB_COLUMNS"=>5), //the number of columns
					"TB_ALIGN"=>"L"), //the align of the table, possible values = L, R, C equivalent to Left, Right, Center
					'L_MARGIN' => 0// left margin... reference from this->lmargin values
					)
	*/
	function Set_Table_Type($type_arr){

		if (isset($type_arr['TB_COLUMNS'])) $this->tb_columns = $type_arr['TB_COLUMNS'];
		if (!isset($type_arr['L_MARGIN'])) $type_arr['L_MARGIN']=0;//default values

		$this->tb_table_type = $type_arr;

	}

	//this functiondraws the exterior table border!!!!
	function Draw_Table_Border(){
	/*				"BRD_COLOR"=> array (120,120,120), //border color
					"BRD_SIZE"=>5), //border line width
					"TB_COLUMNS"=>5), //the number of columns
					"TB_ALIGN"=>"L"), //the align of the table, possible values = L, R, C equivalent to Left, Right, Center
	*/

		if ( ! $this->tb_border_draw ) return;

		if ( ! $this->Data_On_Current_Page) return; //there was no data on the current page

		//set the colors
		list($r, $g, $b) = $this->tb_table_type['BRD_COLOR'];
		$this->SetDrawColor($r, $g, $b);

		//set the line width
		$this->SetLineWidth($this->tb_table_type['BRD_SIZE']);

		//draw the border
		if(isset($this->tb_table_type ['rounded']) && $this->tb_table_type ['rounded']){
			//Modifs MC 13/09/2013 bords arrondis
			$height= $this->GetY()-$this->table_starty;
			if($height<	$this->minHeight){
				$height=$this->minHeight;
			}

		

			$this->RoundedRect(
				$this->table_startx-1,
				$this->table_starty,
				$this->Get_Table_Width()+1,
				$height+1,
				2);
		}elseif($this->tb_table_type['BRD_SIZE']>0){
			$this->Rect(
				$this->table_startx,
				$this->table_starty,
				$this->Get_Table_Width(),
				$this->GetY()-$this->table_starty_origin);//
		}



	}

	function End_Page_Border(){
		if (isset($this->tb_table_type['BRD_TYPE_END_PAGE'])){

			if (strpos($this->tb_table_type['BRD_TYPE_END_PAGE'], 'B') >= 0){

				//set the colors
				list($r, $g, $b) = $this->tb_table_type['BRD_COLOR'];
				$this->SetDrawColor($r, $g, $b);

				//set the line width
				$this->SetLineWidth($this->tb_table_type['BRD_SIZE']);

				//draw the line
				$this->Line($this->table_startx, $this->GetY(), $this->table_startx + $this->Get_Table_Width(), $this->GetY());
			}
		}
	}

	//returns the table width in user units
	function Get_Table_Width()
	{
		//calculate the table width
		$tb_width = 0;
		for ($i=0; $i < $this->tb_columns; $i++){
			$tb_width += $this->tb_header_type[$i]['WIDTH'];
		}
		return $tb_width;
	}

	//alignes the table to C, L or R(default is L)
	function Table_Align(){
		//check if the table is aligned
		if (isset($this->tb_table_type['TB_ALIGN'])) $tb_align = $this->tb_table_type['TB_ALIGN']; else $tb_align='';

		//set the table align
		switch($tb_align){
			case 'C':
				$this->SetX($this->lMargin + $this->tb_table_type['L_MARGIN'] + ($this->PageWidth() - $this->Get_Table_Width())/2);
				break;
			case 'R':
				$this->SetX($this->lMargin + $this->tb_table_type['L_MARGIN'] + ($this->PageWidth() - $this->Get_Table_Width()));
				break;
			default:
				$this->SetX($this->lMargin + $this->tb_table_type['L_MARGIN']);
				break;
		}//if (isset($this->tb_table_type['TB_ALIGN'])){
	}

	//Draws the Header
	function Draw_Header(){
		$this->Draw_Header_Command = true;
	}

	function addTitreRubrique($lib)
	{
            // ESA 12-08-2011
            // #386 Ajout� pour faire un saut de page
          //  $this->SetAutoPageBreak(1, 50);
	    # //Arial 10
	    # $this->SetFont('Arial','',10);

		$sav_y = $this->y;

            # Arial 11 Gras
	    $this->SetFont('Arial','B',13);

	    $premiereLettre = substr($lib, 0, 1);
	    $suite = substr ($lib, 1, strlen($lib) - 1);

	    # Couleur de texte
	    $this->SetTextColor(0, 70, 150);

	    # Couleur de fond
	    $this->SetFillColor(255);

	    $this->setDrawColor(150);
	    $this->SetLineWidth(0);

	    # Premiere Lettre
	    $this->MultiCell(0,6,$premiereLettre,0,1,'L',1);

	    # Suite du texte
	    $this->SetFont('Arial','B',10);

	    # Couleur de texte
	    $this->SetTextColor(149, 147, 133);
	    $this->x = 13.5;

	    if (strpos($premiereLettre, "G") !== false) {
	    	$this->x += 0.5;
	    }

	    $this->y +=0.38;
	    $this->Write(-6 , strtoupper($suite));

	    # Saut de ligne
	    $this->Ln(4);
		
		$this->y = $sav_y + 10;
	}


	//Draws the Header
	function Draw_Header_( $next_line_height = 0 ){

		$this->Table_Align();

		$this->table_startx = $this->GetX();
		$this->table_starty = $this->GetY();
		$this->table_starty_origin = $this->GetY();

		//if the header will be showed
		if ( ! $this->tb_header_draw ) return;

		$h = 0;

		//calculate the maximum height of the cells
		for($i=0;$i<$this->tb_columns;$i++)
		{

			$this->SetFont(	$this->tb_header_type[$i]['T_FONT'],
							$this->tb_header_type[$i]['T_TYPE'],
							$this->tb_header_type[$i]['T_SIZE']);

			$this->tb_header_type[$i]['CELL_WIDTH'] = $this->tb_header_type[$i]['WIDTH'];

			if (isset($this->tb_header_type[$i]['COLSPAN'])){

				$colspan = (int) $this->tb_header_type[$i]['COLSPAN'];//convert to integer

				for ($j = 1; $j < $colspan; $j++){
					//if there is a colspan, then calculate the number of lines also with the with of the next cell
					if (($i + $j) < $this->tb_columns)
						$this->tb_header_type[$i]['CELL_WIDTH'] += $this->tb_header_type[$i + $j]['WIDTH'];
				}
			}

			$txt = $this->tb_header_type[$i]['TEXT'];
			
			$tmp = preg_match('/image\(.+\)/', $txt, $m);
			if(isset($m[0])){
				$txt =  str_replace($m[0], "", $txt);
				
			}
			$tmp = preg_match('/_LINK(.)+/', $txt, $m);
			if(isset($m[0])){
				$txt =  str_replace($m[0], "", $txt);
			}


			$this->tb_header_type[$i]['CELL_LINES'] =
			$this->NbLines($this->tb_header_type[$i]['CELL_WIDTH'],$txt);

			//this is the maximum cell height
			$h = max($h, ($this->tb_header_type[$i]['LN_SIZE'] * $this->tb_header_type[$i]['CELL_LINES']) );

//			if (isset($data[$i]['COLSPAN'])){
				//just skip the other cells
//				$i = $i + $colspan - 1;
//			}

		}

		$h_page = $h;

		# j'include le titre du tableau dans la hauteur du header pour d�termin� le changement de page
		if($this->titre_rubrique!="" && !$this->first_header){
			$h_page += 10;
		}

		$line_separateur = false;

		//Draw the cells of the row
		for($i=0; $i<$this->tb_columns; $i++)
		{
			//je regarde s'il y a une bordure a mettre sous l'ent�te
			if($this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT']>0){
				$line_separateur = $this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT'];
			}
		}

		if($line_separateur){
			$h_page += $line_separateur;
		}

		//Issue a page break first if needed
		//calculate the header hight and the next data line hight
		$this->CheckPageBreak($h_page + $next_line_height, false);

		if($this->titre_rubrique!="" && !$this->first_header){
			
			$this->addTitreRubrique($this->titre_rubrique);
		}

		//Draw the cells of the row
		for($i=0; $i<$this->tb_columns; $i++)
		{
			//border size BRD_SIZE
			$this->SetLineWidth($this->tb_header_type[$i]['BRD_SIZE']);

			//fill color = BG_COLOR
			list($r, $g, $b) = $this->tb_header_type[$i]['BG_COLOR'];
			$this->SetFillColor($r, $g, $b);

			//Draw Color = BRD_COLOR
			list($r, $g, $b) = $this->tb_header_type[$i]['BRD_COLOR'];
			$this->SetDrawColor($r, $g, $b);

			//Text Color = T_COLOR
			list($r, $g, $b) = $this->tb_header_type[$i]['T_COLOR'];
			$this->SetTextColor($r, $g, $b);

			//Set the font, font type and size
			$this->SetFont(	$this->tb_header_type[$i]['T_FONT'],
							$this->tb_header_type[$i]['T_TYPE'],
							$this->tb_header_type[$i]['T_SIZE']);

			//Save the current position
			$x=$this->GetX();
			$y=$this->GetY();

			if ($this->New_Page_Commit){
				if (isset($this->tb_header_type[$i]['BRD_TYPE_NEW_PAGE'])){
					$this->tb_header_type[$i]['BRD_TYPE'] .= $this->tb_header_type[$i]['BRD_TYPE_NEW_PAGE'];
				}
			}

			//Print the text
			$this->MultiCellTable(
					$this->tb_header_type[$i]['CELL_WIDTH'],
					$this->tb_header_type[$i]['LN_SIZE'],
					$this->tb_header_type[$i]['TEXT'],
					$this->tb_header_type[$i]['BRD_TYPE'],
					$this->tb_header_type[$i]['T_ALIGN'],
					$this->tb_header_type[$i]['V_ALIGN'],
					1,
					$h - $this->tb_header_type[$i]['LN_SIZE'] * $this->tb_header_type[$i]['CELL_LINES']
					);

			//Put the position to the right of the cell
			$this->SetXY($x+$this->tb_header_type[$i]['CELL_WIDTH'],$y);

			if (isset($this->tb_header_type[$i]['COLSPAN'])){
				$i = $i + (int)$this->tb_header_type[$i]['COLSPAN'] - 1;
			}




		}

		//Go to the next line
		$this->Ln($h);

		$line_separateur = false;

		//Draw the cells of the row
		for($i=0; $i<$this->tb_columns; $i++)
		{

			//je regarde s'il y a une bordure a mettre sous l'ent�te
			if($this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT']>0){
				$line_separateur = $this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT'];

				//Save the current position
				$x=$this->GetX();
				$y=$this->GetY();

				//fill color = BG_COLOR
				list($r, $g, $b) = $this->tb_header_type[$i]['LINE_SEPARATEUR_COLOR'];
				$this->SetFillColor($r, $g, $b);

				$this->MultiCellTable(
						$this->tb_header_type[$i]['CELL_WIDTH'],
						$this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT'],
						" ",
						"0",
						$this->tb_header_type[$i]['T_ALIGN'],
						$this->tb_header_type[$i]['V_ALIGN'],
						1,
						$h - $this->tb_header_type[$i]['LINE_SEPARATEUR_HEIGHT'] * $this->tb_header_type[$i]['CELL_LINES']
						);

				//Put the position to the right of the cell
				$this->SetXY($x+$this->tb_header_type[$i]['CELL_WIDTH'],$y);

				if (isset($this->tb_header_type[$i]['COLSPAN'])){
					$i = $i + (int)$this->tb_header_type[$i]['COLSPAN'] - 1;
				}

			}
		}

		if($line_separateur){
			//Go to the next line
			$this->Ln($line_separateur);
		}

		$this->Draw_Header_Command = false;
		$this->New_Page_Commit = false;
		$this->Data_On_Current_Page = true;
	}

	//this function Draws the data's from the table
	//have to call this function after the table initialization, after the table, header and data types are set
	//and after the header is drawed
	/*
	$header = true -> on new page draws the header
			= false - > the header is not drawed
	*/

	function Draw_Data($data, $header = true){

		$h = 0;
		$h2 = 0;

		$cut_text = false;
		$ln_size = false;


		//calculate the maximum height of the cells
		for($i=0; $i < $this->tb_columns; $i++)
		{

			if (!isset($data[$i]['T_FONT'])) $data[$i]['T_FONT'] = $this->tb_data_type[$i]['T_FONT'];
			if (!isset($data[$i]['T_TYPE'])) $data[$i]['T_TYPE'] = $this->tb_data_type[$i]['T_TYPE'];
			if (!isset($data[$i]['T_SIZE'])) $data[$i]['T_SIZE'] = $this->tb_data_type[$i]['T_SIZE'];
			if (!isset($data[$i]['T_COLOR'])) $data[$i]['T_COLOR'] = $this->tb_data_type[$i]['T_COLOR'];
			if (!isset($data[$i]['T_ALIGN']) || $data[$i]['T_ALIGN'] == "") $data[$i]['T_ALIGN'] = $this->tb_data_type[$i]['T_ALIGN'];
			if (!isset($data[$i]['V_ALIGN'])) $data[$i]['V_ALIGN'] = $this->tb_data_type[$i]['V_ALIGN'];
			if (!isset($data[$i]['LN_SIZE'])){ $data[$i]['LN_SIZE'] = $this->tb_data_type[$i]['LN_SIZE'];}
			if (!isset($data[$i]['PADDING']) && isset($this->tb_data_type[$i]['PADDING'])) $data[$i]['PADDING'] = $this->tb_data_type[$i]['PADDING'];
			if (!isset($data[$i]['BRD_SIZE'])) $data[$i]['BRD_SIZE'] = $this->tb_data_type[$i]['BRD_SIZE'];
			if (!isset($data[$i]['BRD_COLOR'])) $data[$i]['BRD_COLOR'] = $this->tb_data_type[$i]['BRD_COLOR'];
			if (!isset($data[$i]['BRD_TYPE'])) $data[$i]['BRD_TYPE'] = $this->tb_data_type[$i]['BRD_TYPE'];
			if (!isset($data[$i]['BG_COLOR'])) $data[$i]['BG_COLOR'] = $this->tb_data_type[$i]['BG_COLOR'];
			if (!isset($data[$i]['CUT_TEXT'])){ $data[$i]['CUT_TEXT'] = $this->tb_data_type[$i]['CUT_TEXT']; $cut_text = $this->tb_data_type[$i]['CUT_TEXT'];}

  
			$ln_size = $data[$i]['LN_SIZE'];

			$this->SetFont(	$data[$i]['T_FONT'],
							$data[$i]['T_TYPE'],
							$data[$i]['T_SIZE']);

			$data[$i]['CELL_WIDTH'] = $this->tb_header_type[$i]['WIDTH'];

			if (isset($data[$i]['COLSPAN'])){

				$colspan = (int) $data[$i]['COLSPAN'];//convert to integer

				for ($j = 1; $j < $colspan; $j++){
					//if there is a colspan, then calculate the number of lines also with the with of the next cell
					if (($i + $j) < $this->tb_columns)
						$data[$i]['CELL_WIDTH'] += $this->tb_header_type[$i + $j]['WIDTH'];
				}
			}

			$txt = $data[$i]['TEXT'];
			
			$tmp = preg_match('/image\(.+\)/', $txt, $m);
			if(isset($m[0])){
				$txt =  str_replace($m[0], "", $txt);
			}
			
			if($txt != strip_tags($txt)) {
				$data[$i]['CELL_LINES'] = $this->NbLines(190, $txt, true);
			}else{
				$data[$i]['CELL_LINES'] = $this->NbLines($data[$i]['CELL_WIDTH'], $txt);
			}

			//this is the maximum cell heightXS
			$h = max($h, $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES'] );

			if (isset($data[$i]['COLSPAN'])){
				//just skip the other cells
				$i = $i + $colspan - 1;
			}

		}

		$text_coupe = false;
		
		$i_cut = 0;
		$h2 = $h;
		$h3 = $h;

			//echo "<br/>---"." "." ".($this->GetY()+$h)." > ".$this->PageBreakTrigger."<br/>";
			/*echo "<br/>---";
			echo $this->FontSize." ".$data[0]['CELL_LINES']." +  ". substr($data[0]['TEXT'], 0, 50);
			echo "<br/>".$i_cut."---"." "." ".($this->GetY()."+".$h2)." > ".$this->PageBreakTrigger."<br/>";*/
		while($cut_text && ($this->GetY()+$h3) > $this->PageBreakTrigger){
			//OPT CUT_TEXT : si le texte ne tient pas sur la page, je coupe le texte en deux lignes de cellules au lieu de passer � la page suivante

			$h2 = $h3;

			//hauteur restante : 
			$h_trop = ($this->GetY()+$h2) - $this->PageBreakTrigger;
			$decimal = intval(substr($h_trop, strpos($h_trop, '.')+1))>0;
			if($decimal>0)
				$h_trop = round($h_trop) +1;
			//hauteur de la cellule - ce qui ne rentre pas sur la page
			$h_rest = $h2 - $h_trop;
			//echo $data[0]['CELL_LINES']." ". substr($data[0]['TEXT'], 0, 20)." "." ".$h_trop." ".$h."<br/>";
			$lines_rest = 0;

			if($ln_size>0)
				$lines_rest = ($h_rest / ($ln_size)	);

				$decimal = intval(substr($lines_rest, strpos($lines_rest, '.')+1))>0;
				if($decimal>0)
					$lines_rest = round($lines_rest) -3;
				//echo "lines rest : "	.$lines_rest."( ".$h_rest." / ".$ln_size.")<br>";

			if($lines_rest>0){
				$txt_restant = array();
				//Draw the cells of the row
				$data2 = $data;

				$h2 = 0;
				$h3 = 0;
				//Je coupe les textes et recalcule la hauteur max
				for($i=0;$i<$this->tb_columns;$i++)
				{
					if(isset($data2[$i]['CELL_WIDTH'])){
						//je coupe la chaine grace aux nombre de ligne
						$txt1 = $data2[$i]['TEXT'];

						if($txt != strip_tags($txt)) {
							$data2[$i]['TEXT'] =  $this->cutTxt(180, $txt1, $lines_rest, true);
						}else{
							$data2[$i]['TEXT'] =  $this->cutTxt($data2[$i]['CELL_WIDTH'], $txt1, $lines_rest);
						}
						
						if($txt != strip_tags($txt)) {
							$data2[$i]['CELL_LINES'] = $this->NbLines(190, $data2[$i]['TEXT'], true);
						}else{
							$data2[$i]['CELL_LINES'] = $this->NbLines($data2[$i]['CELL_WIDTH'], $data2[$i]['TEXT']);
						}
	
						$data[$i]['TEXT'] = str_replace("\r",'',$data[$i]['TEXT']);
											
						$data[$i]['TEXT'] = str_replace("\r",'',$data[$i]['TEXT']);
						$data[$i]['TEXT'] = str_replace("\t",'',$data[$i]['TEXT']);
						$data[$i]['TEXT'] = str_replace("\n",'',$data[$i]['TEXT']);
						$data[$i]['TEXT'] = substr($data[$i]['TEXT'], strlen($data2[$i]['TEXT']) );

						if($txt != strip_tags($txt)) {
							$data[$i]['CELL_LINES'] = $this->NbLines(190, $data[$i]['TEXT'], true);
						}else{
							$data[$i]['CELL_LINES'] = $this->NbLines($data[$i]['CELL_WIDTH'], $data[$i]['TEXT']);
						}

						//this is the maximum cell height
						$h2 = max($h2, $data2[$i]['LN_SIZE'] * $data2[$i]['CELL_LINES']);
						$h3 = max($h3, $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES']);
					}
				}
				//$h = $h2;
				
				$this->Table_Align();

				//j'affiche la 1ere lignes de cellules
				for($i=0;$i<$this->tb_columns;$i++)
				{
					$this->draw_data_cellule($data2, $i, $h2);
				}

				//Go to the next line
				$this->Ln($h2+10);

				$text_coupe = true;
					
				$i_cut++;
				$this->CheckPageBreak($h3, $header);

				if ($this->Draw_Header_Command){//draw the header
					$this->Draw_Header_();
					$this->first_header = true;			
					$this->table_starty = $this->GetY();
					$this->table_starty_origin += 5;
				}

				$this->Table_Align();
			
				/*echo "cut".$h3."<br/>";
				echo "<br/>---";
				echo $this->FontSize." ".$data[0]['CELL_LINES']." +  ". substr($data[0]['TEXT'], 0, 50);
				echo "<br/>".$i_cut."---"." "." ".($this->GetY()."+".$h3)." > ".$this->PageBreakTrigger."<br/>";
*/
			}else{
				break;
			}
		}

		$this->CheckPageBreak($h3, $header);

		if ($this->Draw_Header_Command){//draw the header
			$this->Draw_Header_($h3);
			$this->first_header = true;			
			$this->table_starty = $this->GetY();
			$this->table_starty_origin += 5;
		}

		$this->Table_Align();
		
		//si le texte a �t� coup�, je recalcule la hauteur
		if($text_coupe){
			$h = 0;
			for($i=0;$i<$this->tb_columns;$i++)
			{
				if(isset($data[$i]['CELL_WIDTH'])){
					$txt = $data[$i]['TEXT'];
					
					$tmp = preg_match('/image\(.+\)/', $txt, $m);
					if(isset($m[0])){
						$txt =  str_replace($m[0], "", $txt);
					}

					$tmp = preg_match('/_LINK(.)+/', $txt, $m);
					if(isset($m[0])){
						$txt =  str_replace($m[0], "", $txt);
					}

					if($txt != strip_tags($txt)) {
						$data[$i]['CELL_LINES'] = $this->NbLines(190, $data[$i]['TEXT'], true);
					}else{
						$data[$i]['CELL_LINES'] = $this->NbLines($data[$i]['CELL_WIDTH'], $data[$i]['TEXT']);
					}

					//this is the maximum cell height
					$h = max($h, $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES']);
				}
			}
		}

		//Draw the cells of the row
		for($i=0;$i<$this->tb_columns;$i++)
		{
			$this->draw_data_cellule($data, $i, $h);
		}

		$this->Data_On_Current_Page = true;

		//Go to the next line
		$this->Ln($h);
	}

	function draw_data_cellule(&$data, &$i, $h){
			//border size BRD_SIZE
			$this->SetLineWidth($data[$i]['BRD_SIZE']);

			//fill color = BG_COLOR
			list($r, $g, $b) = $data[$i]['BG_COLOR'];
			$this->SetFillColor($r, $g, $b);

			//Draw Color = BRD_COLOR
			list($r, $g, $b) = $data[$i]['BRD_COLOR'];
			$this->SetDrawColor($r, $g, $b);

			//Text Color = T_COLOR
			list($r, $g, $b) = $data[$i]['T_COLOR'];
			$this->SetTextColor($r, $g, $b);

			//Set the font, font type and size
			$this->SetFont(	$data[$i]['T_FONT'],
							$data[$i]['T_TYPE'],
							$data[$i]['T_SIZE']);

			//Save the current position
			$x=$this->GetX();
			$y=$this->GetY();
			if(isset($data[$i]['PADDING'])){
				$this->x = $this->x+$data[$i]['PADDING'];
			}
			if(isset($data[$i]['PADDING'])){
				$data[$i]['CELL_WIDTH'] = $data[$i]['CELL_WIDTH']-($data[$i]['PADDING']*2);
			}

			//print the text
			if($data[$i]['TEXT']=="ROWSPAN2"){
					
					$sav_x = $this->x;
					$sav_y = $this->y;

					list($r, $g, $b) = $data[$i]['BRD_COLOR'];
					$this->SetDrawColor($r, $g, $b);
					$this->SetLineWidth($data[$i]['BRD_SIZE']);
					$brd = str_replace("T", "", $data[$i]['BRD_TYPE']);
					$this->MultiCellTable(
						$data[$i]['CELL_WIDTH'],
						$data[$i]['LN_SIZE'],
						" ",
						$brd,
						$data[$i]['T_ALIGN'],
						$data[$i]['V_ALIGN'],
						1,
						$h - $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES']
						);

					//affichage d'une ligne blanche pour masquer les bordures
					$this->SetLineWidth($data[$i]['BRD_SIZE']+0.1);
					list($r, $g, $b) = $data[$i]['BG_COLOR'];
					$this->SetDrawColor($r, $g, $b);
					$this->Line($sav_x+0.2, $sav_y, $sav_x+$data[$i]['CELL_WIDTH']-0.1, $sav_y);

			}else{
				$this->MultiCellTable(
						$data[$i]['CELL_WIDTH'],
						$data[$i]['LN_SIZE'],
						$data[$i]['TEXT'],
						$data[$i]['BRD_TYPE'],
						$data[$i]['T_ALIGN'],
						$data[$i]['V_ALIGN'],
						1,
						$h - $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES']
						);
			}

			//Put the position to the right of the cell
			$this->SetXY($x + $data[$i]['CELL_WIDTH'],$y);

			//if we have colspan, just ignore the next cells
			if (isset($data[$i]['COLSPAN'])){
				$i = $i + (int)$data[$i]['COLSPAN'] - 1;
			}
	}

	//if the table is bigger than a page then it jumps to next page and draws the header
	/*
	$h = is the height that if is overriden than the document jumps to a new page
	$header = true/false = this specifies at a new page we write again the header or not. This variable
	is used at the moment when the header draw makes the new page jump
	*/

	function CheckPageBreak($h, $header = true)
	{
		//If the height h would cause an overflow, add a new page immediately
		if($this->GetY()+$h > $this->PageBreakTrigger){

			$this->Draw_Table_Border();//draw the table border

			$this->End_Page_Border();//if there is a special handling for end page??? this is specific for me

			$this->AddPage($this->CurOrientation);//add a new page

			$this->Data_On_Current_Page = false;

			$this->New_Page_Commit = true;//new page commit

			$this->table_startx = $this->GetX();
			$this->table_starty = $this->GetY();
			$this->table_starty_origin = $this->GetY();
			if ($header) $this ->Draw_Header();//if we have to draw the header!!!
		}

		//align the table
		$this->Table_Align();
	}

	/**   This method returns the number of lines that will a text ocupy on the specified width
	      Call:
	      @param
	                        $w - width
	                        $txt - text
	      @return           number
	*/
	function NbLines($w,$txt, $html = false)
	{
		//Computes the number of lines a MultiCell of width w will take
		$cw=&$this->CurrentFont['cw'];
		if($w==0)
			$w=$this->w-$this->rMargin-$this->x;
		$wmax=($w-2*$this->cMargin)*1000/($this->FontSize);
		$s=str_replace("\r",'',$txt);
		if($html){
			$wmax=($w-2*$this->cMargin)*1000/($this->FontSize+0.1);
			$s=str_replace("\t",'',$s);
			$s=str_replace("\n",'',$s);
		}
		$nb=strlen($s);
		if($nb>0 and $s[$nb-1]=="\n")
			$nb--;
		$sep=-1;
		$i=0;
		$j=0;
		$l=0;
		$nl=1;
		while($i<$nb)
		{
			$c=$s[$i];
			if($c=="\n" || ($html && ((isset($s[$i-5]) && $s[$i-5].$s[$i-4].$s[$i-3].$s[$i-2].$s[$i-1].$c=="<br />")
							|| (isset($s[$i-3]) && $s[$i-3].$s[$i-2].$s[$i-1].$c=="</p>") || (isset($s[$i-4]) && $s[$i-4].$s[$i-3].$s[$i-2].$s[$i-1].$c=="</li>")
				|| (isset($s[$i-4]) && $s[$i-4].$s[$i-3].$s[$i-2].$s[$i-1].$c=="</ul>") ) ))
			{
				$i++;
				$sep=-1;
				$j=$i;
				$l=0;
				$nl++;
				continue;
			}
			if($c==' ')
				$sep=$i;
			$l+=$cw[$c];
			if($l>$wmax)
			{
				if($sep==-1)
				{
					if($i==$j)
						$i++;
				}
				else
					$i=$sep+1;
				$sep=-1;
				$j=$i;
				$l=0;
				$nl++;
			}
			else
				$i++;
		}
		return $nl;
	}

	 //Coupe le text d'une multicell en fonction du nombre de ligne
	 function cutTxt($w, $txt, $nbre_ligne_max, $html = false) {
			$cw=&$this->CurrentFont['cw'];
			if($w==0)
				$w=$this->w-$this->rMargin-$this->x;
			$wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
			$s=str_replace("\r",'',$txt);
			if($html){
				$wmax=($w-2*$this->cMargin)*1000/($this->FontSize+0.1);
				$s=str_replace("\t",'',$s);
				$s=str_replace("\n",'',$s);
			}
			$nb=strlen($s);
			if($nb>0 and $s[$nb-1]=="\n")
				$nb--;
			$sep=-1;
			$i=0;
			$j=0;
			$l=0;
			$nl=1;
			while($i<$nb)
			{
				$c=$s[$i];
				if($c=="\n" || ($html && ((isset($s[$i-5]) && $s[$i-5].$s[$i-4].$s[$i-3].$s[$i-2].$s[$i-1].$c=="<br />")
							|| (isset($s[$i-3]) && $s[$i-3].$s[$i-2].$s[$i-1].$c=="</p>") )) )
				{
					$i++;
					$sep=-1;
					$j=$i;
					$l=0;
					$nl++;
					if($nl >= $nbre_ligne_max){
						return substr($s, 0, $i);
					}
					continue;
				}
				if($c==' ')
					$sep=$i;
				$l+=$cw[$c];
				if($l>$wmax)
				{
					if($sep==-1)
					{
						if($i==$j)
							$i++;
					}
					else
						$i=$sep+1;
					$sep=-1;
					$j=$i;
					$l=0;
					$nl++;
					if($nl >= $nbre_ligne_max){
						return substr($s, 0, $i-1);
					}
				}
				else
					$i++;

			}
			return $nl;
	 }
		

	/**   This method allows printing text with line breaks.
	      It works like a modified MultiCell
	      Call:
	      @param
	                        $w - width
	                        $h - line height
	                        $txt - the outputed text
	                        $border - border(LRTB 0 or 1)
	                        $align - horizontal align 'JLR'
	                        $fill - fill (1/0)
	                        $vh - vertical adjustment - the Multicell Height will be with this VH Higher!!!!
	                        $valign - Vertical Alignment - Top, Middle, Bottom
	      @return           nothing
	*/
	function MultiCellTable($w, $h, $txt, $border=0, $align='J', $valign='T', $fill=0, $vh=0)
	{

		$b1 = '';//border for top cell
		$b2 = '';//border for middle cell
		$b3 = '';//border for bottom cell

		if($border)
		{
			if($border==1)
			{
				$border = 'LTRB';
				$b1 = 'LRT';//without the bottom
				$b2 = 'LR';//without the top and bottom
				$b3 = 'LRB';//without the top
			}
			else
			{
				$b2='';
				if(is_int(strpos($border,'L')))
					$b2.='L';
				if(is_int(strpos($border,'R')))
					$b2.='R';
				$b1=is_int(strpos($border,'T')) ? $b2.'T' : $b2;
				$b3=is_int(strpos($border,'B')) ? $b2.'B' : $b2;

			}
		}

		switch ($valign){
			case 'T':
				$wh_T = 0;//Top width
				$wh_B = $vh - $wh_T;//Bottom width
				break;
			case 'M':
				$wh_T = $vh/2;
				$wh_B = $vh/2;
				break;
			case 'B':
				$wh_T = $vh;
				$wh_B = 0;
				break;
			default://default is TOP ALIGN
				$wh_T = 0;//Top width
				$wh_B = $vh - $wh_T;//Bottom width
		}

		//save the X position
		$x = $this->x;
		/*
			if $wh_T == 0 that means that we have no vertical adjustments so I will skip the cells that
			draws the top and bottom borders
		*/

		if ($wh_T != 0)//only when there is a difference
		{
			//draw the top borders!!!
			$this->Cell($w,$wh_T,'',$b1,2,$align,$fill);
		}

		$b2 = is_int(strpos($border,'T')) && ($wh_T == 0) ? $b2.'T' : $b2;
		$b2 = is_int(strpos($border,'B')) && ($wh_B == 0) ? $b2.'B' : $b2;

		#gestion de code HTML pour les remarques
		if($txt != strip_tags($txt)) {
			// contains HTML
			$sav_x = $this->x;
			$sav_y = $this->y;
			$this->y = $this->y+1;
			$txt = '<div style="text-align:justify;">'.$txt."</div>";
			$txt=str_replace("\r",'',$txt);
			$txt=str_replace("\t",'',$txt);
			$txt=str_replace("\n",'',$txt);
			$nb = $this->NbLines(190, $txt, true);
			//$this->Rect($sav_x, $sav_y, $w,(5*$nb)-0.03, ($fill ? "FD" : "D"));
			if($vh!="")
				$this->Rect($sav_x, $sav_y, $w,($vh)-0.03, ($fill ? "FD" : "D"));
			else
				$this->Rect($sav_x, $sav_y, $w,(5*$nb)-0.03, ($fill ? "FD" : "D"));
			//echo substr($txt, 0, 50)."<br />";
			$this->WriteHTML($txt);

			//Attention sur la remarque ne tient pas sur une page

		}else{

			//je regarde s'il y a des images dans la cellules
			$t_image=array();
			$h_image=0;
				// Pour pr�ciser une hauteur de cellule diff�rente, il faut utiliser la balise de type [H5]
				//$tmp = preg_match('/\(\s*)image\([a-zA-Z\.\'\"]+,[ ]*[0-9]+,[ ]*[0-9]+,[ ]*[0-9]+,[ ]*[0-9]+,[ ]*[a-zA-Z\.\.\'\"]+,[ ]*[a-zA-Z\.\.\'\"]+ \)(\s*)/', $txt, $m);

				$tmp = preg_match('/image\(.+\)/', $txt, $m);
				/*if(isset($m[0])){echo $m[0]."<br />";
				}
				$tmp = preg_match('/image\([\\a-zA-Z0-9:_\/\.]+,([0-9\.])+,([0-9\.])+,([0-9\.])+(,[\\a-zA-Z0-9\':_\/\.]){0,3}\)/', $txt, $m);*/
				if(isset($m[0])){
				
					$text_tmp = str_replace("image(", "", $m[0]);
					$text_tmp = substr( $text_tmp, 0, -1);

					$t = preg_split("/[\s,]+/", $text_tmp);
					if(isset($t[1])){
						if(!isset($t[4])){
							$t[4]='';
							$t[5]='';
							$t[6]='';
						}
						if(!isset($t[5])){
							$t[5]='';
							$t[6]='';
						}

						//type vide
						if($t[5]=="''")
							$t[5]="";

					
						if(strpos($m[0], "tmpUploads")!==FALSE){
							$h_image+=$t[4];
							$h+=$t[4];
						}


						//$this->Image($t[0], $t[1], $t[2], $t[3], $t[4], $t[5], $t[6]);
						#$pdf->Image($logoPdf, 11, $pdf->getY()-3.5, 3,0,'',$urlPdf);
						$t[1] = $this->x+1;
						$t[2] = $this->y+1;

						if(strpos($m[0], "arrow_up")!==FALSE){
							$t[1] = $this->x+3;
							$t[2] = $this->y+3;
						}
						

						//$this->Image($t[0], $this->x, $this->y+1, $t[3], $t[4], $t[5], $t[6]);
						$t_image[]=$t;

						#$this->x = $sav_x;
						#$this->y = $sav_y;
					}
					$txt =  str_replace($m[0], "", $txt);
				}

				// Lien dans le texte
				$tmp = preg_match('/_LINK(.)+/', $txt, $m);
				if(isset($m[0])){
					$text_tmp = str_replace("_LINK", "", $m[0]);
					$link = substr( $text_tmp, 0, -1);

					$txt =  str_replace($m[0], "", $txt);
					$this->Cell($w,$h,$txt,($b2=="" ? 0 : $b2), 0,$align,$fill, $link);
				}else{

					#$sav_x = $this->x;
					#$sav_y = $this->y;

					$this->MultiCell($w,$h,$txt,($b2=="" ? 0 : $b2),$align,$fill);
				}

				foreach($t_image as $t){
					$this->Image($t[0], $t[1], $t[2], $t[3], $t[4], $t[5], $t[6]);
					//$this->y = $t[4];
				}

		}


		if ($wh_B != 0){//only when there is a difference

			//go to the saved X position
			//a multicell always runs to the begin of line
			$this->x = $x;

			$this->Cell($w, $wh_B, '', $b3, 2, $align,$fill);

			$this->x=$this->lMargin;
		}

	}	
	
	
	
	
	
	
	
	
	//***************************************************************************************************************
	//  LES FONCTIONS AJOUTEES PAR JC CORNIC
	//***************************************************************************************************************

	function setRepere($titre, $posX, $posY, $sizeX, $sizeY, $datasX, $datasY, $droites)
	{

		$espaceX=25;
		$espaceY=30;

		// Si le min=max alors on change le nombre de d�coupage d'ordonn�e
		if ($datasY[0] == $datasY[1])
			if ($datasY[0] == 0) $datasY[2] = 0;
			else $datasY[2] = 1;

		// Le titre
		$this->SetXY($posX+$espaceX, $posY - 10);
		$this->Cell($sizeX , 10, $titre, 0, 2, "C");

		if (($datasY[1]-$datasY[0]) != 0)
			$ratioY = $sizeY/($datasY[1]-$datasY[0]);
		else $ratioY = abs($sizeY/(2*$datasY[0]));
		
		if ($datasY[0] < 0)
			$decalageYNeg = $datasY[0]*$ratioY;
		else $decalageYNeg = 0;


		$this->SetDrawColor(0, 0, 0);
		$this->Line($posX+$espaceX, $posY+$sizeY+$decalageYNeg, $posX+$espaceX+$sizeX, $posY+$sizeY+$decalageYNeg); // X
		$this->Line($posX+$espaceX, $posY+$sizeY, $posX+$espaceX, $posY); // Y

		$this->SetTextColor(0,0,0);
		// Pour l'axe des X
		switch (count($datasX))
		{
			case 1:
				// Mettre la valeur au milieu de l'axe	
				$this->SetXY($posX+$espaceX, $posY + $sizeY);
				$this->Cell($sizeX, 10, $datasX[0], 0, 1, "C");
			
			break;
			case 2:
				// Mettre les deux valeurs en d�but et fin d'axe	
				$this->Text($posX+$espaceX, $posY + $sizeY + 10, $datasX[0]);	
				$this->Text($posX+$espaceX + $sizeX, $posY + $sizeY + 10, $datasX[1]);	
			break;
			default:
			break;
		}

		// Pour l'axe des Y
		$yPos = $posY + $sizeY;
		$xPos = $posX+$espaceX - 12;
		$value = $datasY[0];
		$yInter = $sizeY / $datasY[2];
		$valueInter = ($datasY[1] - $datasY[0]) / $datasY[2];

		if ($datasY[2] == 5) //**** minY et maxY diff�rents ****//
			for ($i=0 ; $i <= $datasY[2] ; $i++)
			{
				// Mettre les $i valeurs entre le d�but et la fin de l'axe
				$this->Text($xPos, $yPos, $value);
		
				// Mettre les petites barres correspondantes...
				$this->Line($posX+$espaceX-2, $yPos, $posX+$espaceX+2, $yPos);
			
				$yPos -= $yInter;
				
				if ($i==4) $value=$datasY[1];
				else $value += $valueInter;
			}
		else //**** minY et maxY �gaux --> 1 ou 2 intervalles au lieu de 5
		{
			//**** Droite horizontale y=0
			if ($datasY[0] == 0)
			{
				$this->Text($xPos, $yPos, $value);
				$this->Line($posX-2, $yPos, $posX+2, $yPos);		
			}
			else //**** Droite horizontale y=$datasY[0]
			{
				if ($datasY[0] <0)
				{
					//**** Y=$datasY[0] < 0
					$this->Text($xPos, $yPos, $value);
					$this->Line($posX-2, $yPos, $posX+2, $yPos);		
					
					$yPos -= $yInter/2;
					$value = 0;
					
					//**** Y=0
					$this->Text($xPos, $yPos, $value);
					$this->Line($posX-2, $yPos, $posX+2, $yPos);		
				}
				else	
				{
					//**** Y=0
					$this->Text($xPos, $yPos, $value);
					$this->Line($posX-2, $yPos, $posX+2, $yPos);		
		
					//**** Y=$datasY[0] > 0
					$this->Text($xPos, $yPos, $value);
					$this->Line($posX-2, $yPos, $posX+2, $yPos);		
				}		
			}
		}

		// Et on y met les droites...	
		$legendX = $posX+$espaceX + $sizeX/2;
		$legendY = $posY + $sizeY + 20;
		for ($i=0 ; $i<count($droites) ; $i++)
		{
			
//			$j=4*$i+1;
//			$k=4*$i+2;
//			$col=4*$i+3;
//			$l=4*$i+4;

			if ($datasY[0] != $datasY[1])
			{
				$y1 = $posY+$sizeY - ( ($droites[$i][0]-$datasY[0])*$sizeY/($datasY[1]-$datasY[0]));
				$y2 = $posY+$sizeY - ( ($droites[$i][1]-$datasY[0])*$sizeY/($datasY[1]-$datasY[0]));
			}
			else
			{
				$y1 = $posY+$sizeY;
				$y2 = $posY+$sizeY;
			}


			$this->SetDrawColor($droites[$i][2][0], $droites[$i][2][1], $droites[$i][2][2]);
			$this->Line($posX+$espaceX, $y1, $posX+$sizeX, $y2);
			
			// ajouter la l�gende si elle doit �tre
			if ($droites[$i][3] != "")
			{
				$this->Line($legendX - 20, $legendY, $legendX - 3, $legendY);
				
				$this->SetTextColor($droites[$i][2][0], $droites[$i][2][1], $droites[$i][2][2]);
				$this->Text($legendX, $legendY, $droites[$i][3]);
				$legendY += 5;
			}
		}	

		// Et on encadre le repere...
		$this->SetDrawColor(0,0,0);
		$espace_Y = 15;
		$this->Line($posX, $posY - $espace_Y, $posX+$espaceX + $sizeX + $espaceX, $posY - $espace_Y); // -Y
		$this->Line($posX+$espaceX + $sizeX + $espaceX, $posY - $espace_Y, $posX+$espaceX + $sizeX + $espaceX, $posY + $sizeY + $espaceY); // +X
		$this->Line($posX+$espaceX + $sizeX + $espaceX, $posY + $sizeY + $espaceY, $posX, $posY + $sizeY + $espaceY); // +Y
		$this->Line($posX, $posY + $sizeY + $espaceY, $posX, $posY - $espace_Y); // -X
	}

	//***********************************************************************************************************
	// Pour �crire un texte dans ue case... [BUI] pour le style de la police et [[LCR]] pour le centrage �ventuel
	// Par d�fault, le texte sera normal et � gauche...
	// Fonction destin�e � dessiner un tableau dans un file.pdf
	function drawTableau(&$pdf, $titre_rubrique, $tableType, $headerType, $headerDatas, $datasType, $datas, $minHeight="")
	{
		$nbCol = count($headerDatas)/2;


		//we initialize the table class
		$pdf->Table_Init($nbCol, true, true);
		$this->minHeight=$minHeight;
		$this->titre_rubrique=$titre_rubrique;
		
		//***************************************************************************
		//TABLE HEADER SETTINGS
		//***************************************************************************
		$table_subtype = $tableType;
		$pdf->Set_Table_Type($table_subtype);

		for($i=0; $i<$nbCol; $i++) 
		{
			$header_type[$i] = $headerType;
			$header_type[$i]['WIDTH'] = $headerDatas[$i];

			// Les contenus
			$j = $nbCol+$i;
			$header_type[$i]['TEXT'] = $headerDatas[$j];

			// Si une donn�e == 0 alors on affiche rien...
			if ($header_type[$i]['TEXT'] != "0") ;
			else $header_type[$i]['TEXT'] = "";
			
			// par d�faut, le texte est centr� � gauche, non italic, non soulign� et non gras.
			// par d�faut, les cellules ne sont pas fusionn�es.
			$header_type[$i]['T_TYPE'] = '';
			$header_type[$i]['T_ALIGN'] = '';		
			$header_type[$i]['COLSPAN'] = "1";
		}

		// Si l'utilisateur veut un alignement sp�cifique pour la premi�re colonne. Sinon, T_ALIGN  prend le dessus...
		if (isset($headerType['T_ALIGN_COL0']))
			$header_type[0]['T_ALIGN'] = $headerType['T_ALIGN_COL0'];

		// Si l'utilisateur veut un fond color� sp�cifique  pour la premi�re colonne. Sinon, BG_COLOR  prend le dessus...
		if (isset($headerType['BG_COLOR_COL0']))
			$header_type[0]['BG_COLOR'] = $headerType['BG_COLOR_COL0'];
				
		// Si l'utilisateur pr�cise un type ou un alignement pour une cellule pr�cise du tableau, on l'applique ici
		// Il faut utiliser les balises [I], [B], [U] pour Italic, Bold et Underline
		// Il faut utiliser les balises [L], [C], [R] pour left, centered et rigth
		for($i=0; $i<$nbCol; $i++) 
		{
			if (sscanf($header_type[$i]['TEXT'], "[%[a-zA-Z]]%s", $balise, $reste) != 0)
			{
				//echo "balise = " . $balise;
				if ( (strpos($balise, "I")===FALSE) && (strpos($balise, "B")===FALSE) && (strpos($balise, "U")===FALSE)
				  && (strpos($balise, "L")===FALSE) && (strpos($balise, "C")===FALSE) && (strpos($balise, "R")===FALSE)
				  && (strpos($balise, "T")===FALSE) && (strpos($balise, "G")===FALSE) && (strpos($balise, "N")===FALSE)  )
					; // Mauvaise balise ou l'utilisateur veut mettre des crochets dans son tableau, c'est son droit...
				else
				{
					//echo "balise = " . $balise . "<br>";
					// On teste les diff�rentes balises pour ajuster la cellule.
					if (strpos($balise, "I") === FALSE) ;
					else $header_type[$i]['T_TYPE'] .= 'I';
					if (strpos($balise, "B") === FALSE) ;
					else $header_type[$i]['T_TYPE'] .= 'B';
					if (strpos($balise, "U") === FALSE) ;
					else $header_type[$i]['T_TYPE'] .= 'U';
					if (strpos($balise, "L") === FALSE) ;
					else $header_type[$i]['T_ALIGN'] .= 'L';
					if (strpos($balise, "C") === FALSE) ;
					else $header_type[$i]['T_ALIGN'] .= 'C';
					if (strpos($balise, "R") === FALSE) ;
					else $header_type[$i]['T_ALIGN'] .= 'R';

					
					//modif MC 13/09/2013 pour les bordures : T pour bordure right, G pour bordure bottom , N : pas de bordure
					if (strpos($balise, "T") !== FALSE || strpos($balise, "G") !== FALSE   || strpos($balise, "N") !== FALSE){
						 $header_type[$i]['BRD_TYPE'] = '';
						if (strpos($balise, "T") === FALSE) ;
						else $header_type[$i]['BRD_TYPE'] .= 'R';
						if (strpos($balise, "G") === FALSE) ;
						else $header_type[$i]['BRD_TYPE'] .= 'B';
					}

				}
				
				// On supprime la balise du texte de la cellule...
				$header_type[$i]['TEXT'] = str_replace("[".$balise."]", "", $header_type[$i]['TEXT']);
			}
		}
		// Si l'utilsateur ne veut pas de header pour son tableau, il met NULL dans la premiere cellule...
		if ($header_type[0]['TEXT'] == NULL)
		{
			for($i=0; $i<$nbCol; $i++)
			{
				$header_type[$i]['LN_SIZE'] = 0;
				$header_type[$i]['TEXT'] = "";
			}
		}
		

		// Test si l'utilisateur veut fusionner DEUX cellules dans le header de son tableau. Il doit mettre "COLSPAN2" dans la premi�re cellule � fusionner.
		for($i=0 ; $i<$nbCol ; $i++)
		{
			$k=$nbCol+$i;
			$i_1 = $i-1;
			/*if ( ($k<count($headerDatas)) && ($headerDatas[$k] === "COLSPAN2") )
			{
				$header_type[$i_1]['COLSPAN'] = "2";
				$header_type[$i]['TEXT']= "";
			}*/
			 if ( ($k<count($headerDatas)) && ($pos=strpos($headerDatas[$k], "COLSPAN")) !== false )
			{
				$header_type[$i_1]['COLSPAN'] = substr($headerDatas[$k], 7);
				$header_type[$i]['TEXT']= "";
			}
		}

		//set the header type
		$pdf->Set_Header_Type($header_type);
		$pdf->Draw_Header();
		
		//***************************************************************************
		//TABLE DATA SETTINGS
		//***************************************************************************		
		$data_type = Array();//reset the array
		for ($i=0; $i<$nbCol; $i++) $data_type[$i] = $datasType;
		$pdf->Set_Data_Type($data_type);
		
		//*********************************************************************
		// Ce qui suit est valable pour toutes les cellules du tableau (hors header bien entendu).
		//*********************************************************************
		$data = Array();
		for ($i=0 ; $i<count($datas) ; $i+=$nbCol)
		{
			//*********************************************************************
			// Ce qui suit est valable pour la premi�re colonne du tableau
			//*********************************************************************
			// si l'utilisateur a pr�cis� un alignement pour la premi�re colonne, on l'applique ici
			if (isset($datasType['T_ALIGN_COL0']))
				$data[0]['T_ALIGN'] = $datasType['T_ALIGN_COL0'];
				
			// Si l'utilisateur a pr�cis� une couleur de fond pour la premi�re colonne, on l'applique ici.
			if (isset($datasType['BG_COLOR_COL0']))
				$data[0]['BG_COLOR'] = $datasType['BG_COLOR_COL0'];
				
			for ($j=$i ; $j<$i+$nbCol ; $j++)
			{
				$k = $j-$i;
				$data[$k]['TEXT'] = $datas[$j]."";
				$data[$k]['T_SIZE'] = $datasType['T_SIZE'];
				$data[$k]['LN_SIZE'] = $datasType['LN_SIZE'];
				
				// par d�faut, le texte est centr� � gauche, non italic, non soulign� et non gras.
				// par d�faut, les cellules ne sont pas fusionn�es.
				$data[$k]['T_TYPE'] = '';
				$data[$k]['T_ALIGN'] = '';		
				$data[$k]['COLSPAN'] = "1";
					
				// Si l'utilisateur a pr�cis� une couleur de fond pour les autres colonnes, on l'applique ici.
				if ( (isset($datasType['BG_COLOR'])) && ($k!=0) )
					$data[$k]['BG_COLOR'] = $datasType['BG_COLOR'];
				
				// Pour pr�ciser une couleur de fond diff�rente, il faut utiliser la balise de type [(202,204,222)]
				$tmp = preg_match('/\[([a-zA-Z0-9]*)\(([,0-9]+)\)([a-zA-Z0-9]*)\](\s*)/', $data[$k]['TEXT'], $m);
				if(isset($m[2])){
					$data[$k]['BG_COLOR'] = explode(",",$m[2]);
					$data[$k]['TEXT'] = str_replace("(".$m[2].")", "", $data[$k]['TEXT']);
				}
				

				// Pour pr�ciser une taille de texte diff�rente, il faut utilser la balise de type [F10]
				$tmp = preg_match('/\[([a-zA-Z0-9]*)F([0-9]+)([a-zA-Z0-9]*)\](\s*)/', $data[$k]['TEXT'], $m);
				if(isset($m[2])){
					$data[$k]['T_SIZE'] = $m[2];
					$data[$k]['TEXT'] = str_replace("F".$m[2]."", "", $data[$k]['TEXT']);
				}
				// Pour pr�ciser une hauteur de cellule diff�rente, il faut utilser la balise de type [H5]
				$tmp = preg_match('/\[([a-zA-Z0-9]*)H([0-9]+)([a-zA-Z0-9]*)\](\s*)/', $data[$k]['TEXT'], $m);
				if(isset($m[2])){
					$data[$k]['LN_SIZE'] = $m[2];
					$data[$k]['TEXT'] = str_replace("H".$m[2]."", "", $data[$k]['TEXT']);
				}

				//si la balise ne contenait qu'une couleur de fond et/ou une taille de texte, j'efface les crochets restants
				$data[$k]['TEXT'] = str_replace("[]", "", $data[$k]['TEXT']);

				// Si l'utilisateur pr�cise un type ou un alignement pour une cellule pr�cise du tableau, on l'applique ici
				// Il faut utiliser les balises [I], [B], [U] pour Italic, Bold et Underline
				// Il faut utiliser les balises [L], [C], [R] pour left, centered et rigth
				if (sscanf($data[$k]['TEXT'], "[%[a-zA-Z]]%s", $balise, $reste) != 0)
				{
					//echo "balise = " . $balise;
					if ( (strpos($balise, "I")===FALSE) && (strpos($balise, "B")===FALSE) && (strpos($balise, "U")===FALSE)
					  && (strpos($balise, "L")===FALSE) && (strpos($balise, "C")===FALSE) && (strpos($balise, "R")===FALSE)
					  && (strpos($balise, "T")===FALSE) && (strpos($balise, "G")===FALSE) && (strpos($balise, "P")===FALSE) && (strpos($balise, "N")===FALSE) )
						; // Mauvaise balise ou l'utilisateur veut mettre des crochets dans son tableau, c'est son droit...
					else
					{
						//echo "balise = " . $balise . "<br>";
						// On teste les diff�rentes balises pour ajuster la cellule.
						if (strpos($balise, "I") === FALSE) ;
						else $data[$k]['T_TYPE'] .= 'I';
						if (strpos($balise, "B") === FALSE) ;
						else $data[$k]['T_TYPE'] .= 'B';
						if (strpos($balise, "U") === FALSE) ;
						else $data[$k]['T_TYPE'] .= 'U';
						if (strpos($balise, "L") === FALSE) ;
						else $data[$k]['T_ALIGN'] .= 'L';
						if (strpos($balise, "C") === FALSE) ;
						else $data[$k]['T_ALIGN'] .= 'C';
						if (strpos($balise, "R") === FALSE) ;
						else $data[$k]['T_ALIGN'] .= 'R';

						//modif MC 13/09/2013 pour les bordures : S pour bordure L,  T pour bordure right, H pour bordure top ,G pour bordure bottom , N : pas de bordure
						unset($data[$k]['BRD_TYPE']);
						if (strpos($balise, "S") !== FALSE || strpos($balise, "T") !== FALSE || strpos($balise, "H") !== FALSE   || strpos($balise, "G") !== FALSE   || strpos($balise, "N") !== FALSE){
							 $data[$k]['BRD_TYPE'] = '';
							if (strpos($balise, "S") === FALSE) ;
							else $data[$k]['BRD_TYPE'] .= 'L';
							if (strpos($balise, "T") === FALSE) ;
							else $data[$k]['BRD_TYPE'] .= 'R';
							if (strpos($balise, "H") === FALSE) ;
							else $data[$k]['BRD_TYPE'] .= 'T';
							if (strpos($balise, "G") === FALSE) ;
							else $data[$k]['BRD_TYPE'] .= 'B';
						}
						
						//modif MC 13/09/2013 pour la hauteur : petite hauteur
						if (strpos($balise, "P") === FALSE) ;
						else $data[$k]['LN_SIZE'] = '1';
						

					}
					
					// On supprime la balise du texte de la cellule...
					$data[$k]['TEXT'] = str_replace("[".$balise."]", "", $data[$k]['TEXT']);
				}
						//echo $balise." ".$data[$k]['TEXT']." ".$data[$k]['BRD_TYPE']." ".$data[$k]['LN_SIZE']."<br/>";

				// Si la valeur de la cellule est 0, le choix a �t� fait ICI de ne rien mettre dans la cellule.
				if ($data[$k]['TEXT'] == "0")
					$data[$k]['TEXT'] ="";
					
				// Test si l'utilisateur veut fusionner deux cellules dans le header de son tableau. Il doit mettre le contenu
				// de la cellule fusionn�e dans la premi�re cellule et "COLSPAN2" dans la deuxi�me cellule.
			/*	if ( ($k<$nbCol) && ($data[$k]['TEXT'] === "COLSPAN2") )
				{
					$k_1 = $k-1;
					$data[$k_1]['COLSPAN'] = "2";
					$data[$k]['TEXT']= "";
				}	*/
				if ( ($k<$nbCol)  && ($pos=strpos($data[$k]['TEXT'], "COLSPAN")) !== false )
				{
					$k_1 = $k-1;
					$data[$k_1]['COLSPAN'] = substr($data[$k]['TEXT'], 7);
					//$data[$i]['TEXT']= "";
				}
				
			}
			$pdf->Draw_Data($data);
		}
		
		$pdf->Draw_Table_Border();
	}
	
    function _ArcRound($x1, $y1, $x2, $y2, $x3, $y3)
    {
        $h = $this->h;
        $this->_out(sprintf('%.2f %.2f %.2f %.2f %.2f %.2f c ', $x1*$this->k, ($h-$y1)*$this->k,
            $x2*$this->k, ($h-$y2)*$this->k, $x3*$this->k, ($h-$y3)*$this->k));
    }


	 function RoundedRect($x, $y, $w, $h, $r, $style = '', $angle = '1234')
    {
        $k = $this->k;
        $hp = $this->h;
        if($style=='F')
            $op='f';
        elseif($style=='FD' or $style=='DF')
            $op='B';
        else
            $op='S';
        $MyArc = 4/3 * (sqrt(2) - 1);
        $this->_out(sprintf('%.2f %.2f m', ($x+$r)*$k, ($hp-$y)*$k ));

        $xc = $x+$w-$r;
        $yc = $y+$r;
        $this->_out(sprintf('%.2f %.2f l', $xc*$k, ($hp-$y)*$k ));
        if (strpos($angle, '2')===false)
            $this->_out(sprintf('%.2f %.2f l', ($x+$w)*$k, ($hp-$y)*$k ));
        else
            $this->_ArcRound($xc + $r*$MyArc, $yc - $r, $xc + $r, $yc - $r*$MyArc, $xc + $r, $yc);

        $xc = $x+$w-$r;
        $yc = $y+$h-$r;
        $this->_out(sprintf('%.2f %.2f l', ($x+$w)*$k, ($hp-$yc)*$k));
        if (strpos($angle, '3')===false)
            $this->_out(sprintf('%.2f %.2f l', ($x+$w)*$k, ($hp-($y+$h))*$k));
        else
            $this->_ArcRound($xc + $r, $yc + $r*$MyArc, $xc + $r*$MyArc, $yc + $r, $xc, $yc + $r);

        $xc = $x+$r;
        $yc = $y+$h-$r;
        $this->_out(sprintf('%.2f %.2f l', $xc*$k, ($hp-($y+$h))*$k));
        if (strpos($angle, '4')===false)
            $this->_out(sprintf('%.2f %.2f l', ($x)*$k, ($hp-($y+$h))*$k));
        else
            $this->_ArcRound($xc - $r*$MyArc, $yc + $r, $xc - $r, $yc + $r*$MyArc, $xc - $r, $yc);

        $xc = $x+$r ;
        $yc = $y+$r;
        $this->_out(sprintf('%.2f %.2f l', ($x)*$k, ($hp-$yc)*$k ));
        if (strpos($angle, '1')===false)
        {
            $this->_out(sprintf('%.2f %.2f l', ($x)*$k, ($hp-$y)*$k ));
            $this->_out(sprintf('%.2f %.2f l', ($x+$r)*$k, ($hp-$y)*$k ));
        }
        else
            $this->_ArcRound($xc - $r, $yc - $r*$MyArc, $xc - $r*$MyArc, $yc - $r, $xc, $yc - $r);
        $this->_out($op);
    }

}
?>