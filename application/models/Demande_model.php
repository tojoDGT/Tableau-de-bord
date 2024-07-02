<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Demande_model extends CI_Model {

	function __construct(){
		parent::__construct();

	}
	
	public function insert($oData)
	{
		global $db;
		$zDatabaseOracle =  $db['oracle']['database'] ;
		if($this->db->insert($zDatabaseOracle.'.users', $oData)){
			return $this->db->insert_id();
		}else return false;
		
	} 

	public function update($oData, $_iId){
		global $db;
		$zDatabaseOracle		=  $db['oracle']['database'] ; 
		$this->db->update($zDatabaseOracle.'.users', $oData, "id = ".$_iId);
	}

	public function getEdit($_iId)
	{
		global $db;
		$zDatabaseOracle =  $db['oracle']['database'] ;
		$oQuery = $this->db->get_where($zDatabaseOracle.'.users', array('id' => $_iId));
        return $oQuery->row_array();
	}

	/** 
	* function permettant de retourner le colonne à afficher
	*
	*
	* @return liste
	*/
	public function getSessionColonne ()
	{
		$toColonne = array();
		//unset($_SESSION["colonneAffiche"]);
		if(empty($_SESSION["colonneAffiche"])){
			array_push($toColonne, 'Identifiant-t.ECRI_NUM');
			array_push($toColonne, 'IdentifiantNumInfo-m.MAND_NUM_INFO');
			array_push($toColonne, 'TITULAIRE-tt.TITULAIRE');
			array_push($toColonne, 'Référence-t.ECRI_REF');
			array_push($toColonne, 'Libellé-t.ECRI_LIB');
			array_push($toColonne, 'Date-t.ECRI_DT_CECRITURE');
			array_push($toColonne, 'Propriétaire-t.PROP_CODE');
			array_push($toColonne, 'SOA-m.SOA');
			array_push($toColonne, 'Mode-m.MAND_MODE_PAIE');
			array_push($toColonne, 'Montant-m.MAND_MONTANT1');

			$_SESSION["colonneAffiche"] = serialize($toColonne);
		} else {
			$toColonne = unserialize($_SESSION["colonneAffiche"]);
		}

		return $toColonne;
	}

	public function getDemande(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);
		
		$toGetListeColonne = $this->getSessionColonne();

			
		$toColumns=array(); 

		foreach ($toGetListeColonne as $zColonne){
			$oColonne = explode("-", $zColonne);
			if($oColonne[1] != ""){
				array_push($toColumns, $oColonne[1]);
			}
		}

		$oRequest = $_REQUEST;

		/*
		echo "<pre>";
		print_r ($toColumns);
		echo "</pre>";*/

		//$zSql = "select * from (";

		$zSql = "	select COUNT(tt.TITULAIRE) over () found_rows,t.*,m.soa,m.compte,m.commune,m.ID_MAND,tt.CODE_TIERS,
					(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE m.ASSIGNATAIRE=pc.PSTP_CODE) as ASSIGNATAIRE,
				    (SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE m.MANDATAIRE=pc.PSTP_CODE) as MANDATAIRE,
					m.MAND_VISA_TEF,
					m.MAND_NUM_INFO,  
					m.MAND_OBJET,
					m.MAND_DATE_RECUP,
					tt.TITULAIRE,
					m.MAND_DATE_REEL_VISA,
					CASE
					WHEN m.MAND_MODE_PAIE = 'VB' THEN 'Virement bancaire'
					WHEN m.MAND_MODE_PAIE = 'OO' THEN 'Opération d`ordre'
					WHEN m.MAND_MODE_PAIE = 'BC' THEN 'Bon de Caisse'
					WHEN m.MAND_MODE_PAIE = 'OP' THEN 'Ordre de paiement'
					END MAND_MODE_PAIE,
					CONCAT (TO_CHAR(MAND_MONTANT,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS MAND_MONTANT1

		from T_ECRITURE t,T_MANDAT m, T_TITRE tt WHERE t.ECRI_NUM = m.ECRI_NUM AND tt.MAND_NUM_INFO = m.MAND_NUM_INFO(+) AND tt.ID_MAND = m.ID_MAND " ;

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zSql.=" AND t.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zSql.=" AND m.MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}


		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zSql.=" AND m.TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
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
				$zSql .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
			}
		}

		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   

		   $toMandMode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='MAND_MODE_PAIE[]'){
					if($oData['value']!=""){
						$zValue = "'". $oData['value'] . "'";
						array_push($toMandMode, $zValue);
					}
				}
				
			}
			
			if(sizeof($toMandMode)>0){
				$zSql .=" AND m.MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( t.ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  tt.TITULAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_DT_CECRITURE LIKE '%".$oRequest['search']['value']."%'  ";
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

	public function GetDetail($_iEcriNum, $_iNumMandat, $_iMode){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum . " AND m.MAND_NUM_INFO = " . $_iNumMandat;

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

	public function GetDetailViews($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);

		$zSql = "select * from SUIVI_MDT WHERE  M.ECRI_NUM = " . $_iEcriNum;
		echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}
	

	public function GetTransfert($_iNumMandat){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);

		/*$zSql = "select COUNT(*) over () found_rows,t.*,
		(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE t.BT_ENVOYEUR=pc.PSTP_CODE) as ENVOYEUR,
		(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE t.BT_DESTINATAIRE=pc.PSTP_CODE) as DESTINATAIRE,
		(SELECT LIBELLE_STATUS FROM T_STATUS st WHERE t.BT_STATUS=st.STATUS AND st.TYPE_STATUS='BT') as STATUT
		from T_TRANSFERT t WHERE t.DET_BT_MANDAT = '" . $_iNumMandat . "'";*/

		$zSql = "  SELECT COUNT(*) over () found_rows,
				   (SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE M.ASSIGNATAIRE=pc.PSTP_CODE) as ENVOYEUR,
				   (SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE M.MANDATAIRE=pc.PSTP_CODE) as DESTINATAIRE,
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
				   CONCAT (TO_CHAR(ECRI_MT,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS ECRI_MT11,
				   M.MAND_DATE_RECUP,
				   M.MAND_DATE_REEL_VISA,
				   CASE
					   WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NULL
					   THEN
						   'EN INSTANCE DE TRANSFERT'
					   WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NOT NULL
					   THEN
						   LIB_STATUS
					   WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
							AND NVL (m.mand_rejet, 0) = 0
					   THEN
						   'VISE'
					   WHEN     m.MAND_COMPTE_CREDIT IS NULL
							AND NVL (m.mand_rejet, 0) = 1
					   THEN
						   'REJETE (Motif:' || M.rejet_note || ')'
					   WHEN M.MAND_DATE_TRAIT IS NULL
					   THEN
						   'RECUPERE AU NIVEAU GUICHET UNIQUE'
					   WHEN NVL (m.mand_date_recup,
								 TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
							TO_DATE ('01/01/2019', 'DD/MM/RRRR')
					   THEN
						   'DOSSIER NON PARVENU AU TRESOR'
				   END                STATUT,
				   BT_REF             REFERENCE,
				   CASE
					   WHEN BT_STATUS = '0'
					   THEN
						   TRUNC (BT_ENV_EDIT_DATE)
					   WHEN BT_STATUS = '2'
					   THEN
						   TRUNC (BT_ENV_VALID_DATE)
					   WHEN BT_STATUS = '4'
					   THEN
						   TRUNC (BT_REC_DATE)
					   WHEN BT_STATUS = '5'
					   THEN
						   TRUNC (BT_REC_VALID_DATE)
					   WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NULL
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
				   '' OVPCPAYEUR
			  FROM T_MANDAT          M,
				   T_TITRE           T,
				   T_ECRITURE        E,
				   T_TRANSFERT  TR
			 WHERE 1=1
				   AND M.COMPTE NOT IN ('6011','6131','6522','6521')
				   AND M.MAND_MODE_PAIE = 'OO'
				   AND M.ECRI_NUM = E.ECRI_NUM(+)
				   AND M.ID_MAND = T.ID_MAND(+)
				   AND T.MAND_NUM_INFO = TR.DET_BT_MANDAT(+)";

		$zSql .= "  AND T.MAND_NUM_INFO = '" . $_iNumMandat . "'";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	public function GetVirement($_iNumMandat){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);

		/*$zSql = "select COUNT(*) over () found_rows,v.*,
		(SELECT LIBELLE_STATUS FROM T_STATUS st WHERE v.NOTESTATUS=st.STATUS AND st.TYPE_STATUS='VB') as STATUTNOTE,
		(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE v.OVPCPAYEUR=pc.PSTP_CODE) as PAYEUR
		from T_VIREMENT v WHERE v.INFONUMERO = '" . $_iNumMandat . "'";*/

		$zSql = "  SELECT  V.*,   
				   (SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE v.OVPCPAYEUR=pc.PSTP_CODE) as PAYEUR,
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
						   TRUNC (V.OVDATEVALID)
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
			  FROM T_MANDAT                M,
				   T_TITRE                 T,
				   T_ECRITURE              E,
				   T_VIREMENT  V
			 WHERE 1=1
				   AND M.COMPTE NOT IN ('6011','6131','6522','6521')
				   
				   AND M.ID_MAND = T.ID_MAND
				   AND M.ENTITE = T.ENTITE
				   AND M.ECRI_NUM = E.ECRI_NUM(+)
				  
				   AND T.NUMERO_TITRE = V.TITRENUMERO(+)
				   AND M.MAND_MODE_PAIE = 'VB' ";

		$zSql .= " AND v.INFONUMERO = '" . $_iNumMandat . "'";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	public function GetLEGecriture($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('oracle',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from T_ECRITURE t,T_LGECRITURE m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	

}
