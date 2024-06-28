<?php
//HTML2PDF par Clément Lavoillotte
//ac.lavoillotte@noos.fr
//webmaster@streetpc.tk
//http://www.streetpc.tk

require_once(dirname(__FILE__). "/MultiCellBlt2.php");
require_once(dirname(__FILE__). "/htmlparser.inc");

class PDF_HTML extends PDF
{
var $B;
var $I;
var $U;
var $HREF;
var $ALIGN='';
var $FONTSIZE='';
var $STYLE='';
var $fp='';
var $largeur='';


	/**
	 * HTML PARSER: array of boolean values, true in case of ordered list (OL), false otherwise.
	 * @protected
	 */
	protected $listordered = array();

	/**
	 * HTML PARSER: array count list items on nested lists.
	 * @protected
	 */
	protected $listcount = array();

	/**
	 * HTML PARSER: current list nesting level.
	 * @protected
	 */
	protected $listnum = 0;

	/**
	 * HTML PARSER: indent amount for lists.
	 * @protected
	 */
	protected $listindent = 0;

	/**
	 * HTML PARSER: current list indententation level.
	 * @protected
	 */
	protected $listindentlevel = 0;
	protected $listindentlevel_tmp = 0;

function PDF_HTML($orientation='P', $unit='mm', $format='A4')
{

    //Call parent constructor
  //  parent::PDF($orientation,$unit,$format);
			$this->PDF($orientation,$unit,$format);
    //Initialization
    $this->B=0;
    $this->I=0;
    $this->U=0;
    $this->HREF='';
    $this->ALIGN='';
    $this->FONTSIZE='';
    $this->STYLE='';
}

function WriteHTML2($html)
{

    //HTML parser
    $html=str_replace("\n",' ',$html);
    $a=preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE);
    foreach($a as $i=>$e)
    {
        if($i%2==0)
        {
			
            if($this->FONTSIZE!=""){
				  $this->FONTSIZE=$this->FONTSIZE-4;
				  $this->SetFont('Arial',$this->STYLE,(intval(str_replace('px', '', $this->FONTSIZE))));
              //  $this->SetFont('Arial',$this->STYLE,(intval(str_replace('px', '', $this->FONTSIZE))*25.4/72));

				if($this->fp)
					fwrite($this->fp, "SetFont('Arial','".$this->STYLE."',".(intval(str_replace('px', '', $this->FONTSIZE))).")\r\n");
			}else{
                $this->SetFont('Arial',$this->STYLE,10);
				if($this->fp)
					fwrite($this->fp, "SetFont('Arial','".$this->STYLE."',10)\r\n");
			}

            //Text
            if($this->HREF){
                $this->PutLink($this->HREF,$e);
				if($this->fp)
					fwrite($this->fp, "PutLink\r\n");
			}elseif($this->ALIGN=='center' && trim($e)!="" ){
                echo "miditra";
				$this->Cell($this->largeur,5,$e,0,0,'C');
				if($this->fp)
					fwrite($this->fp, "--$e---Cell(0,5,$e,0,0,'C')\r\n");	
			}elseif($this->ALIGN=='right'){
                $this->Cell($this->largeur,5,$e,0,1,'R');
				if($this->fp)
					fwrite($this->fp, "Cell(0,5,$e,0,0,'C')\r\n");	
			}elseif($this->ALIGN=='left'){
                $this->Cell($this->largeur,5,$e,0,0,'L');
				if($this->fp)
					fwrite($this->fp, "Cell(0,5,$e,0,0,'C')\r\n");	
			}elseif($this->ALIGN=='justify'){
                $this->Cell($this->largeur,5,$e,0,0,'J');
				if($this->fp)
					fwrite($this->fp, "Cell(0,5,$e,0,0,'J')\r\n");		
            }else{
			
				if ($this->listindentlevel_tmp <= 0) {
					if($e!=""){
						# Simple text
						$e = str_replace("|","/",$e);
						$this->Write(5,stripslashes(txtentities($e)));
						if($this->fp)
							fwrite($this->fp, "Write(5,$e)\r\n");	
					}
				} else {
					# We have a list
					//if($e!=""){
						$this->Write(5,str_repeat(' ',$this->listindentlevel * 3));
						if ($this->listordered[$this->listnum]) {
							$this->Write(5,$this->listcount[$this->listnum].'.');
							if($this->fp)
								fwrite($this->fp, "Write(5,".$this->listcount[$this->listnum].'.'.")\r\n");	
						} else {
							$this->SetFont('Arial','',15);
							$this->Write(5,chr(149));
							if($this->fp)
								fwrite($this->fp, "Write(5,chr(149))\r\n");	
							$this->SetFont('Arial','',10);
						}
						$this->Write(5,' ' . stripslashes(txtentities($e)));
						if($this->fp)
							fwrite($this->fp, "Write(5,$e)\r\n");
						$this->listindentlevel_tmp = 0;
					//}
				}
	  
			}

        }
        else
        {
            //Tag
            if($e[0]=='/')
                $this->CloseTag(strtoupper(substr($e,1)));
            else
            {
				//le 1er espace sépare la balise des attributs
				$pos = strpos ( $e, " " );
				//text-align est présent dans le style
				if ($pos !== false) {
					$tag=strtoupper( substr($e, 0, $pos));
					$e = substr( $e, $pos+1);
				}else{
					$tag=strtoupper( $e);
				}

				//les balises peuvent contenir des espaces, je dois donc les enlever avant des décomposer
				$chaine="";
				 if(preg_match_all('/([^=]*)=["\']?([^"\']*)["\']/',$e,$a3)){
					  foreach($a3[0] as $a4){
						$chaine.=str_replace(" ", "", $a4)." ";
					 }
				 }

                //Extract attributes
                $a2=explode(' ',$chaine);
                $attr=array();
                foreach($a2 as $v)
                {
                    if(preg_match('/([^=]*)=["\']?([^"\']*)/',$v,$a3))
                        $attr[strtoupper($a3[1])]=$a3[2];
                }
                $this->OpenTag($tag,$attr);
            }
        }
    }
}

