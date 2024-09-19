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
			array_push($toColonne, 'Identifiant-ECRI_NUM');
			array_push($toColonne, 'IdentifiantNumInfo-MAND_NUM_INFO');
			//array_push($toColonne, 'TITULAIRE-T.TITULAIRE');
			array_push($toColonne, 'Référence-ECRI_REF');
			array_push($toColonne, 'Code tiers-MAND_CODE_TIERS');
			array_push($toColonne, 'Statut-STATUT');
			array_push($toColonne, 'Libellé-ECRI_LIB');
			array_push($toColonne, 'Date-ECRI_DT_CECRITURE');
			array_push($toColonne, 'Propriétaire-PROP_CODE');
			array_push($toColonne, 'SOA-SOA');
			array_push($toColonne, 'Mode-MAND_MODE_PAIE1');
			array_push($toColonne, 'Montant-MAND_MONTANT1');

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

		$_iAnneeExercice = 2023;
		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$_iAnneeExercice = $oRequest['ECRI_EXERCICE'];
		}

		$zWhere = " WHERE 1=1 ";

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zWhere.=" AND EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zWhere.=" AND MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  $oRequest['MAND_MODE_PAIE']!="") {   
			$zWhere.=" AND MAND_MODE_PAIE = '".$oRequest['MAND_MODE_PAIE']."'  ";
		}

		if( !empty($oRequest['PROP_CODE']) &&  $oRequest['PROP_CODE']!="") {   
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zValue){
					array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				$zWhere .=" AND SUBSTR (soa, 1, 2) IN (".implode(",",$toPropCode).")";
			}
		}


		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zWhere.=" AND TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		} 


		if( !empty($oRequest['STATUT']) &&  $oRequest['STATUT']!="") {   
			$zWhere.=" AND STATUT = '".$oRequest['STATUT']."'  ";
		} 

		if( !empty($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zWhere.=" AND ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( !empty($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zWhere.=" AND MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}

		if( !empty($oRequest['date_recup']) &&  $oRequest['date_recup']!="") {   
			$zDateRecup = $oRequest['date_recup'] ; 
			$zDateVisa = $oRequest['date_visa'] ; 

			if ($zDateRecup == $zDateVisa){
				$oDate = new DateTime($_this->date_fr_to_en($zDateVisa,"/","-"));
				$oDate->modify('+1 day');
				$zDateVisa =  $oDate->format('d/m/Y');
			}

			$zWhere.=" AND MAND_DATE_RECUP >= to_date('".$zDateRecup."', 'DD/MM/RRRR') AND  MAND_DATE_REEL_VISA <= to_date('".$zDateVisa."', 'DD/MM/RRRR')";
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
				$zWhere .=" AND SUBSTR (soa, 1, 2) IN (".implode(",",$toPropCode).")";
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
					/* Money electronique */
					$zValue = "'ME'";
					array_push($toMandMode,$zValue);
				}  

				$zWhere .=" AND MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  TITULAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_DT_CECRITURE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
		}


		$zData = @file_get_contents(APPLICATION_PATH ."sql/mdt_vir_tb.sql"); 
		if(sizeof($toMandMode1)>0){
			/* si transfert */
			if(in_array("OO", $toMandMode1)){
				$zData = @file_get_contents(APPLICATION_PATH ."sql/mdt_trsf_specl.sql"); 
			}  
		}

		
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY ECRI_NUM ASC ";
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


		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";


		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
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
	public function getDossier(&$_iNbrTotal = 0,$_this='',$_iAnneeExercice='2023'){
		
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

		//$zSql = "select * from (";

		$zSql = "	select COUNT(*) over () found_rows,t.*,m.soa,m.compte,m.commune,m.ID_MAND,REJET_NOTE,MAND_DT_RJT,
					(SELECT PSTP_LIBELLE FROM EXECUTION".$_iAnneeExercice.".POSTE_COMPTABLE_ORIGINAL pc WHERE M.ASSIGNATAIRE=pc.PSTP_CODE) as ASSIGNATAIRE,
					(SELECT PSTP_LIBELLE FROM EXECUTION".$_iAnneeExercice.".POSTE_COMPTABLE_ORIGINAL pc WHERE M.MANDATAIRE=pc.PSTP_CODE) as MANDATAIRE,
					m.MAND_VISA_TEF,
					m.MAND_NUM_INFO,  
					m.MAND_OBJET,
					m.MAND_DATE_RECUP,
					m.MAND_DATE_REEL_VISA,
					CASE
					WHEN m.MAND_MODE_PAIE = 'VB' THEN 'Virement bancaire'
					WHEN m.MAND_MODE_PAIE = 'OO' THEN 'Opération d`ordre'
					WHEN m.MAND_MODE_PAIE = 'BC' THEN 'Bon de Caisse'
					WHEN m.MAND_MODE_PAIE = 'OP' THEN 'Ordre de paiement'
					END MAND_MODE_PAIE,
					CONCAT (TO_CHAR(MAND_MONTANT,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS MAND_MONTANT1

		from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM " ;

		if( isset($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zSql.=" AND m.ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( isset($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zSql.=" AND m.MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  m.MAND_OBJET LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  m.MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY t.ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY t.ECRI_NUM ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";


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
	public function GetDetail($_iEcriNum, $_iNumMandat, $_iMode, $_iAnneeExercice='2023'){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum . " AND m.MAND_NUM_INFO = " . $_iNumMandat;

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
	public function GetTransfert($_iNumMandat, $_iAnnee="2023"){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);


		$zData = @file_get_contents(APPLICATION_PATH ."sql/transfert_detail.sql"); 
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
	public function GetVirement($_iNumMandat,$_iAnnee="2023"){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		/*$zSql = "select COUNT(*) over () found_rows,v.*,
		(SELECT LIBELLE_STATUS FROM T_STATUS st WHERE v.NOTESTATUS=st.STATUS AND st.TYPE_STATUS='VB') as STATUTNOTE,
		(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE v.OVPCPAYEUR=pc.PSTP_CODE) as PAYEUR
		from T_VIREMENT v WHERE v.INFONUMERO = '" . $_iNumMandat . "'";*/

		/*$zSql = "  SELECT  V.*,   
				   (SELECT PSTP_LIBELLE FROM EXECUTION".$_iAnnee.".POSTE_COMPTABLE_ORIGINAL pc WHERE v.OVPCPAYEUR=pc.PSTP_CODE) as PAYEUR,
				   M.EXERCICE,
				   M.SOA,
				   M.COMPTE,
				   M.MAND_VISA_TEF,
				   M.MAND_NUM_INFO    NUMERO_MANDAT,
				   T.NUMERO_TITRE     NUMERO_TITRE,
				   T.CODE_TIERS       CODE_TIERS,
				   T.TITULAIRE        TITULAIRE,
				   M.MAND_OBJET,
				   T.MONTANT          MONTANT,
				   M.MAND_DATE_RECUP,
				   M.MAND_DATE_REEL_VISA,
				   CASE
					   WHEN NVL (v.OVREF, 'OV') <> 'OV' AND V.NOTESTATUS = '5'
					   THEN
						   'VIRE'
					   WHEN NVL (e.ecri_valid, 0) = 1 AND m.mand_mode_paie = 'VB'
					   THEN
						   'EN INSTANCE DE VIREMENT'
					   WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
							AND NVL (m.mand_rejet, 0) = 0
					   THEN
						   'VISE'
					   WHEN     m.MAND_COMPTE_CREDIT IS NULL
							AND NVL (m.mand_rejet, 0) = 1
					   THEN
						   'REJETE'
					   WHEN M.MAND_DATE_TRAIT IS NULL
					   THEN
						   'RECUPERE AU NIVEAU GUICHET UNIQUE'
					   WHEN NVL (m.mand_date_recup,
								 TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
							TO_DATE ('01/01/2019', 'DD/MM/RRRR')
					   THEN
						   'DOSSIER NON PARVENU AU TRESOR'
				   END                STATUT,
				   V.OVREF            REFERENCE,
				   CASE
					   WHEN NVL (v.OVREF, 'OV') <> 'OV' AND V.NOTESTATUS = '5'
					   THEN
						   TRUNC (V.DATEEXECUTIONOV)
					   WHEN NVL (e.ecri_valid, 0) = 1 AND m.mand_mode_paie = 'VB'
					   THEN
						   TRUNC (E.ECRI_DT_VALID)
					   WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
							AND NVL (m.mand_rejet, 0) = 0
					   THEN
						   TRUNC (M.MAND_DATE_VISA)
					   WHEN     m.MAND_COMPTE_CREDIT IS NULL
							AND NVL (m.mand_rejet, 0) = 1
					   THEN
						   TRUNC (M.MAND_DT_RJT)
					   WHEN M.MAND_DATE_TRAIT IS NULL
					   THEN
						   TRUNC (M.MAND_DATE_RECUP)
					   WHEN NVL (m.mand_date_recup,
								 TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
							TO_DATE ('01/01/2019', 'DD/MM/RRRR')
					   THEN
						   TRUNC (M.MAND_DATE_ORD)
				   END                DATE_SITUATION,
				   M.ASSIGNATAIRE,
				   M.MANDATAIRE,
				   V.OVPCPAYEUR
			  FROM EXECUTION".$_iAnnee.".MANDAT                M,
				   EXECUTION".$_iAnnee.".TITRE_XXI                 T,
				   EXECUTION".$_iAnnee.".ECRITURE              E,
				   V_VIREMENT  V
			 WHERE 1=1
				   AND M.COMPTE NOT IN ('6011','6131','6522','6521')
				   
				   AND M.ID_MAND = T.ID_MAND
				   AND M.ENTITE = T.ENTITE
				   AND M.ECRI_NUM = E.ECRI_NUM(+)
				  
				   AND T.NUMERO_TITRE = V.TITRENUMERO(+)
				   AND M.MAND_MODE_PAIE IN ('VB','ME') ";*/

		$zData = @file_get_contents(APPLICATION_PATH ."sql/compteVirement.sql"); 
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

		$iNombrePagination = ceil($_iNombreTotal /$iLength);

		$iPaginationEnCours = ceil($iStart/$iLength);

		$iPercent = (($iPaginationEnCours)/$iNombrePagination*100);
			
		$iDone = 0;
		if($iNombrePagination == $iPaginationEnCours){
			$iDone = 1;
		}

		if($oRequest['iDepart']==0) {   
			
			//$iDone = 1;
			$iStart += 10 ; 
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

				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $iRowDynamic, "tojo" . $oListe['ASSIGNATAIRE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $iRowDynamic, "tojo" . $oListe['MIN_LIBELLE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $iRowDynamic, $oListe['MIN_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $iRowDynamic, $oListe['ECRINUM']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(4, $iRowDynamic, $oListe['MAND_NUM_INFO']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(5, $iRowDynamic, $oListe['ECRI_LIB']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(6, $iRowDynamic, $oListe['MANDATAIRE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(7, $iRowDynamic, $oListe['MAND_MODE_PAIE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(8, $iRowDynamic, $oListe['INTITULE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(9, $iRowDynamic, $oListe['ENTITE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(10, $iRowDynamic, $oListe['PROP_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(11, $iRowDynamic, $oListe['MAND_VISA_VALIDE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(12, $iRowDynamic, $oListe['MIN_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(13, $iRowDynamic, $oListe['COMPTE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(14, $iRowDynamic, $oListe['MAND_VISA_TEF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(15, $iRowDynamic, wordwrap($oListe['MAND_OBJET'], 150));
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(16, $iRowDynamic, $oListe['MAND_DATE_RECUP']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(17, $iRowDynamic, $oListe['MAND_DATE_REEL_VISA']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(18, $iRowDynamic, $oListe['MAND_NUMERO_BMAND']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(19, $iRowDynamic, $oListe['MAND_MONTANT1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(20, $iRowDynamic, $oListe['ECRI_DT_CECRITURE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(21, $iRowDynamic, $oListe['MAND_DATE_VISA']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(22, $iRowDynamic, $oListe['MAND_DATE_TRAIT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(23, $iRowDynamic, $oListe['ECRI_REF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(24, $iRowDynamic, $oListe['STATUT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(25, $iRowDynamic, $oListe['REJET_NOTE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(26, $iRowDynamic, $oListe['STATUT_PAIEMENT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(27, $iRowDynamic, $oListe['NOTEREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(28, $iRowDynamic, $oListe['DMDVIRREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(29, $iRowDynamic, $oListe['OVEXO']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(30, $iRowDynamic, $oListe['OVREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(34, $iRowDynamic, $oListe['OVPCPAYEUR']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(32, $iRowDynamic, $oListe['DATEEXECUTIONOV']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(33, $iRowDynamic, $oListe['CATEG_DEPENSE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(34, $iRowDynamic, $oListe['STATUTS_NOTE']);

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
				'iPercent' => $iPercent,
				'done' => $iDone,
				'file' => base_url() ."assets/excel/".$zFileName
			);
		
			die(json_encode($zResponse));
			exit();

		} else {

			$iDepart = 0;	
			$iStart += 10 ; 
			$objPHPExcel = new PHPExcel();

			echo date('H:i:s') , " Set document properties" , EOL;
			$objPHPExcel->getProperties()->setCreator("TOJO MICHAEL DGT")
										 ->setLastModifiedBy("TOJO MICHAEL DGT")
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

			
			

			$tHead1 = array(						
							'ASSIGNATAIRE'						=> 	'ASSIGNATAIRE', 
							'MINISTERE'							=> 	'MINISTERE', 
							'MINISTERE CODE'					=> 	'MINISTERE CODE',
							'ECRITURE NUMERO'					=> 	'ECRITURE NUMERO', 
							'NUMERO MANDAT'						=> 	'NUMERO MANDAT', 
							'ECRITURE LIBELLE'					=> 	'ECRITURE LIBELLE',
							'MANDATAIRE'						=> 	'MANDATAIRE', 
							'MODE DE PAIEMENT'					=> 	'MODE DE PAIEMENT',
							'INTITULE'							=> 	'INTITULE',
							'ENTITE'							=> 	'ENTITE', 
							'PROPRIETAIRE CODE'					=> 	'PROPIETAIRE CODE', 
							'VISA VALIDE'						=> 	'VISA VALIDE', 
							'MIN_CODE'							=> 	'MIN_CODE',
							'COMPTE'							=> 	'COMPTE', 
							'VISA TEF'							=> 	'VISA TEF', 
							'MANDAT OBJET'						=> 	'MANDAT OBJET',
							'MANDAT DATE RECUPERATION'			=> 	'MANDAT DATE RECUPERATION', 
							'MANDAT DATE REEL VISA'				=> 	'MANDAT DATE REEL VISA',
							'MANDAT NUMERO BE'					=> 	'MANDAT NUMERO BE',
							'MONTANT'							=> 	'MONTANT', 
							'DATE ECRITURE'						=> 	'DATE ECRITURE', 
							'MANDAT DATE VISA'					=> 	'MANDAT DATE VISA', 
							'MANDAT DATE TRAITEMENT'			=> 	'MANDAT DATE TRAITEMENT',
							'ECRITURE REFERENCE'				=> 	'ECRITURE REFERENCE', 
							'STATUT'							=> 	'STATUT', 
							'REJET NOTE'						=> 	'REJET NOTE',
							'STATUT PAIEMENT'					=> 	'STATUT PAIEMENT', 
							'NOTE REFERENCE'					=> 	'NOTE REFERENCE',
							'DEMANDE DE VIREMENT REFERENCE'		=> 	'DEMANDE DE VIREMENT REFERENCE',
							'OV EXO'							=> 	'OV EXO', 
							'OV REF'							=> 	'OV REF', 
							'OV PC PAYEUR'						=> 	'OV PC PAYEUR', 
							'DATE EXECUTION OV'					=> 	'DATE EXECUTION OV',
							'CATEGORIE DEPENSE'					=> 	'CATEGORIE DEPENSE', 
							'STATUT NOTE'						=> 	'STATUT NOTE'
						  );


			$objPHPExcel->getActiveSheet()->mergeCells("A1:J1");
			$objPHPExcel->getActiveSheet()->getStyle('A1:J1')->applyFromArray($default_style);
			$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, utf8_encode('REPOBLIKAN\'I MADAGASIKARA'));

			$objPHPExcel->getActiveSheet()->mergeCells("A2:J2");
			$objPHPExcel->getActiveSheet()->getStyle('A2:J2')->applyFromArray($default_style);
			$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 2, utf8_encode('Fitiavana - Tanindrazana - Fandrosoana'));


			$iRow = 5 ; 
			$iCol = 0;
			foreach ($tHead1 as $zValue) {
				$objPHPExcel->getActiveSheet()->getStyle('A5:AI5')->applyFromArray($default_style_ligne2);
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

			$tHead1 = array(						
							'ASSIGNATAIRE'						=> 	'ASSIGNATAIRE', 
							'MINISTERE'							=> 	'MINISTERE', 
							'MINISTERE CODE'					=> 	'MINISTERE CODE',
							'ECRITURE NUMERO'					=> 	'ECRITURE NUMERO', 
							'NUMERO MANDAT'						=> 	'NUMERO MANDAT', 
							'ECRITURE LIBELLE'					=> 	'ECRITURE LIBELLE',
							'MANDATAIRE'						=> 	'MANDATAIRE', 
							'MODE DE PAIEMENT'					=> 	'MODE DE PAIEMENT',
							'INTITULE'							=> 	'INTITULE',
							'ENTITE'							=> 	'ENTITE', 
							'PROPRIETAIRE CODE'					=> 	'PROPIETAIRE CODE', 
							'VISA VALIDE'						=> 	'VISA VALIDE', 
							'MIN_CODE'							=> 	'MIN_CODE',
							'COMPTE'							=> 	'COMPTE', 
							'VISA TEF'							=> 	'VISA TEF', 
							'MANDAT OBJET'						=> 	'MANDAT OBJET',
							'MANDAT DATE RECUPERATION'			=> 	'MANDAT DATE RECUPERATION', 
							'MANDAT DATE REEL VISA'				=> 	'MANDAT DATE REEL VISA',
							'MANDAT NUMERO BE'					=> 	'MANDAT NUMERO BE',
							'MONTANT'							=> 	'MONTANT', 
							'DATE ECRITURE'						=> 	'DATE ECRITURE', 
							'MANDAT DATE VISA'					=> 	'MANDAT DATE VISA', 
							'MANDAT DATE TRAITEMENT'			=> 	'MANDAT DATE TRAITEMENT',
							'ECRITURE REFERENCE'				=> 	'ECRITURE REFERENCE', 
							'STATUT'							=> 	'STATUT', 
							'REJET NOTE'						=> 	'REJET NOTE',
							'STATUT PAIEMENT'					=> 	'STATUT PAIEMENT', 
							'NOTE REFERENCE'					=> 	'NOTE REFERENCE',
							'DEMANDE DE VIREMENT REFERENCE'		=> 	'DEMANDE DE VIREMENT REFERENCE',
							'OV EXO'							=> 	'OV EXO', 
							'OV REF'							=> 	'OV REF', 
							'OV PC PAYEUR'						=> 	'OV PC PAYEUR', 
							'DATE EXECUTION OV'					=> 	'DATE EXECUTION OV',
							'CATEGORIE DEPENSE'					=> 	'CATEGORIE DEPENSE', 
							'STATUT NOTE'						=> 	'STATUT NOTE'
						  );

			$iRowDynamic = 6 ; 
			foreach ($_toListe as $oListe) {

				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $iRowDynamic, $oListe['ASSIGNATAIRE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $iRowDynamic, $oListe['MIN_LIBELLE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $iRowDynamic, $oListe['MIN_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $iRowDynamic, $oListe['ECRINUM']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(4, $iRowDynamic, $oListe['MAND_NUM_INFO']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(5, $iRowDynamic, $oListe['ECRI_LIB']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(6, $iRowDynamic, $oListe['MANDATAIRE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(7, $iRowDynamic, $oListe['MAND_MODE_PAIE1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(8, $iRowDynamic, $oListe['INTITULE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(9, $iRowDynamic, $oListe['ENTITE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(10, $iRowDynamic, $oListe['PROP_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(11, $iRowDynamic, $oListe['MAND_VISA_VALIDE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(12, $iRowDynamic, $oListe['MIN_CODE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(13, $iRowDynamic, $oListe['COMPTE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(14, $iRowDynamic, $oListe['MAND_VISA_TEF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(15, $iRowDynamic, wordwrap($oListe['MAND_OBJET'], 150));
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(16, $iRowDynamic, $oListe['MAND_DATE_RECUP']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(17, $iRowDynamic, $oListe['MAND_DATE_REEL_VISA']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(18, $iRowDynamic, $oListe['MAND_NUMERO_BMAND']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(19, $iRowDynamic, $oListe['MAND_MONTANT1']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(20, $iRowDynamic, $oListe['ECRI_DT_CECRITURE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(21, $iRowDynamic, $oListe['MAND_DATE_VISA']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(22, $iRowDynamic, $oListe['MAND_DATE_TRAIT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(23, $iRowDynamic, $oListe['ECRI_REF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(24, $iRowDynamic, $oListe['STATUT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(25, $iRowDynamic, $oListe['REJET_NOTE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(26, $iRowDynamic, $oListe['STATUT_PAIEMENT']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(27, $iRowDynamic, $oListe['NOTEREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(28, $iRowDynamic, $oListe['DMDVIRREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(29, $iRowDynamic, $oListe['OVEXO']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(30, $iRowDynamic, $oListe['OVREF']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(34, $iRowDynamic, $oListe['OVPCPAYEUR']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(32, $iRowDynamic, $oListe['DATEEXECUTIONOV']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(33, $iRowDynamic, $oListe['CATEG_DEPENSE']);
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(34, $iRowDynamic, $oListe['STATUTS_NOTE']);

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
				'iPercent' => $iPercent,
				'iNombreTotal' => $_iNombreTotal,
				'iStart' => $iStart,
				'done' => $iDone,
				'file' => base_url() ."assets/excel/".$zFileName
			);
		
			die(json_encode($zResponse));
			exit();
		}
	}

}