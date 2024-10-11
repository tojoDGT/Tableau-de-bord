<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage le modèle concenrnant les demandes
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Demande_model extends CI_Model {

	/**  
	* Classe qui concerne le modèle demande
	* @package  DGT  
	* @subpackage entité */ 
	function __construct(){
		parent::__construct();
	}

	/** 
	* function permettant de retourner le colonne à afficher dans une variable session
	*
	* @return liste des colonnes à afficher
	*/
	public function getSessionColonne ()
	{
		$toColonne = array();
		//unset($_SESSION["colonneAffiche"]);
		if(empty($_SESSION["colonneAffiche"])){
			array_push($toColonne, 'Identifiant-M.ECRI_NUM');
			array_push($toColonne, 'IdentifiantNumInfo-M.MAND_NUM_INFO');
			array_push($toColonne, 'STATUT DE PAIEMENT-M.STATUT_PAIEMENT');
			array_push($toColonne, 'Référence-E.ECRI_REF');
			array_push($toColonne, 'Code tiers-M.MAND_CODE_TIERS');
			array_push($toColonne, 'Statut-M.STATUT');
			array_push($toColonne, 'Libellé-E.ECRI_LIB');
			array_push($toColonne, 'Date-E.ECRI_DT_CECRITURE');
			array_push($toColonne, 'Propriétaire-E.PROP_CODE');
			array_push($toColonne, 'SOA-M.SOA');
			array_push($toColonne, 'Mode-M.MAND_MODE_PAIE1');
			array_push($toColonne, 'Montant-M.MAND_MONTANT1');

			$_SESSION["colonneAffiche"] = serialize($toColonne);
		} else {
			$toColonne = unserialize($_SESSION["colonneAffiche"]);
		}

		return $toColonne;
	}

	
	/** 
	* function permettant d'afficher la liste des demandes
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function getDemande(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		$toRow = array();

		$toDB = $this->load->database('catia',true);
		
		$toGetListeColonne = $this->getSessionColonne();

			
		$toColumns=array(); 

		foreach ($toGetListeColonne as $zColonne){
			$oColonne = explode("-", $zColonne);
			if($oColonne[1] != ""){
				array_push($toColumns, $oColonne[1]);
			}
		}

		$oRequest = $_REQUEST;

		//print_r ($oRequest);

		$_iAnneeExercice = 2024;
		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$_iAnneeExercice = $oRequest['ECRI_EXERCICE'];
		}

		$zWhere = "  ";
		$zOtherWhere = " WHERE 1=1 ";

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zWhere.=" AND M.EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zWhere.=" AND MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  $oRequest['MAND_MODE_PAIE']!="") {   

			if($oRequest['MAND_MODE_PAIE']=='VB'){
				$zWhere .=" AND M.MAND_MODE_PAIE IN ('VB','ME')";
			} else {
				$zWhere.=" AND M.MAND_MODE_PAIE = '".$oRequest['MAND_MODE_PAIE']."'  ";
			}
			
		}

		if( !empty($oRequest['PROP_CODE']) &&  $oRequest['PROP_CODE']!="") {   
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zValue){
					array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				$zWhere .=" AND SUBSTR (M.SOA, 1, 1) IN (".implode(",",$toPropCode).")";
			}
		}


		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zWhere.=" AND TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		} 


		if( !empty($oRequest['STATUT']) &&  $oRequest['STATUT']!="") {   
			$zOtherWhere.=" AND STATUT = '".$oRequest['STATUT']."'  ";
		} 

		if( !empty($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zWhere.=" AND M.ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( !empty($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zWhere.=" AND M.MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}

		if( !empty($oRequest['date_debut_rec']) &&  $oRequest['date_fin_rec']!="") {   
			$zDateDebRec = $oRequest['date_debut_rec'] ; 
			$zDateFinRec = $oRequest['date_fin_rec'] ; 

			if ($zDateDebRec == $zDateFinRec){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinRec,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinRec =  $oDate->format('d/m/Y');
			}

			$zWhere.="  AND M.MAND_DATE_RECUP BETWEEN '".$zDateDebRec."' AND '".$zDateFinRec."' ";
		}

		//print_r ($oRequest);


		if( !empty($oRequest['date_debut_visa']) &&  $oRequest['date_fin_visa']!="") {   
			$zDateDebVisa = $oRequest['date_debut_visa'] ; 
			$zDateFinVisa = $oRequest['date_fin_visa'] ; 

			if ($zDateDebVisa == $zDateFinVisa){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinVisa,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinVisa =  $oDate->format('d/m/Y');
			}

			$zWhere.="  AND M.MAND_DATE_REEL_VISA BETWEEN '".$zDateDebVisa."' AND '".$zDateFinVisa."' ";
		}



		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='PROP_CODE[]'){
					$zValue = "'". $oData['value'] . "'";
					array_push($toPropCode, $zValue);
				}
			}
			
			if(sizeof($toPropCode)>0){
				$zWhere .=" AND SUBSTR (M.SOA, 1, 1) IN (".implode(",",$toPropCode).")";
			}
		}

		$toMandMode1 = array();
		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   

		   $toMandMode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='MAND_MODE_PAIE'){
					if($oData['value']!=""){
						$zValue = "'". $oData['value'] . "'";
						array_push($toMandMode, $zValue);
						array_push($toMandMode1, $oData['value']);
					}
				}
				
			}
			
			if(sizeof($toMandMode)>0){

				if(in_array("'VB'", $toMandMode)){
					// Money electronique 
					$zValue = "'ME'";
					array_push($toMandMode,$zValue);
				}  

				$zWhere .=" AND M.MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( M.ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.ECRI_DT_CECRITURE LIKE '%".$oRequest['search']['value']."%'  ";
			//$zWhere.=" OR  PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
		}


		$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/mdt_vir_tb.sql"); 
		if(sizeof($toMandMode1)>0){
			// si transfert 
			if(in_array("OO", $toMandMode1)){
				$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/mdt_trsf_specl.sql"); 
			}  
		}
		

		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zWhere.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zWhere.=" ORDER BY M.ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['start']+(int)$oRequest['length'];
		} else {
			$zWhere.=" ORDER BY M.ECRI_NUM ASC ";
		}
		

		if ($zFin ==0){

			$zFin = 100;
		}

		if( !empty($oRequest['iStart']) &&  $oRequest['iStart']!="") {   
			$zDebut = (int)$oRequest['iStart'] ;
		}

		if( !empty($oRequest['iLength']) &&  $oRequest['iLength']!="") {   
			$zFin =  (int)$oRequest['iLength'];
		}


		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		$zData = str_replace("%OTHERWHERE%", trim($zOtherWhere), $zData) ; 
		$zData = str_replace("%DEBUT%", trim($zDebut), $zData) ; 
		$zSql = str_replace("%FIN%", trim($zFin), $zData) ; 

		//echo $zSql;
		
		//die();

		set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		
		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$_iNbrTotal = 0;

		if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher la liste des dossiers
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function getDossier(&$_iNbrTotal = 0,$_this='',$_iAnneeExercice='2024'){
		
		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$oRequest = $_REQUEST;

		
		if( isset($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']==1){   
			$toColumns = array( 
				0  => 'm.ECRI_NUM', 
				1  => 'm.MAND_NUM_INFO',
				2  => 't.ECRI_LIB', 
				3  => 'm.MAND_OBJET',
				4  => 'm.MAND_DATE_RECUP', 
				5  => 'm.MAND_MONTANT1'
			);
		} else {
			$toColumns = array( 
				0  => 'm.ECRI_NUM', 
				1  => 'm.MAND_NUM_INFO',
				2  => 'm.REJET_NOTE', 
				3  => 'm.MAND_DT_RJT',
				4  => 'm.MAND_OBJET',
				5  => 'm.MAND_DATE_RECUP', 
				6  => 'm.MAND_MONTANT1'
			);
		}

		/*
		echo "<pre>";
		print_r ($oRequest);
		echo "</pre>";*/

		$zWhere = " ";

		$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/getDossier.sql");  
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 

		if( isset($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zWhere.=" AND m.ENTITE = '".$oRequest['zPsCode']."'  ";
		}


		if( isset($oRequest['iUserId']) &&  $oRequest['iUserId']!="") {   
			$zWhere.=" AND m.MAND_UTR_VISA = '".$oRequest['iUserId']."'  ";
		}

		if( isset($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zWhere.=" AND m.MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  t.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  m.MAND_OBJET LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  t.PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  m.MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zWhere.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zWhere.=" ORDER BY t.ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['start']+(int)$oRequest['length'];
		} else {
			$zWhere.=" ORDER BY t.ECRI_NUM ASC ";
		}


		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExo), $zData) ; 
		$zData = str_replace("%OTHERWHERE%", trim($zOtherWhere), $zData) ; 
		$zData = str_replace("%DEBUT%", trim($zDebut), $zData) ; 
		$zSql = str_replace("%FIN%", trim($zFin), $zData) ; 

		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		/*
		echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$_iNbrTotal = 0;

		if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher de détail d'un dossier
	*
	* @param integer $_iEcriNum : Ecriture numéro
	* @param integer $_iNumMandat : numéro de mandant
	* @param integer $_iMode : Mode de paiement
	*
	* @return liste en tableau d'objet
	*/
	public function GetDetail($_iEcriNum, $_iNumMandat, $_iMode, $_iAnneeExercice='2024'){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from EXECUTION".$_iAnneeExercice.".ECRITURE@dblcca2 t,EXECUTION".$_iAnneeExercice.".MANDAT@dblcca2 m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum . " AND m.MAND_NUM_INFO = " . $_iNumMandat;

		if($_iMode != ""){
			$zSql .= " AND m.MAND_MODE_PAIE = '" . $_iMode . "'";
		}

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	/** 
	* function permettant d'afficher de détail d'un dossier
	*
	* @param integer $_iEcriNum : Ecriture numéro
	*
	* @return liste en tableau d'objet
	*/
	public function GetDetailViews($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select * from SUIVI_MDT WHERE  M.ECRI_NUM = " . $_iEcriNum;
		echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}
	
	/** 
	* function permettant d'afficher le detail d'un transfert
	*
	* @param integer $_iNumMandat : numéro du mandat
	*
	* @return liste en tableau d'objet
	*/
	public function GetTransfert($_iNumMandat, $_iAnnee="2024"){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);


		$zData = @file_get_contents(APPLICATION_PATH ."sql/transfert/transfert_detail.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnnee), $zData) ; 

		$zSql .= "  AND T.MAND_NUM_INFO = '" . $_iNumMandat . "'";

		//echo $zSql;
		//die();

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	/** 
	* function permettant d'afficher le detail d'un virement
	*
	* @param integer $_iNumMandat : numéro du mandat
	*
	* @return liste en tableau d'objet
	*/
	public function GetVirement($_iNumMandat,$_iAnnee="2024"){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/compteVirement.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnnee), $zData) ; 

		$zSql .= " WHERE MANDAT = '" . $_iNumMandat . "'";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	/** 
	* function permettant d'afficher le detail d'un LEGEcriture
	*
	* @param integer $_iNumMandat : numéro du mandat
	*
	* @return liste en tableau d'objet
	*/
	public function GetLEGecriture($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from TESTSOI.T_ECRITURE t,T_LGECRITURE m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}


	public function setExcelExportDossier ($_iNombreTotal, $_toListe, $_oRequest) {

		require(APPLICATION_PATH ."/Classes/PHPExcel.php");

		/** Error reporting */
		//error_reporting(E_ALL);
		//ini_set('display_errors', TRUE);
		//ini_set('display_startup_errors', TRUE);
		//date_default_timezone_set('Europe/London');

		define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');

		$oRequest = $_oRequest ; 

		//print_r ($oRequest);

		$iDepart		= $oRequest['iDepart'] ; 
		$iStart			= $oRequest['iStart'];
		$iLength		= $oRequest['iLength'];

		if ($iStart==0 && $_iNombreTotal < $iLength){
			$iPercent = 100;
		} else {

			$iNombrePagination = ceil($_iNombreTotal /$iLength);

			$iPaginationEnCours = ceil($iStart/$iLength);

			$iPercent = (($iPaginationEnCours)/$iNombrePagination*100);
		}
			
		$iDone = 0;
		if($iNombrePagination == $iPaginationEnCours){
			$iDone = 1;
		}


		$toColonne = unserialize($_SESSION["colonneAffiche"]);

		$toHead1 = array(); 
		$toListeColumns = array();
		foreach ($toColonne as $oColonne){
			$tzColonne = explode("-", $oColonne);
			$tzColonne = explode(".", $tzColonne[1]);
			$toHead1[utf8_decode($tzColonne[0])] = utf8_decode($tzColonne[0]);
			array_push($toListeColumns, $tzColonne[1]);
		}

		/*echo "<pre>";
		print_r ($toHead1);
		echo "</pre>";

		die();*/


		if($oRequest['iDepart']==0) {   
			
			//$iDone = 1;
			$iStart += $iLength ; 
			$iPaginationEnCours = ceil($iStart/$iLength);

			$iPercent = (($iPaginationEnCours)/$iNombrePagination*100);
			
			$zFileType = 'Excel2007';
			$zFileName = $oRequest['zFileExport'];

			$objReader = PHPExcel_IOFactory::createReader($zFileType);
			$objPHPExcel = $objReader->load(APPLICATION_PATH ."assets/excel/".$zFileName);

			$iStartLine = $objPHPExcel->setActiveSheetIndex(0)->getHighestDataRow();

			//echo $iPercent ."-". $iStart ."-". $iLength ."-". $iNombrePagination ; 

			//die();

			$iRowDynamic = $iStartLine +1 ; 
			
			foreach ($_toListe as $oListe) {

				$iIncrement = 0;
				foreach ($toListeColumns as $zListeColumns){

					if ($zListeColumns == 'MAND_OBJET'){
						$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($iIncrement, $iRowDynamic, wordwrap($oListe[$zListeColumns], 150));
					} else {
						$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($iIncrement, $iRowDynamic, $oListe[$zListeColumns]);
					}
					$iIncrement++;
				}

				$objPHPExcel->getActiveSheet()->getStyle('P'.$iRowDynamic)->getAlignment()->setWrapText(true);
				$iRowDynamic++;


			}

			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');

			@unlink(APPLICATION_PATH ."assets/excel/".$zFileName);

			header('Content-Type: application/xlsx');
			header('Content-Disposition: attachment;filename="'.$zFileName.'"');
			header('Cache-Control: max-age=0');
			ob_end_clean();

			$objWriter->save(APPLICATION_PATH ."assets/excel/".$zFileName);

			$zResponse =  array(
				'status' => TRUE,
				'name' => $zFileName,
				'iNombreTotal' => $_iNombreTotal,
				'iStart' => $iStart,
				'iLength'	=> $iLength,
				'iPercent' => ceil($iPercent),
				'done' => $iDone,
				'file' => base_url() ."assets/excel/".$zFileName
			);
		
			die(json_encode($zResponse));
			exit();

		} else {

			$iDepart = 0;	
			$iStart += $iLength ; 
			$objPHPExcel = new PHPExcel();

			echo date('H:i:s') , " Set document properties" , EOL;
			$objPHPExcel->getProperties()->setCreator("DGT")
										 ->setLastModifiedBy("DGT")
										 ->setTitle("EXPORT DOSSIER")
										 ->setSubject("EXPORT DOSSIER")
										 ->setDescription("EXPORT DOSSIER")
										 ->setKeywords("office PHPExcel php")
										 ->setCategory("EXPORT DOSSIER");

			$objPHPExcel->setActiveSheetIndex(0)
						->setCellValue('A2', 'DCP');


			$default_style = array(
				'font' => array(
					'name' => 'Verdana',
					'color' => array('rgb' => '000000'),
					'size' => 10
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
						'color' => array('rgb' => '000000')
					)
				)
				 
			);


			$default_style_ligne2 = array(
				'font' => array(
					'name' => 'Verdana',
					'color' => array('rgb' => '584d44'),
					'size' => 10
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
						'color' => array('rgb' => '000000')
					)
				),
				 'fill' => array(
						'type' => PHPExcel_Style_Fill::FILL_SOLID,
						'color' => array('rgb' => 'FFD700')
				 )
				 
			);

			$objPHPExcel->getActiveSheet()->mergeCells("A1:J1");
			$objPHPExcel->getActiveSheet()->getStyle('A1:J1')->applyFromArray($default_style);
			$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, utf8_encode('REPOBLIKAN\'I MADAGASIKARA'));

			$objPHPExcel->getActiveSheet()->mergeCells("A2:J2");
			$objPHPExcel->getActiveSheet()->getStyle('A2:J2')->applyFromArray($default_style);
			$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 2, utf8_encode('Fitiavana - Tanindrazana - Fandrosoana'));

			$toEntete = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');


			$iRow = 5 ; 
			$iCol = 0;
			foreach ($toHead1 as $zValue) {
				$objPHPExcel->getActiveSheet()->getStyle('A5:'.$toEntete[sizeof($toHead1)-1].'5')->applyFromArray($default_style_ligne2);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($iCol, $iRow, utf8_encode($zValue));
				$iCol++;
			}

			$iRow0 = 2 ; 
			$iCol0 = 2;
			$oArrayColumn = array();

			for($col = 'A'; $col !== 'ZZ'; $col++) {
				$objPHPExcel->getActiveSheet()
					->getColumnDimension($col)
					->setAutoSize(true);
			}

			//$objPHPExcel->getActiveSheet()->getColumnDimensionByColumn('E')->setWidth('900');

			$style = array(
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
				),
				'borders' => array(
					  'allborders' => array(
						  'style' => PHPExcel_Style_Border::BORDER_THIN
					  )
				  )
			);


			// Set active sheet index to the first sheet, so Excel opens this as the first sheet
			$objPHPExcel->setActiveSheetIndex(0);

		
			$iRowDynamic = 6 ; 

			/*echo "<pre>";
			print_r ($_toListe);
			echo "</pre>";

			die();*/
			
			foreach ($_toListe as $oListe) {
				$iIncrement = 0;
				foreach ($toListeColumns as $zListeColumns){
					if ($zListeColumns == 'MAND_OBJET'){
						$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($iIncrement, $iRowDynamic, wordwrap($oListe[$zListeColumns], 150));
					} else {
						$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($iIncrement, $iRowDynamic, $oListe[$zListeColumns]);
					}
					$iIncrement++;
				}

				$objPHPExcel->getActiveSheet()->getStyle('P'.$iRowDynamic)->getAlignment()->setWrapText(true);
				$iRowDynamic++;

			}
			

			$callStartTime = microtime(true);

			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');

			$zFileName = "export-dcp-".date("YmdHms").".xlsx";

			header('Content-Type: application/xlsx');
			header('Content-Disposition: attachment;filename="'.$zFileName.'"');
			header('Cache-Control: max-age=0');
			ob_end_clean();
			$objWriter->save(APPLICATION_PATH ."assets/excel/".$zFileName);

			$zResponse =  array(
				'status' => TRUE,
				'name' => $zFileName,
				'iPercent' => ceil($iPercent),
				'iNombreTotal' => $_iNombreTotal,
				'iStart'	=> $iStart,
				'iLength'	=> $iLength,
				'done' => $iDone,
				'file' => base_url() ."assets/excel/".$zFileName
			);
		
			die(json_encode($zResponse));
			exit();
		}
	}

}