function OpenTag($tag, $attr)
{
    //Opening tag
    if($tag=='B' || $tag=='I' || $tag=='U')
        $this->SetStyle($tag,true);
    if($tag=='A')
        $this->HREF=$attr['HREF'];
    if($tag=='BR'){
        $this->Ln(5);    
		if($this->fp)
			fwrite($this->fp, "Ln(5)\r\n");	           
	}
	if($tag=='P')
		{
			if( !empty($attr['ALIGN']) )
				$this->ALIGN=$attr['ALIGN'];
			else{
				//pas de propriété align, je regarde la balise style
				if( !empty($attr['STYLE']) ){
					$pos = strpos ( $attr['STYLE'], "text-align:" );

					//text-align est présent dans le style
					if ($pos !== false) {
						$tmp= explode(";", substr( $attr['STYLE'], $pos+11));
						$this->ALIGN =  $tmp[0];
					}
				}
			}
		}
	if($tag=='HR')
		{
				if( !empty($attr['WIDTH']) )
						$Width = $attr['WIDTH'];
				else
						$Width = $this->w - $this->lMargin-$this->rMargin;
				$this->Ln(2);
				if($this->fp)
					fwrite($this->fp, "Ln(2)\r\n");	
				$x = $this->GetX();
				$y = $this->GetY();
				$this->SetLineWidth(0.4);
				$this->Line($x,$y,$x+$Width,$y);				
				if($this->fp)
					fwrite($this->fp, "Line($x,$y,$x+$Width,$y)\r\n");	
				$this->SetLineWidth(0.2);
				$this->Ln(2);
				fwrite($this->fp, "Ln(2)\r\n");	
		}
	if($tag=='FONT')
		{
			if (isset($attr['COLOR']) && $attr['COLOR']!='') {
				$coul=hex2dec($attr['COLOR']);
				$this->SetTextColor($coul['R'],$coul['V'],$coul['B']);
				$this->issetcolor=true;
			}
			if (isset($attr['FACE']) && in_array(strtolower($attr['FACE']), $this->fontlist)) {
				$this->SetFont(strtolower($attr['FACE']));
				$this->issetfont=true;
			}
		}
		
	if($tag=='UL' || $tag=='OL')
		{
				++$this->listnum;
				if ($tag == 'OL') {
					$this->listordered[$this->listnum] = true;
				} else {
					$this->listordered[$this->listnum] = false;
				}
				$this->listcount[$this->listnum] = 0;
				++$this->listindentlevel;
				
		}
	if($tag=='LI')
		{
		
				++$this->listindentlevel_tmp;
				++$this->listcount[$this->listnum];
				//$this->Ln(5);
		}
	//pas de propriété align, je regarde la balise style
	if( !empty($attr['STYLE']) ){
		$pos = strpos ( $attr['STYLE'], "font-size:" );

		//text-align est présent dans le style
		if ($pos !== false) {
			$tmp= explode(";", substr( $attr['STYLE'], $pos+10));
			$this->FONTSIZE =  $tmp[0];
		}
	}
}

