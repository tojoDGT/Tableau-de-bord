<?php
/* ***** BEGIN LICENSE BLOCK *****
 * Compte rendu par Sogelis
 * Copyright (c) 2006 Centre de Recherche Public Henri Tudor. All rights
 * reserved.
 *
 * ***** END LICENSE BLOCK *****
 */

require_once(dirname(__FILE__). "/phpToPDF.php");

// fonction hex2dec
// retourne un tableau associatif (clés : R,V,B) à
// partir d'un code html de couleur hexa (ex : #3FE5AA)
function hex2dec($couleur = "#000000"){
	$R = substr($couleur, 1, 2);
	$rouge = hexdec($R);
	$V = substr($couleur, 3, 2);
	$vert = hexdec($V);
	$B = substr($couleur, 5, 2);
	$bleu = hexdec($B);
	$tbl_couleur = array();
	$tbl_couleur['R']=$rouge;
	$tbl_couleur['V']=$vert;
	$tbl_couleur['B']=$bleu;
	return $tbl_couleur;
}

//conversion pixel -> millimètre en 72 dpi
function px2mm($px){
	return $px*25.4/72;
}

function txtentities($html){
	$trans = get_html_translation_table(HTML_ENTITIES);
	$trans = array_flip($trans);
	return strtr($html, $trans);
}
////////////////////////////////////


// Renvoie la largeur résultante de l'ajustement de
// la photo $nom dans un carré de côté $c et de hauteur $h.
// Si $h est mentionné, on aura un rectangle.
function getLargeurAjustee($nom, $c, $h = 0){

	if($h == 0) $h = $c;

	$pic = imagecreatefromjpeg($nom);
	$sX = imagesx($pic) ;
	$sY = imagesy($pic) ;

		if($sX > $c ){
			$sY = $sY * $c / $sX;
			$sX = $c;
		}
		if($sY > $h ){
			$sX = $sX * $h / $sY;
			$sY = $h;
		}

	settype ($sX, "integer") ;
	settype ($sY, "integer") ;
	imagedestroy($pic);
	return $sX;
}


function getHauteurAjustee($nom, $c, $h = 0){

	if($h == 0) $h = $c;

	$pic = imagecreatefromjpeg($nom);
	$sX = imagesx($pic) ;
	$sY = imagesy($pic) ;

		if($sX > $c ){
			$sY = $sY * $c / $sX;
			$sX = $c;
		}
		if($sY > $h ){
			$sX = $sX * $h / $sY;
			$sY = $h;
		}

	settype ($sX, "integer") ;
	settype ($sY, "integer") ;
	imagedestroy($pic);
	return $sY;
}


/*
 * Classe de définition d'un compte-rendu au format PDF
 */
class PdfBuildIT extends phpToPDF
{
	// variables nécessaires pour l'utilisation des méthodes
	// d'impression du tableau multi-cellules
	private $widths;
	private $aligns;


	/**
	 * Hauteur du logo pour replacer le contenu dynamiquement
	 * @public
	 */
	public $hauteur_logo = 0;

	/**
	 * Fichier de log
	 * @public
	 */
	public $fp = '';
	/**
	 * Classe compte rendu
	 * @public
	 */
	public $pCompte_rendu = '';

	function PdfBuildIT($pCompte_rendu=false, $orientation='P', $unit='mm', $format='A4') {
	   // parent::PDF_HTML($orientation,$unit,$format);
		$this->pCompte_rendu = $pCompte_rendu;
		$this->phpToPDF($orientation,$unit,$format);
	}

	function Header() {
	    global $bureau;
	    global $titre;

		#nom du compte rendu       
        try{
			if($this->pCompte_rendu){
				/*$entete = new Entete_cr($this->pCompte_rendu->getId_compte_rendu());
				if($this->PageNo()>1 && $entete->getLibelle()!=""){
					//Arial italique 8
					$this->SetFont('Arial','B',8);

					//Couleur du texte en gris
					$this->SetTextColor(128);

					$this->Cell(0,5,utf8_decode($entete->getLibelle()),0,0,'R');
					
					//Saut de ligne
					$this->Ln(8);
				}*/
				if($this->PageNo()>1){
					//type du CR et reunion concernée
					$reunion = $this->pCompte_rendu->getReference(REFERENCE_REUNION);
					$date = substr($reunion->getDate_reunion(), 0, 10);
					$type_reunion = $reunion->getId_type_reunion()->getIntitule();

					$this->Cell(0,5,utf8_decode($type_reunion." n°".$this->pCompte_rendu->getNumero()),0,0,'R');
					//Saut de ligne
					$this->Ln(5);

					$this->Cell(0,5,utf8_decode("Réunion du ".dt::dt2str(__('%y/%m/%d'),$date)),0,0,'R');
					//Saut de ligne
					$this->Ln(8);
				}

			}
					
         } catch (Exception $e) {}

	    if (isset($bureau)) {
		    //Logo
		    if (isset($bureau['logo']) && ($bureau['logo'] != "")) {
		    	if (file_exists('./images/upload/'.$bureau['logo'])) {
		    		// on récupére la width de l'image
		    		$image 			= GetImageSize('./images/upload/'.$bureau['logo']);
		    		$width			= $image[0];
		    		$height			= $image[1];

		    		$width_image 	= 195 - (($width / $height) * 30);

		   	 		$this->Image('./images/upload/'.$bureau['logo'],$width_image,9,0,30);
		    	}
		    }

			$this->hauteur_logo=$height;

		    //Arial gras 15
		    $this->SetFont('Arial','B',15);

		    //Calcul de la largeur du titre et positionnement
		    $w = $this->GetStringWidth($titre) + 4;
		    $this->SetX((210-$w)/2);

		    //Couleurs du cadre, du fond et du texte
		    $this->SetDrawColor(0,0,0);
		    $this->SetFillColor(255,255,255);
		    $this->SetTextColor(0,0,0);

		    //Epaisseur du cadre (0.2 mm)
		    $this->SetLineWidth(0.4);

		    //Titre centré
		    $this->addBureau($bureau['nom'],$bureau['adresse']);

		    $this->Rect(10, 7, 190, 35);

		    //Saut de ligne
		    $this->Ln(5);
	    }
	}

