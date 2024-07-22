<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilisateur_model extends CI_Model {

	public function insert($oData)
	{
		global $db;
		$zDatabaseFo =  $db['soi']['database'] ;
		if($this->db->insert($zDatabaseFo.'.users', $oData)){
			return $this->db->insert_id();
		}else return false;
		
	} 

	public function update($oData, $_iId){
		global $db;
		$zDatabaseFo		=  $db['soi']['database'] ; 
		$this->db->update($zDatabaseFo.'.users', $oData, "id = ".$_iId);
	}

	public function getEdit($_iId)
	{
		global $db;
		$zDatabaseFo =  $db['soi']['database'] ;
		$oQuery = $this->db->get_where($zDatabaseFo.'.users', array('id' => $_iId));
        return $oQuery->row_array();
	}


	public function getUtilisateur(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toDB = $this->load->database('specl',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM ".$toDB->database.".V_USERS u WHERE 1=1 ";

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


	public function getUtilisateurPc(&$_iNbrTotal = 0,$_this='',$_zPostCode){
		global $db;


		$toDB = $this->load->database('specl',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM ".$toDB->database.".V_USERS u WHERE 1=1
				AND USERID IN (select DISTINCT MAND_UTR_VISA from T_MANDAT WHERE ENTITE='".$_zPostCode."'
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


	public function getUtilisateurAgent(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toDB = $this->load->database('specl',true);

		$toColumns = array( 
			0  => 'USERID', 
			1  => 'FIRST_NAME',
			2  => 'LAST_NAME', 
			3  => 'EMAIL_CANONICAL'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,USERID,FIRST_NAME,LAST_NAME,EMAIL_CANONICAL FROM ".$toDB->database.".V_USERS u WHERE 1=1
				AND USERID IN (select DISTINCT MAND_UTR_VISA from T_MANDAT WHERE MAND_UTR_VISA IS NOT NULL)";

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

	public function getInfoPostComptable($_zPsCode = 0){
		global $db;


		$toDB = $this->load->database('oracle',true);

		//$zSql=" SELECT  * FROM T_POSTE_COMPTABLE p WHERE p.PSTP_TYPE = 0 AND PSTP_CODE =  '" . $_zPsCode . "'";

		 
		$zSql=" SELECT  ( SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE = '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) valide,
				(  SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE = '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejet,
				( SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE <> '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) as valideAutre,
				(  SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE <> '" . $_zPsCode . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejetAutre,
				p.* FROM T_POSTE_COMPTABLE p WHERE p.PSTP_TYPE = 0 AND PSTP_CODE =  '" . $_zPsCode . "' ";
	
		$zQuery = $toDB->query($zSql);
		$oRow = $zQuery->row();

		return $oRow;

	}

	public function getInfoPostComptableUser($_iUserId = 0){
		global $db;


		$toDB = $this->load->database('oracle',true);

		//$zSql=" SELECT  * FROM T_POSTE_COMPTABLE p WHERE p.PSTP_TYPE = 0 AND PSTP_CODE =  '" . $_zPsCode . "'";

		 
		$zSql=" SELECT  ( SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_VISA = '" . $_iUserId . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) valide,
				(  SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_RJT = '" . $_iUserId . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejet,
				( SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_VISA <> '" . $_iUserId . "' AND MAND_VISA_VALIDE = 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) as valideAutre,
				(  SELECT  COUNT(*) over () found_rows from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_RJT <> '" . $_iUserId . "' AND MAND_VISA_VALIDE = 0 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) rejetAutre,
				 m1.MAND_UTR_VISA FROM T_MANDAT m1 WHERE m1.MAND_UTR_VISA = '" . $_iUserId . "' OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY";

		//echo $zSql;
	
		$zQuery = $toDB->query($zSql);
		$oRow = $zQuery->row();

		return $oRow;

	}


	public function posteComptable(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toDB = $this->load->database('oracle',true);

		$toColumns = array( 
			0  => 'PSTP_CODE', 
			1  => 'PSTP_LIBELLE'
		);

		$oRequest = $_REQUEST;

		$zSql=" SELECT  DISTINCT COUNT(*) over() found_rows,p.* FROM T_POSTE_COMPTABLE p WHERE p.PSTP_TYPE = 0 ";

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

	public function getDetailUtilisateur($_iUserId){
		global $db;

		$toDB = $this->load->database('specl',true);

		$oRequest = $_REQUEST;

		$zSql=" SELECT DISTINCT * FROM ".$toDB->database.".V_USERS u WHERE USERID = '" . $_iUserId . "'";

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		return $toRow;

	}

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

	public function __getUtilisateur(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toColumns = array( 
			0  => 'nom', 
			1  => 'prenom',
			2  => 'email', 
			3  => 'privilege',
			4  => 'isChef',
			5  => 'isDeveloppeur'
		);

		$oRequest = $_REQUEST;
		

		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;

		$zSql=" SELECT SQL_CALC_FOUND_ROWS * FROM $zDatabaseFo.users  WHERE 1 ";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( username LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  nom LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  prenom LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  privilege LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY username ASC ";
			}

			if ($_iLimit==0){
				if (isset($oRequest['start']) && isset($oRequest['order'][0]['dir'])){
					$zSql.= "  LIMIT ".$oRequest['start']." ,".$oRequest['length']." ";
				}
			} else {
				$zSql.=" LIMIT 0,10   ";
			}
		} else {
			$zSql.=" ORDER BY username ASC ";
			if ($_iLimit==0){
				$zSql.=" LIMIT 0,10   ";
			}
		}

		//echo $zSql;

		$zQuery = $this->db->query($zSql);
		$toRow = $zQuery->result_array();
		$zQuery->free_result();

		
        $zQueryDataCount = "SELECT FOUND_ROWS() AS iNumRows" ;

		$zQuery = $this->db->query($zQueryDataCount);
		$toDataCount = $zQuery->result_array();
		$zQuery->free_result();

		foreach ($toDataCount as $oDataCount){
			$_iNbrTotal = $oDataCount['iNumRows'] ;
		}


		return $toRow;

	}

	public function maxOrdre(){
		
		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;

		$toRow = array();
		
		$zSql  = " SELECT MAX(username) as iOrdre FROM $zDatabaseFo.users LIMIT 0,1" ;

		$zQuery = $this->db->query($zSql);
		$toRow = $zQuery->result();

		$iMax = 1;
		foreach($toRow as $oRow){
			$iMax = $oRow->iOrdre + 1;
		}

		return $iMax;
		
  	}

	public function deleteUtilisateur($_iUtilisateurId){
		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;
		$this->db->query('delete from '.$zDatabaseFo.'.users where id = '.$_iUtilisateurId);
	}


	public function flux_ordre($_iMode,$_iOrdre,$_iId){
		
		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;

		$toRow = array();
		switch ($_iMode) {

			// monter
			case '1':
				$zSql  = " SELECT id,username FROM $zDatabaseFo.users WHERE 1 ";
				$zSql  .= " AND username < " . $_iOrdre . " ORDER BY username DESC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;

			// Descendre
			case '2':
				$zSql  = " SELECT id,username FROM $zDatabaseFo.users WHERE username > " . $_iOrdre . " ORDER BY username ASC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;
		}
		

		foreach($toRow as $oRow){
			$zSql  = " UPDATE $zDatabaseFo.users SET username = " . $oRow->username . " WHERE id = " . $_iId ;
			$this->db->query($zSql);

			$zSql  = " UPDATE $zDatabaseFo.users SET username = " . $_iOrdre . " WHERE id = " . $oRow->id ;
			$this->db->query($zSql);
		}
 		
  	}

}
