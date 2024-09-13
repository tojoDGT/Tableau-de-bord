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
			array_push($toColonne, 'Identifiant-E.ECRI_NUM');
			array_push($toColonne, 'IdentifiantNumInfo-M.MAND_NUM_INFO');
			//array_push($toColonne, 'TITULAIRE-T.TITULAIRE');
			array_push($toColonne, 'Référence-E.ECRI_REF');
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

		$_iAnneeExercice = 2023;
		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$_iAnneeExercice = $oRequest['ECRI_EXERCICE'];
		}


		$zWhere = " ";

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zWhere.=" AND E.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zWhere.=" AND M.MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}


		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zWhere.=" AND M.TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		} 

		if( !empty($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zWhere.=" AND M.ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( !empty($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zWhere.=" AND M.MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}

		if( !empty($oRequest['date_recup']) &&  $oRequest['date_recup']!="") {   
			$zDateRecup = $oRequest['date_recup'] ; 
			$zDateVisa = $oRequest['date_visa'] ; 

			if ($zDateRecup == $zDateVisa){
				$oDate = new DateTime($_this->date_fr_to_en($zDateVisa,"/","-"));
				$oDate->modify('+1 day');
				$zDateVisa =  $oDate->format('d/m/Y');
			}

			$zWhere.=" AND M.MAND_DATE_RECUP >= to_date('".$zDateRecup."', 'DD/MM/RRRR') AND  M.MAND_DATE_REEL_VISA <= to_date('".$zDateVisa."', 'DD/MM/RRRR')";
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
				$zWhere .=" AND SUBSTR (M.soa, 1, 2) IN (".implode(",",$toPropCode).")";
			}
		}

		$toMandMode1 = array();
		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   

		   $toMandMode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='MAND_MODE_PAIE[]'){
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

				$zWhere .=" AND M.MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( E.ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  E.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  E.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  T.TITULAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  E.ECRI_DT_CECRITURE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  E.PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  E.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  M.MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
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
				$zSql.=" ORDER BY E.ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY E.ECRI_NUM ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";


		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

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
}