	/*
	 * Définition du pied-de-page du compte-rendu
	 */
	function Footer() {
	 	//Positionnement à 1,5 cm du bas
	    $this->SetY(-15);

	    //Arial italique 8
	    $this->SetFont('Arial','B',8);

	    //Couleur du texte en gris
	    $this->SetTextColor(128);

	    $num_page = '- '.$this->PageNo().' / {nb} -';

	    $this->Cell(0,10,utf8_decode('Rapport / réunion du '.dt::dt2str(__('%d/%m/%y'), Util::dateJour())),0,0,'L');

	    //Numéro de page
	    $this->Cell(0,10,$num_page,0,0,'R');
		
		$this->ln();
		$this->y = $this->y - 7;
			#nom du compte rendu       
        try{
			if($this->pCompte_rendu){
				$entete = new Entete_cr($this->pCompte_rendu->getId_compte_rendu());
				if( $entete->getLibelle()!=""){
					$this->Cell(0,10,utf8_decode($entete->getLibelle()),0,0,'L');
					
				}
			}
					
         } catch (Exception $e) {}

	   // $this->Cell(0,10,utf8_decode(__('Compte-rendu généré par CRTI-weB')),0,0,'L');
	}

	/**
	 * Reinitialise la ligne pour l'ajout de texte standard
	 * @param array $pWidth			largeur des colonnes
	 * @param array $pAligns		alignement des colonnes
	 * @param int $pTextFontSize	taille du texte
	 * @return void
	 */
	function reinitTableTextRow($pWidth, $pAligns, $pTextFontSize = 9) {
		$this->SetFont('', '', $pTextFontSize);
		$this->SetTextColor(0);
		$this->SetWidths($pWidth);
		$this->SetAligns($pAligns);
	}

	/**
	 * Crée une la ligne du header du tableau
	 * @param $pHeader	array	entetes du tableau
	 * @param $pWidth	array	largeur des colonnes du tableau
	 * @param $pAligns	array	alignement de chaque colonne du tableau
	 * @return void
	 */
	function setRowHeader ($pHeader, $pWidth, $pAligns, $typeRow = 0) {
		$this->SetWidths($pWidth);
		$this->SetAligns($pAligns);

		# Couleurs, épaisseur du trait et police grasse
		$this->SetFillColor(255);
		$this->SetTextColor(0,70,150);
		$this->SetDrawColor(125);
		$this->SetLineWidth(.2);
		$this->SetFont('','B', 10);

		$this->Row($pHeader, 1, 1, false, $typeRow);

		# Ajout d'une ligne vide
		$this->setBlanckLine();
	}

	/**
	 * Crée l'intitulé de la ligne du la remarque
	 * @param $pHeader	array	entetes des intitulés de la remarque
	 * @param $pWidth	array	largeur des colonnes du tableau
	 * @param $pAligns	array	alignement de chaque colonne du tableau
	 * @return void
	 */
	function setRowIntituleRemarque ($pIntituleRemarque, $pWidth, $pAligns) {
		$this->SetWidths($pWidth);
		$this->SetAligns($pAligns);

		# Couleurs, épaisseur du trait et police grasse
		$this->SetFont('Arial','B',10);
		$this->SetFillColor(228, 241, 249);
		$this->SetTextColor(0);

		$this->Row($pIntituleRemarque, 1, 1, false, 1);

		# reinitialisation de la couleur du texte en noir
		$this->SetTextColor(0);
		$this->SetFont('Arial', '', 10);
	}

	/**
	 * Crée la ligne du contenu de la remarque
     * @param $$pContenu	array	contenu des cellules
	 * @param $pWidth	array	largeur des colonnes du tableau
	 * @param $pAligns	array	alignement de chaque colonne du tableau
	 * @return void
	 */
	function setRowContenuRemarque ($pContenu, $pWidth, $pAligns, $pBorder = 1) {
		$this->SetWidths($pWidth);
		$this->SetAligns($pAligns);

		# Couleurs, épaisseur du trait et police grasse
		$this->SetFont('Arial','',10);
		$this->SetFillColor(255);
		$this->SetTextColor(0);

		$this->Row($pContenu, 1, $pBorder);

		# reinitialisation de la couleur du texte en noir
		$this->SetTextColor(0);
		$this->SetFont('Arial', '', 10);
	}

