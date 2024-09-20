<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage le modèle concenrnant les utilisateurs
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Utilisateur_model extends CI_Model {

	

	/** 
	* function permettant d'afficher la liste des utilisateurs
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet des utilisateurs
	*/
	public function getUtilisateur(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toDB = $this->load->database('catia',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM specl.V_USERS u WHERE 1=1 ";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( USERID LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  FIRST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  LAST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  EMAIL_CANONICAL LIKE '%".$oRequest['search']['value']."%' ) ";
		}


		$zSql .= " GROUP BY USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL ";
		
		$zDebut = 0;
		$zFin = 10;

		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY FIRST_NAME ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY FIRST_NAME ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		
        if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}


	public function getUtilisateurPc(&$_iNbrTotal = 0,$_this='',$_zPostCode, $_iAnneeExercice='2024'){
		global $db;


		$toDB = $this->load->database('catia',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM specl.V_USERS u WHERE 1=1
				AND USERID IN (select DISTINCT MAND_UTR_VISA from EXECUTION".$_iAnneeExercice.".MANDAT WHERE ENTITE='".$_zPostCode."'
				AND MAND_UTR_VISA IS NOT NULL)";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( USERID LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  FIRST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  LAST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  EMAIL_CANONICAL LIKE '%".$oRequest['search']['value']."%' ) ";
		}


		$zSql .= " GROUP BY USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL ";
		
		$zDebut = 0;
		$zFin = 10;

		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY FIRST_NAME ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY FIRST_NAME ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		
        if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher la liste des utilisateurs des postes comptables
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet des utilisateurs
	*/
	public function getUtilisateurAgent(&$_iNbrTotal = 0,$_this='', $_iAnneeExercice='2024'){
		global $db;


		$toDB = $this->load->database('catia',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM specl.V_USERS u WHERE 1=1
				AND USERID IN (select DISTINCT MAND_UTR_VISA from EXECUTION".$_iAnneeExercice.".MANDAT WHERE MAND_UTR_VISA IS NOT NULL)";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( USERID LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  FIRST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  LAST_NAME LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  EMAIL_CANONICAL LIKE '%".$oRequest['search']['value']."%' ) ";
		}


		$zSql .= " GROUP BY USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL ";
		
		$zDebut = 0;
		$zFin = 10;

		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY FIRST_NAME ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY FIRST_NAME ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		
        if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher les infos des postes comptables
	*
	* @param integer $_zPsCode : poste comptable indiqué
	*
	* @return liste en tableau d'objet des utilisateurs
	*/
	public function getInfoPostComptable($_zPsCode = 0, $_iAnneeExercice='2024'){
		global $db;


		$toDB = $this->load->database('catia',true);

		//$zSql=" SELECT  * FROM EXECUTION".$_iAnnee.".POSTE_COMPTABLE_ORIGINAL  p WHERE p.PSTP_TYPE = 0 AND PSTP_CODE =  '" . $_zPsCode . "'";

		 
		$zSql=" SELECT  ( SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE = '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) valide,
				(  SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE = '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejet,
				( SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE <> '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) as valideAutre,
				(  SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE <> '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejetAutre,
				p.* FROM EXECUTION".$_iAnneeExercice.".POSTE_COMPTABLE_ORIGINAL  p WHERE p.PSTP_TYPE = 0 AND PSTP_CODE =  '" . $_zPsCode . "' ";
	
		//echo $zSql;
		$zQuery = $toDB->query($zSql);
		$oRow = $zQuery->row();

		return $oRow;

	}

	/** 
	* function permettant d'afficher les infos des postes comptables d'un utilisateur
	*
	* @param integer $_iUserId : utilisateur indiqué
	*
	* @return liste en tableau d'objet des utilisateurs
	*/
	public function getInfoPostComptableUser($_iUserId = 0, $_iAnneeExercice='2024'){
		global $db;


		$toDB = $this->load->database('catia',true);

		$zSql=" SELECT  ( SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_VISA = '" . $_iUserId . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) valide,
				(  SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_RJT = '" . $_iUserId . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejet,
				( SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_VISA <> '" . $_iUserId . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) as valideAutre,
				(  SELECT  COUNT(*) over () found_rows from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_RJT <> '" . $_iUserId . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejetAutre,
				 m1.MAND_UTR_VISA FROM EXECUTION".$_iAnneeExercice.".MANDAT m1 WHERE m1.MAND_UTR_VISA = '" . $_iUserId . "' OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY";
	
		$zQuery = $toDB->query($zSql);
		$oRow = $zQuery->row();

		return $oRow;

	}

	/** 
	* function permettant d'afficher la liste des postes comptables
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet des postes comptables
	*/
	public function posteComptable(&$_iNbrTotal = 0,$_this='',$iLimit=0,$_iAnnee='2024'){
		global $db;


		$toDB = $this->load->database('catia',true);

		$toColumns = array( 
			0  => 'PSTP_CODE', 
			1  => 'PSTP_LIBELLE'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,p.* FROM EXECUTION".$_iAnnee.".POSTE_COMPTABLE_ORIGINAL  p WHERE p.PSTP_TYPE = 0 ";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( PSTP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  PSTP_LIBELLE LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		$zDebut = 0;
		$zFin = 10;

		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY PSTP_LIBELLE ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY PSTP_LIBELLE ASC ";
		}

		if($iLimit == 0){
			$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";
		}

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		
        if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher les détails d'un utilisateur
	*
	* @param integer $_iUserId : utilisateur indiqué
	*
	* @return liste en tableau d'objet d'un utilisateur
	*/
	public function getDetailUtilisateur($_iUserId){
		global $db;

		$toDB = $this->load->database('specl',true);

		$oRequest = $_REQUEST;

		$zSql=" SELECT DISTINCT * FROM specl.V_USERS u WHERE USERID = '" . $_iUserId . "'";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		return $toRow;

	}

	/** 
	* function permettant d'afficher les applications
	*
	*
	* @return liste en tableau d'objet
	*/
	public function getAllApplication(){
		global $db;

		$toDB = $this->load->database('specl',true);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  * FROM ".$toDB->database.".USERINFOAPPLI ";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		return $toRow;

	}

}