function CloseTag($tag)
{
	$this->FONTSIZE="";
    //Closing tag
    if($tag=='B' || $tag=='I' || $tag=='U'){
        $this->SetStyle($tag,false);
		$this->STYLE=str_replace($tag, '', $this->STYLE);
	}
	if($tag=='A')
        $this->HREF='';
    if($tag=='P'){
		$this->ALIGN="";
        $this->Ln(5);
		if($this->fp)
			fwrite($this->fp, "Ln(5)\r\n");	       
	}
    if($tag=='FONT'){
		if ($this->issetcolor==true) {
			$this->SetTextColor(0);
		}
		if ($this->issetfont) {
			$this->SetFont('arial');
			$this->issetfont=false;
		}      
	}
    if($tag=='UL' || $tag=='OL'){  
		unset($this->listordered[$this->listnum]);
		unset($this->listcount[$this->listnum]);
		--$this->listindentlevel;
		//this->Ln(5); 
	}
    if($tag=='LI'){  
		$this->Ln(5);
		//--$this->listcount[$this->listnum];
		
	}
}

function SetStyle($tag, $enable)
{
    //Modify style and select corresponding font
    $this->$tag+=($enable ? 1 : -1);
    $style='';
    foreach(array('B','I','U') as $s)
        if($this->$s>0)
            $style.=$s;
	$this->STYLE=$style;
    $this->SetFont('',$style);
}

function PutLink($URL, $txt)
{
    //Put a hyperlink
    $this->SetTextColor(0,0,255);
    $this->SetStyle('U',true);
    $this->Write(5,$txt,$URL);
    $this->SetStyle('U',false);
    $this->SetTextColor(0);
}

function WriteTable($data, $w)
{
    $this->SetLineWidth(.3);
    $this->SetFillColor(255,255,255);
    $this->SetTextColor(0);
    $this->SetFont('');
    foreach($data as $row)
    {
        $nb=0;
        for($i=0;$i<count($row);$i++)
            $nb=max($nb,$this->NbLines($w[$i],trim($row[$i])));
        $h=2.2*$nb;
		//echo $nb." ".$h." ";
        $this->CheckPageBreak($h);
        for($i=0;$i<count($row);$i++)
        {
			$row[$i]=str_replace("\t", " ", $row[$i]);
			while( strpos($row[$i],'  ')!==false){
				$row[$i]=str_replace("  ", " ", $row[$i]);
			}
			$row[$i]=str_replace("\n \n", "\n", $row[$i]);
			$row[$i]=str_replace("\r\n \r\n", "\n", $row[$i]);
	
            $x=$this->GetX();
            $y=$this->GetY();
            $this->Rect($x,$y,$w[$i],$h);
            $this->MultiCell($w[$i],3,html_entity_decode (trim($row[$i])),0,'L');			
			if($this->fp)
				fwrite($this->fp, "MultiCell($w[$i],3,html_entity_decode (trim($row[$i])),0,'L')\r\n");
            //Put the position to the right of the cell
            $this->SetXY($x+$w[$i],$y);                    
        }
        $this->Ln($h);
		if($this->fp)
			fwrite($this->fp, "Ln($h)\r\n");

    }
}