	/**
	 * Crée un sous-titre dans le tableau
	 * @param string $pSubTitle sous titre à afficher
	 * @return void
	 */
	function setSubTitle ($pSubTitle) {
		$this->SetFillColor(202, 214, 222);
		$this->SetTextColor(0);
		$this->SetWidths(190);

		$this->SetFont('Arial', 'B', 10);
		#$this->Row(array($pSubTitle), 1);

		$this->Cell(0, 5, $pSubTitle, 'LRT', 1, 'L', 1);
	}


	/**
	 * ESA 12-08-2011
	 * #386
	 * Crée un header pour les images en fin de PDF
	 * @param string $title titre à afficher
	 * @param int $back_link identifiant du
	 * @return void
	 */
	function setHeaderImageRemarque ($title, $back_link) {
		$this->SetFillColor(202, 214, 222);
		$this->SetTextColor(0);
		$this->SetFont('Arial', 'B', 10);

		//$this->SetAutoPageBreak(1, 60);

		// On insère le titre de la remarque
		$tab = explode("_", $title);
		$this->Cell(180, 8, $tab[0], 'LRT', 0, 'L', true, $tab[1]);

		// On insère le lien de retour vers la remarque
		$this->Cell(10, 8, "     ", 'LRT', 1, 'L', true, $back_link);

	}

	/**
	 * Permet d'ajouter une ligne de couleur CRTI-weB dans un tableau
	 * @return unknown_type
	 */
	function setBlanckLine() {
            $this->SetFillColor(0, 70, 150);
            $this->SetTextColor(0);
            $this->SetWidths(190);

            $this->SetFont('Arial', 'B', 10);
            #$this->Row(array($pSubTitle), 1);

            $this->Cell(0, 2, '', 'LR', 1, 'L', 1);
	}

