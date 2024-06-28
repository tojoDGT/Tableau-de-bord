<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usager_model extends CI_Model {

	public function insert($oData)
	{
		global $db;
		$zDatabaseFo =  $db['soi']['database'] ;
		if($this->db->insert($zDatabaseFo.'.soi_usager', $oData)){
			return $this->db->insert_id();
		}else return false;
		
	} 

	public function update($oData, $_iId){
		global $db;
		$zDatabaseFo		=  $db['soi']['database'] ; 
		$this->db->update($zDatabaseFo.'.soi_usager', $oData, "usager_id = ".$_iId);
	}

	public function getEdit($_iId)
	{
		global $db;
		$zDatabaseFo =  $db['soi']['database'] ;
		$oQuery = $this->db->get_where($zDatabaseFo.'.soi_usager', array('usager_id' => $_iId));
        return $oQuery->row_array();
	}

	public function getUsager(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toColumns = array( 
			0  => 'usager_nom', 
			1  => 'usager_prenom',
			2  => 'usager_orgrattachement', 
			3  => 'usager_email',
			4  => 'usager_telephone'
		);

		$oRequest = $_REQUEST;
		

		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;

		$zSql=" SELECT SQL_CALC_FOUND_ROWS * FROM $zDatabaseFo.soi_usager  WHERE 1 ";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( usager_nom LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  usager_prenom LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  usager_orgrattachement LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  usager_email LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  usager_telephone LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY usager_nom ASC ";
			}

			if ($_iLimit==0){
				if (isset($oRequest['start']) && isset($oRequest['order'][0]['dir'])){
					$zSql.= "  LIMIT ".$oRequest['start']." ,".$oRequest['length']." ";
				}
			} else {
				$zSql.=" LIMIT 0,10   ";
			}
		} else {
			$zSql.=" ORDER BY usager_nom ASC ";
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
		
		$zSql  = " SELECT MAX(username) as iOrdre FROM $zDatabaseFo.soi_usager LIMIT 0,1" ;

		$zQuery = $this->db->query($zSql);
		$toRow = $zQuery->result();

		$iMax = 1;
		foreach($toRow as $oRow){
			$iMax = $oRow->iOrdre + 1;
		}

		return $iMax;
		
  	}

	public function deleteUsager($_iUsagerId){
		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;
		$this->db->query('delete from '.$zDatabaseFo.'.soi_usager where usager_id = '.$_iUsagerId);
	}


	public function flux_ordre($_iMode,$_iOrdre,$_iId){
		
		global $db;
 		$zDatabaseFo =  $db['soi']['database'] ;

		$toRow = array();
		switch ($_iMode) {

			// monter
			case '1':
				$zSql  = " SELECT usager_id,username FROM $zDatabaseFo.soi_usager WHERE 1 ";
				$zSql  .= " AND username < " . $_iOrdre . " ORDER BY username DESC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;

			// Descendre
			case '2':
				$zSql  = " SELECT usager_id,username FROM $zDatabaseFo.soi_usager WHERE username > " . $_iOrdre . " ORDER BY username ASC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;
		}
		

		foreach($toRow as $oRow){
			$zSql  = " UPDATE $zDatabaseFo.soi_usager SET username = " . $oRow->username . " WHERE usager_id = " . $_iId ;
			$this->db->query($zSql);

			$zSql  = " UPDATE $zDatabaseFo.soi_usager SET username = " . $_iOrdre . " WHERE usager_id = " . $oRow->id ;
			$this->db->query($zSql);
		}
 		
  	}

}