function NbLines($w, $txt)
{
    //Computes the number of lines a MultiCell of width w will take
    $cw=&$this->CurrentFont['cw'];
    if($w==0)
        $w=$this->w-$this->rMargin-$this->x;
    $wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
    $s=str_replace("\r",'',$txt);
    $nb=strlen($s);
    if($nb>0 && $s[$nb-1]=="\n")
        $nb--;
    $sep=-1;
    $i=0;
    $j=0;
    $l=0;
    $nl=1;
    while($i<$nb)
    {
        $c=$s[$i];
        if($c=="\n")
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

function CheckPageBreak($h)
{
    //If the height h would cause an overflow, add a new page immediately
    if($this->GetY()+$h>$this->PageBreakTrigger)
        $this->AddPage($this->CurOrientation);
}

function ReplaceHTML($html)
{
   // $html = str_replace( '<li>', "\n<br> - " , $html );
   // $html = str_replace( '<LI>', "\n - " , $html );
   // $html = str_replace( '</ul>', "\n\n" , $html );
    $html = str_replace( '<strong>', "<b>" , $html );
    $html = str_replace( '</strong>', "</b>" , $html );
    $html = str_replace( '<em>', "<i>" , $html );
    $html = str_replace( '</em>', "</i>" , $html );
    $html = str_replace( '&#160;', "\n" , $html );
    $html = str_replace( '&nbsp;', " " , $html );
    $html = str_replace( '&quot;', "\"" , $html ); 
    $html = str_replace( '&#39;', "'" , $html );
    return $html;
}

function ParseTable($Table)
{
    $_var='';
    $htmlText = $Table;
    $parser = new HtmlParser ($htmlText);
    while ($parser->parse())
    {
        if(strtolower($parser->iNodeName)=='table')
        {
            if($parser->iNodeType == NODE_TYPE_ENDELEMENT)
                $_var .='/::';
            else
                $_var .='::';
        }

        if(strtolower($parser->iNodeName)=='tr')
        {
            if($parser->iNodeType == NODE_TYPE_ENDELEMENT)
                $_var .='!-:'; //opening row
            else
                $_var .=':-!'; //closing row
        }
        if(strtolower($parser->iNodeName)=='td' && $parser->iNodeType == NODE_TYPE_ENDELEMENT)
        {
            $_var .='#,#';
        }
        if ($parser->iNodeName=='Text' && isset($parser->iNodeValue))
        {
            $_var .= $parser->iNodeValue;
        }
    }
    $elems = explode(':-!',str_replace('/','',str_replace('::','',str_replace('!-:','',$_var)))); //opening row
    foreach($elems as $key=>$value)
    {
        if(trim($value)!='')
        {
            $elems2 = explode('#,#',$value);
            array_pop($elems2);
            $data[] = $elems2;
        }
    }
    return $data;
}

/**
 * Ecriture de code HTML dans le PDF
 * sont géré : u, b, i, p, br, hr, ul, ol, li
 * @param   object   $html      texte html
 * @param   object   $fp		pointeur vers le fichier de log, si false alors les logs ne seront pas créés
 * @param   string   $largeur   largeur des bloc p contenant le code html, par défaut 0 prend toute la largeur de la page
 */
function WriteHTML($html, $fp=false, $largeur=0)
{
    $this->fp=$fp;
    $this->largeur=$largeur;

    $html = $this->ReplaceHTML($html);
    //Search for a table
    $start = strpos(strtolower($html),'<table');
    $end = strpos(strtolower($html),'</table');
    if($start!==false && $end!==false)
    {
        $this->WriteHTML2(substr($html,0,$start).'<BR>');

        $tableVar = substr($html,$start,$end-$start);

        $tableData = $this->ParseTable($tableVar);	
        for($i=1;$i<=count($tableData[0]);$i++)
        {
           /* if($this->CurOrientation=='L')
                $w[] = abs(120/(count($tableData[0])-1))+24;
            else
                $w[] = abs(120/(count($tableData[0])-1))+5;
				*/
				$w[] = 90;
        }
        $this->WriteTable($tableData,$w);

        $this->WriteHTML2(substr($html,$end+8,strlen($html)-1).'<BR>');
    }
    else
    {
        $this->WriteHTML2($html);
    }
}

}
?>