	/**
         * Ajout du titre
         * @param type $pCompte_rendu
         * @param type $batch 
         */
	function addTitre($pCompte_rendu, $batch = false) {
		#Recuperation de la reunion et du chantier
		$reunion 	= $pCompte_rendu->getId_reunion();
		$chantier 	= $reunion->getId_chantier();
	    #Calcul de la largeur du titre et positionnement
	    $w = $this->GetStringWidth($chantier->getNom()) + 6;
	    #Couleurs du cadre, du fond et du texte
	    $this->SetDrawColor(255);
	    $this->SetFillColor(255);
	    #Epaisseur du cadre (1 mm)
	    $this->SetLineWidth(.2);

	    #Titre centre
	    $this->Ln();
	    $numero = "";
	    if (strlen($chantier->getNumero()) > 0) {
                $numero = " - ".$chantier->getNumero();
            }

            #Traitement de l'entete
            $image_entete = false;            
            try{
                $entete = new Entete_cr($pCompte_rendu->getId_compte_rendu());
                $imageCR = '';
                if (file_exists($entete->getImage_path())) {
                    $imageCR =  $entete->getImage_path();
                    $image_entete = true;
                }
                #Texte d'en-tete
                $this->SetFont('Arial','',10);
                $this->SetRightMargin(10);
                $texte_decode = html_entity_decode($entete->getTexte());
                $texte_html = Compte_rendu::replaceSpecialCharForWord($texte_decode);
                $var='/';
                $texte = preg_replace('/(?!<.*?)(' . preg_quote($var, '/') . ')(?![^<>]*?>)/si', '|',$texte_html);
                $this->SetDrawColor(0, 70, 150);
                $this->SetFillColor(255, 255, 255);
                //$parsed = "";
              //  $texte_entete = $this->writeHtml(utf8_decode($texte));
                //$texte_entete = $this->writeHtmlInCellWithoutFormat(utf8_decode($texte), $parsed);
                //$this->Multicell(90,4, $parsed);
             //   $this->Cell(90, 50, $texte_entete, '', 0, 'L', 0);
				//si il y a une image largeur réduite
                if($imageCR != ''){
					$height_texte=$this->NbLines(90, $texte)*3;
					$this->WriteHTML(utf8_decode($texte), $this->fp, 90);
				//sinon toute la page
				}else{
					#$height_texte=$this->NbLines(0, $texte)*4;
					$sav_y = $this->y;
					$this->WriteHTML(utf8_decode($texte), $this->fp);
					$height_texte = ($this->y  - $sav_y) + 4;
				}

				$height_logo = 0;

                if($imageCR != ''){
					//largeur et hauteur de l'image pour plus de contrôle
					$largeur= getLargeurAjustee($imageCR,90, 40);
					$height_logo=getHauteurAjustee($imageCR,90, 40);

                    $this->Image($imageCR,110, 4, $largeur, $height_logo);
                    $this->Ln(50);
                } else {
                    $this->Ln(4);
                }
                if($texte != '' || $imageCR != '') {

					if($height_logo>0 && $height_logo>$height_texte){
						#sogelis : le texte est placé sous l'entête en fonction de la hauteur du logo
						$this->y= $height_logo + 6; 
					}else{
						$this->y= $height_texte + 6; 
					}

                     $this->SetRightMargin(10);
                    #Couleurs du cadre, du fond et du texte
                    $this->SetDrawColor(0, 70, 150);
                    $this->SetFillColor(0, 70, 150);
                    $this->SetTextColor(0,70,150);
                    $this->SetFont('Arial','',10);
                    $this->Cell(0, 1, "", '', 1, 'C', 1);
                    # Saut de ligne
                    $this->Ln(2);
                }
				
                
            } catch (Exception $e) {}
            
                                   
            #Reinitialisation
			$this->SetFont('Arial','',10);
            $this->SetTextColor(0,0,0);
            
            #Recuperation de la liste de presence
            $liste_role	= $pCompte_rendu->getListePresences();

            #Recuperation des coordonnees des personnes
            $liste_orga	= array();
            foreach ($liste_role as $libelle => $invitations) {
                if($libelle == "Maîtrise d'ouvrage"){
                    foreach ($invitations as $invitation) {
                        $emploie = $invitation->getId_emploie();
                        $id_personne = $emploie->getId_personne(false);
                        $personne = new Personne ($id_personne, $pCompte_rendu->getDateAffichage(), true);
                        $organismes = $personne->getOrganismesAppartient($chantier->getId_chantier());
                        foreach($organismes as $orga){
                            $nom_organisme = $orga->getNom();
                        }
                        $liste_orga[] = $nom_organisme;
                    }
                }
            }  
			$largeur_libelle = 35;

            #Maitre de l"ouvrage
			$this->SetFont('Arial','B',10);
            $this->Cell($largeur_libelle, 4, utf8_decode(__("Maître de l'ouvrage"))." : ", 0, 0, 'L', 0);
			$this->SetFont('Arial','',10);
            
            $liste_mdo = array_unique($liste_orga);
            $i = 1;
            foreach ($liste_mdo as $mdo){
                $mdo = html_entity_decode(utf8_decode($mdo));
                if($i === 1){
                    $this->Write(4,$mdo);
                } else {
                    $this->Write(4,", ".$mdo);
                }
                $i++;
            } 
            $this->Ln();
            #Projet
			$this->SetFont('Arial','B',10);
			$this->Cell($largeur_libelle, 8, utf8_decode(__("Projet"))." : ", 0, 0, 'L', 0);
			$this->SetFont('Arial','',10);
			$this->Cell($largeur_libelle, 8, html_entity_decode(utf8_decode($chantier->getNom().$numero)), 0, 1, 'L', 0);
            #Calcule de la semaine en cours
            $meetingWeek = dt::dt2str('%W', $reunion->getDate_reunion()) + 1;
            #Réunion
			$this->SetFont('Arial','B',10);
            $this->Cell($largeur_libelle, 4, utf8_decode(__("Rapport"))." : ", 0, 0, 'L', 0);
			$this->SetFont('Arial','',10);
            $texte = utf8_decode($reunion->getId_type_reunion()->getIntitule()).
                    utf8_decode(__(" n°")) .$pCompte_rendu->getNumero().
                    utf8_decode(__(" de la réunion du ")).
                    dt::dt2str(__('%d/%m/%y'), $reunion->getDate_reunion()).
                    __(" (Sem. ").$meetingWeek.") ";
	    $this->Cell(0, 4, $texte, 0, 2, 'L', 0);
            #$this->Cell(0, 8, 	utf8_decode(__("Réunion du ")) . dt::dt2str(__('%d/%m/%y'), $reunion->getDate_reunion()) .__(" (Sem. ").$meetingWeek.') ', 'LRB', 1, 'L', 1);
	    #$this->Cell(0, 8, 	utf8_decode(__("Réunion ")). $reunion->getNumero() . __(" du ") . dt::dt2str(__('%Y-%m-%d'), $reunion->getDate_reunion()) .' ', 'LRB', 1, 'R', 1);
            #Saut de ligne
	    $this->Ln(2);
           
            #Couleurs du cadre, du fond et du texte
	    $this->SetDrawColor(0, 70, 150);
	    $this->SetFillColor(0, 70, 150);
	    $this->SetTextColor(0,70,150);
	    $this->SetFont('Arial','',10);
	    $this->Cell(0, 1, "", '', 1, 'C', 1);

	    # reinitialisation
	    $this->SetFont('Arial','',10);

	    # Saut de ligne
	    $this->Ln(2);

	    #Ajout du logo
	    $this->addLogo($pCompte_rendu, $image_entete, $batch);

	}

	/**
	 * Ajout du logo de l'organisme emetteur
	 * @param $pCompte_rendu compte rendu
	 * @return unknown_type
	 */
	function addLogo($pCompte_rendu,$entete = false,$batch = false) {
            #Ajout du logo
            $emetteur	= $pCompte_rendu->getReference(REFERENCE_EMETTEUR);
            if($batch){
                $reunion = $pCompte_rendu->getId_reunion();
                $S_activite = new Activite($reunion->getId_chantier(false));
            } else {
                $S_activite = Defaut::getActivite($emetteur, false);
            }

            $listeOrganisme = $emetteur->getOrganismesAppartient($S_activite->getId_activite(), $pCompte_rendu->getDateAffichage());
            $monOrganisme = array_values($listeOrganisme);
            $logo = $monOrganisme[0]->getLogo();
            if (!$entete){
                if (!empty($logo)) {
                    $extension = files::getExtension ($logo);
                    $newFileName = dirname(__FILE__).'/../../tmpUpload/logo/pdfOrga_'.time().'.'.$extension;
                    $newFileName = 'tmpUploads/logo/pdf.jpg';
                    $imageTools = new imageTools;
                    $imageTools->loadImage($logo);
                    $imageTools->resize(140, 60, 'ratio');
                    $build = $imageTools->output('JPG', $newFileName);
                    $imageTools->loadImage($newFileName);
                    $largeur = $imageTools->getW();
                    #Conversion de la largeur de l'image en millimètres
                    $lmm = (int )$largeur * 0.26458333333;
                    $hauteur = 8;
                    $this->Image($newFileName, 189 - $lmm, $hauteur);
                    unlink($newFileName);
                }
            }
	}

	
	function addInfo($size, $label, $txt, $label_bold=false)
	{
	    $this->SetTextColor(0);

		if($label_bold)
            $this->SetFont('Arial','B',10);
		else
            $this->SetFont('Arial','',10);
         $this->SetFillColor(255);

            # Sortie du texte justifié
	    $this->Cell($size, 5, html_entity_decode($label)." :", 0, 0, 'L', 1);

	    $this->SetFont('Arial','',10);
	    $this->Cell(0, 5, html_entity_decode($txt), 0, 0, 'L', 1);

	    #/Saut de ligne
	    $this->Ln();
	}

	function addTexte($txt)
	{
	    $this->SetTextColor(0);
		//$this->SetFont('Arial','',10);
	    //Sortie du texte justifié
	    $this->MultiCell(0,5,html_entity_decode($txt));
	    //Saut de ligne
	    //$this->Ln();
	}

	/*
	 * Cette fonction affiche en haut, a gauche, le nom de la societe dans la police Arial-12-Bold
	 * les coordonnees de la societe dans la police Arial-10
	 */
	function addBureau( $nom, $adresse )
	{
	    $x1 = 14;
	    $y1 = 10;

	    //Positionnement en bas
	    $this->SetXY( $x1, $y1 );

	    // Mise en forme
	    $this->SetFont('Arial','B',12);
	    $this->SetTextColor(0);

	    $this->Cell(0, 2, html_entity_decode($nom), 0);
	    $this->SetXY( $x1, $y1 + 4 );

	    // Mise en forme
	    $this->SetFont('Arial','',10);
	    $this->SetTextColor(0);

	    $length = $this->GetStringWidth( $adresse );

	    //Coordonnées de la société
	    //$lignes = $this->sizeOfText( $adresse, $length) ;
	    $this->MultiCell(0, 4, html_entity_decode($adresse));
	}

	/*
	 * Evaluation du nombre de lignes nécessaires pour afficher un texte sur une largeur donnée
	 */
	function sizeOfText( $texte, $largeur )
	{
	    $index    = 0;
	    $nb_lines = 0;
	    $loop     = TRUE;
	    while ( $loop )
	    {
	        $pos = strpos($texte, "\n");
	        if (!$pos)
	        {
	            $loop  = FALSE;
	            $ligne = $texte;
	        }
	        else
	        {
	            $ligne  = substr( $texte, $index, $pos);
	            $texte = substr( $texte, $pos+1 );
	        }
	        $length = floor( $this->GetStringWidth( $ligne ) );
	        $res = 1 + floor( $length / $largeur) ;
	        $nb_lines += $res;
	    }
	    return $nb_lines;
	}

	//*****************************************
	// Méthodes pour le tableau multi-cellules
	//*****************************************

	//Tableau des largeurs de colonnes
	function SetWidths($w)
	{
	    $this->widths=$w;
	}

	//Tableau des alignements de colonnes
	function SetAligns($a)
	{
	    $this->aligns=$a;
	}

	// Tableau de la taille de la police par défaut
	function getDefaultFontSize() {
		$this->tmpDefaultFontSize['fs'] 	= $this->FontSize;
		$this->tmpDefaultFontSize['fspt'] 	= $this->FontSizePt;
	}

	function setDefaultFontSize () {
		$this->SetFont('', '', $this->tmpDefaultFontSize['fspt']);
	}

	//Calcule la hauteur de la ligne
	function Row($data, $fill = 0, $border = 1, $pCellFontSizes = false, $typeRow = null)
	{

		# enregistrement des valeurs de la taille de la police par défaut
		$this->getDefaultFontSize();

	    $nb 			= 0;
	    $tailleTableau 	= count($data);
	    for($i=0; $i < $tailleTableau; $i++)
	    {
	    	// On change la taille de la police de la case si besoin est
	    	if ($pCellFontSizes !== false && isset ($pCellFontSizes[$i])) {
	    		$this->SetFont('', '', $pCellFontSizes[$i]);
	    	} else if ($pCellFontSizes !== false) {
				$this->setDefaultFontSize();
	    	}

	    	$nb = max($nb,$this->NbLines($this->widths[$i],html_entity_decode($data[$i])));
	    }

	    // on complète par des blancs ceux qui ne sont pas assez "hauts"
	    for($i=0; $i<$tailleTableau; $i++)
	    {
	    	// On change la taille de la police de la case si besoin est
	    	if ($pCellFontSizes !== false && isset ($pCellFontSizes[$i])) {
	    		$this->SetFont('', '', $pCellFontSizes[$i]);
	    	} else if ($pCellFontSizes !== false){
				$this->setDefaultFontSize();
	    	}
                $hack = false;
/*
                if (   $i == 3 
                    && (    (trim(html_entity_decode($data[1])) == "9/8" 
                              && substr(trim(html_entity_decode($data[3])),0,18) == "SCHILLING (SCHILL)")
                        ||  (trim(html_entity_decode($data[1])) == "16/2" 
                              && substr(trim(html_entity_decode($data[3])),0,19) == "JACOBS & SOHN (J&S)")
                   )) {
                        $hack = true;
                }
*/
                $reste = $nb - $this->NbLines($this->widths[$i],html_entity_decode($data[$i]),$hack);

	        //$reste = $nb - $this->NbLines($this->widths[$i],html_entity_decode($data[$i]));

	        for($j=0; $j<$reste; $j++)
	        {
				// ESA 17-08-2011
				// Hack permettant d'avoir des liens correctement placés dans le tableau
				if ($tailleTableau - 1 != $i || $typeRow != 1) {
					$data[$i]=$data[$i]."\n ";
				}
	        }
	    }

	    $h = 4 * $nb;

	    //Effectue un saut de page si nécessaire
	    $this->CheckPageBreak($h);

	    //Dessine les cellules
	    for($i=0; $i<$tailleTableau; $i++)
	    {
	        $w = $this->widths[$i];
	        $a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
	        $f = is_array($fill) ? $fill[$i] : $fill;
	        $b = is_array($border) ? $border[$i] : $border;

	        //Sauve la position courante
	        $x = $this->GetX();
	        $y = $this->GetY();

	        //Dessine le cadre
	        //$this->Rect($x,$y,$w,$h);

	        // On change la taille de la police de la case si besoin est
	       if ($pCellFontSizes !== false && isset ($pCellFontSizes[$i])) {
	    		$this->SetFont('', '', $pCellFontSizes[$i]);
	    	} else if ($pCellFontSizes !== false){
				$this->setDefaultFontSize();
	    	}

	        //Imprime le texte
	        //$this->MultiCell($w,4,html_entity_decode($data[$i]),$b,$a, $f);

	        //Calcule la hauteur de la ligne
			// ESA 11-08-2011
			// #386
			// Si c'est la dernière case du tableau, dans ce cas on ajoute un lien pour rediriger vers la remarque.
	        if ($tailleTableau - 1 == $i && $typeRow == 1) {
				//$this->Cell     ($w,$h,"   ",$b,$a, $f, true, $data[$i]);
				$this->Cell     ($w,$h,"   ",$b,$a, $f, true);
				//$this->MultiCell($w,4,html_entity_decode($data[$i]),$b,$a, $f);
                               if($data[$i] !== ""){
                                    $this->Link($this->GetX() - $w,
                                                            $this->GetY(),
                                                            $w,
                                                            $h,
                                                            $data[$i]);
                               }
			} else {
                                $hack = false;
                                if ($i == 3 && trim(html_entity_decode($data[1])) == "9/8" && substr(trim(html_entity_decode($data[3])),0,18) == "SCHILLING (SCHILL)") {
                                        $hack = true;
                                }
                                $this->MultiCell($w,4,html_entity_decode($data[$i]),$b,$a, $f, $hack);

				//$this->MultiCell($w,4,html_entity_decode($data[$i]),$b,$a, $f);
			}


	        //Repositionne à droite
	        $this->SetXY($x+$w,$y);
	    }

	    // On reinitialise avec la taille de la police par défaut
	    $this->setDefaultFontSize();

	    //Va à la ligne
	    $this->Ln($h);
	}

	//Si la hauteur h provoque un débordement, saut de page manuel
	/*function CheckPageBreak($h)
	{
	    if($this->GetY() + $h > $this->PageBreakTrigger)
	    {
	        $this->AddPage($this->CurOrientation);
	        $this->Ln(3);
	        return true;
	    }
	    return false;
	}*/

	/**
	 * Regarde si on doit passer à la page suivante (au niveau des remarques) et ajoute l'entete
	 */
	function sautPageRemarque($pTaille, $pNbLigne, $pNbLigneEntete, $affichageRemarque = "")
	{
		if ($this->CheckPageBreak(($pNbLigne + $pNbLigneEntete)*4 + 4))
		{
			if ($affichageRemarque == "organisme")
			{
				$this->SetAligns(array('L', 'L', 'C', 'C', 'C', 'C', 'C'));
				$header = array('N°', 'Intitulé', 'Prior.', 'Constat', 'Délai', 'Réglé', 'Photos');
			}
			else
			{
				$this->SetAligns(array('L', 'L', 'C', 'C', 'C', 'C', 'C', 'C'));
				$header = array('N°', 'Intitulé', 'Responsables', 'Prior.', 'Constat', 'Délai', 'Réglé', 'Photos');
			}

			$this->SetFillColor(5, 100, 140);
			$this->SetTextColor(255);
			$this->SetDrawColor(0);
			$this->SetWidths($pTaille);
			$this->Row($header, 1);
		}
	}

	//Calcule le nombre de lignes qu'occupe un MultiCell de largeur w
	//function NbLines($w, $txt)
	/*function NbLines($w, $txt, $hack=false)
	{
		$txt = html_entity_decode($txt);

	    $cw = &$this->CurrentFont['cw'];
	    if($w == 0)
	    {
	        $w = $this->w - $this->rMargin - $this->x;
	    }
	    $wmax = (($w - 2 * $this->cMargin) * 1000) / $this->FontSize;

	    $s = str_replace("\r",'',$txt);
	    $nb = strlen($s);
	    //if($nb > 0 and $s[$nb-1] == "\n")
	    if($nb > 0 and ord($s[$nb-1]) == 10 && !$hack)
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
	}*/
	//*******************
	// Fin multi-cellules
	//*******************

	/*public function writeHTML($pHtml) {
		$r = array();
		$status = 0;
		$tags = array(); // Act as a FIFO
		$tag = ""; // Current tag name
		$l = strlen($pHtml);
		$s = ""; // Current string, could be a tag name or a string
		for ($i = 0; $i < $l; $i++) {
			$c = substr($pHtml, $i, 1);
			if ($c === "<") {
				# Beginning of new tag
				# First we write the text if any
				if (strlen(trim($s)) !== 0) {
					if ($this->listindentlevel == 0) {
						# Simple text
						$s = str_replace("|","/",$s);
						$this->Write(5,stripslashes(txtentities($s)));
					} else {
						# We have a list
						$this->Write(5,str_repeat(' ',$this->listindentlevel * 3));
						if ($this->listordered[$this->listnum]) {
							$this->Write(5,$this->listcount[$this->listnum].'.');
						} else {
							$this->SetFont('Arial','',15);
							$this->Write(5,chr(149));
							$this->SetFont('Arial','',10);
						}
						$this->Write(5,' ' . stripslashes(txtentities($s)));
					}
				}
				$status = 1;
				$s = "";
			} elseif ($c === '/') {
				// Closing tags
				$status = 2;
			} elseif ($c === ">") {
				// End of current tag
				if ($status === 1) {
					// New tag -> add it to the list
					$this->OpenTag(strtoupper($s));
				} else {
					// Closing tag --> remove it from the list
					$this->CloseTag(strtoupper($s));;
				}
				$status = 0;
				$s = "";
			} elseif (ord($c) === 10 || ord($c) === 13 || ord($c) === 9) {
				// Newline, tab or carriage return
			} else {
			// Complete string, could be a tag name of text
				$s.= $c;
			}
		}
		$this->Ln(2);
	}

	//variables du parseur html
	var $B;
	var $I;
	var $U;
	var $HREF;
	var $fontList;
	var $issetfont;
	var $issetcolor;

	function OpenTag($tag) {
		//Balise ouvrante
		switch($tag){
			case 'STRONG':
				$this->SetStyle('B',true);
				break;
			case 'EM':
				$this->SetStyle('I',true);
				break;
			case 'B':
			case 'I':
			case 'U':
				$this->SetStyle($tag,true);
				break;
			case 'BLOCKQUOTE':
			case 'BR':
				$this->Ln(2);
				break;
			case 'P':
				$this->Ln(2);
				break;
			case 'FONT':
				if (isset($attr['COLOR']) && $attr['COLOR']!='') {
					$coul=hex2dec($attr['COLOR']);
					$this->SetTextColor($coul['R'],$coul['V'],$coul['B']);
					$this->issetcolor=true;
				}
				if (isset($attr['FACE']) && in_array(strtolower($attr['FACE']), $this->fontlist)) {
					$this->SetFont(strtolower($attr['FACE']));
					$this->issetfont=true;
				}
				break;
			case 'UL':
			case 'OL':
				++$this->listnum;
				if ($tag == 'OL') {
					$this->listordered[$this->listnum] = true;
				} else {
					$this->listordered[$this->listnum] = false;
				}
				$this->listcount[$this->listnum] = 0;
				++$this->listindentlevel;
				break;
			case 'LI':
				++$this->listcount[$this->listnum];
				//$this->Ln(5);
				break;
		}
	}

	function CloseTag($tag){
		//Balise fermante
		switch ($tag) {
			case 'STRONG':
				$this->SetStyle('B',false);
				break;
			case 'EM':
				$this->SetStyle('I',false);
				break;
			case 'B':
			case 'I':
			case 'U':
				$this->SetStyle($tag,false);
				break;
			case 'P':
				$this->Ln(5);
				break;
			case 'FONT':
				if ($this->issetcolor==true) {
					$this->SetTextColor(0);
				}
				if ($this->issetfont) {
					$this->SetFont('arial');
					$this->issetfont=false;
				}
				break;
			case 'UL':
			case 'OL':
				unset($this->listordered[$this->listnum]);
				unset($this->listcount[$this->listnum]);
				--$this->listindentlevel;
				//$this->Ln(5);
				break;
			case 'LI':
				$this->Ln(5);
				//--$this->listcount[$this->listnum];
				break;
		}
	}

	function SetStyle($tag, $enable)
	{
		//Modifie le style et sélectionne la police correspondante
		$this->$tag+=($enable ? 1 : -1);
		$style='';
		foreach(array('B','I','U') as $s)
		{
			if($this->$s>0)
				$style.=$s;
		}
		$this->SetFont('',$style);
	}

	function PutLink($URL, $txt)
	{
		//Place un hyperlien
		$this->SetTextColor(0,0,255);
		$this->SetStyle('U',true);
		$this->Write(5,$txt,$URL);
		$this->SetStyle('U',false);
		$this->SetTextColor(0);
	}*/

	/**
	 * ESA
	 * #496
	 * 07-11-2011
	 * Ajout du titre en haut du PDF
	 *
	 *
	 */
	function addHeaderFicheProjet($id_projet) {
		# récupération de la réunion et du chantier
		$activite = new Activite($id_projet);
		//$reunion 	= $pCompte_rendu->getId_reunion();
		//$chantier 	= $reunion->getId_chantier();

		# Arial gras 12
	    $this->SetFont('Arial','B',12);

	    # Calcul de la largeur du titre et positionnement
	    $w = $this->GetStringWidth("Fiche descriptive du projet \"".strtoupper($activite->getNom())."\"") + 6;

	    # Couleurs du cadre, du fond et du texte
	    $this->SetDrawColor(255);
	    $this->SetFillColor(255);

	    # Epaisseur du cadre (1 mm)
	    $this->SetLineWidth(.2);

	    # Titre centré
	    $this->Ln();
	    $this->Cell(0, 8, html_entity_decode(utf8_decode("Fiche descriptive du projet \"".strtoupper($activite->getNom())."\"")), 'LTR', 1, 'L', 1);

	    $this->SetFont('Arial','',10);
	    //$this->Cell(0, 4, 	utf8_decode(__("Rapport de chantier ")). utf8_decode($reunion->getId_type_reunion()->getIntitule()) .
	    					//utf8_decode(__(" n°")) .$pCompte_rendu->getNumero(), 'LRB', 0, 'L', 1);

		# calcule de la semaine en cours
	   	//$meetingWeek = dt::dt2str('%W', $reunion->getDate_reunion());

	   	//$this->Ln();
	   	//$this->Cell(0, 8, 	utf8_decode(__("Réunion du ")) . dt::dt2str(__('%d/%m/%y'), $reunion->getDate_reunion()) .__(" (Sem. ").$meetingWeek.') ', 'LRB', 1, 'L', 1);
	    #$this->Cell(0, 8, 	utf8_decode(__("Réunion ")). $reunion->getNumero() . __(" du ") . dt::dt2str(__('%Y-%m-%d'), $reunion->getDate_reunion()) .' ', 'LRB', 1, 'R', 1);

	   	# Couleurs du cadre, du fond et du texte
	    $this->SetDrawColor(0, 70, 150);
	    $this->SetFillColor(0, 70, 150);
	    $this->SetTextColor(0,70,150);


	    $this->SetFont('Arial','',10);
	    $this->Cell(0, 2, "", '', 1, 'C', 1);

	    # reinitialisation
	    $this->SetFont('Arial','',10);

	    # Saut de ligne
	    $this->Ln(4);
	}


        function writeHtmlInCellWithoutFormat($html,&$parsed)
        {
            //HTML parser
            $html=strip_tags($html,"<b><u><i><a><img><p><br><strong><em><font><tr><blockquote>"); //supprime tous les tags sauf ceux reconnus
            $html=str_replace("\n",' ',$html); //remplace retour à la ligne par un espace
            $a=preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE); //éclate la chaîne avec les balises
            foreach($a as $i=>$e)
            {
                if($i%2==0)
                {
                    //Text
                    if($this->HREF)
                        $this->PutLink($this->HREF,$e);
                    else
                        $parsed.=stripslashes(txtentities($e));
                }
                else
                {
                    //Tag
                    if($e[0]=='/')
                        $this->CloseTag(strtoupper(substr($e,1)));
                    else
                    {
                        //Extract attributes
                        $a2=explode(' ',$e);
                        $tag=strtoupper(array_shift($a2));
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

}
?>
