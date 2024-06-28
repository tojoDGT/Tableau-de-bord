<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mission_model extends CI_Model {

	public function insert($oData)
	{
		global $db;
		$zDatabaseFo =  $db['cnfifo']['database'] ;
		if($this->db->insert($zDatabaseFo.'.cnfifo_mission', $oData)){
			return $this->db->insert_id();
		}else return false;
		
	} 

	public function update($oData, $_iId){
		global $db;
		$zDatabaseFo		=  $db['cnfifo']['database'] ; 
		$this->db->update($zDatabaseFo.'.cnfifo_mission', $oData, "mission_id = ".$_iId);
	}

	public function getEdit($_iId)
	{
		global $db;
		$zDatabaseFo =  $db['cnfifo']['database'] ;
		$oQuery = $this->db->get_where($zDatabaseFo.'.cnfifo_mission', array('mission_id' => $_iId));
        return $oQuery->row_array();
	}

	public function getMission(&$_iNbrTotal = 0,$_this=''){
		global $db;


		$toColumns = array( 
			0  => 'mission_ordre', 
			1  => 'mission_titre',
			2  => 'mission_descriptionCourt', 
			3  => 'mission_image',
		);

		$oRequest = $_REQUEST;
		

		global $db;
 		$zDatabaseFo =  $db['cnfifo']['database'] ;

		$zSql=" SELECT SQL_CALC_FOUND_ROWS * FROM $zDatabaseFo.cnfifo_mission  WHERE 1 ";

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( mission_image LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  mission_titre LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  mission_descriptionCourt LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  mission_contenu LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY mission_ordre ASC ";
			}

			if ($_iLimit==0){
				if (isset($oRequest['start']) && isset($oRequest['order'][0]['dir'])){
					$zSql.= "  LIMIT ".$oRequest['start']." ,".$oRequest['length']." ";
				}
			} else {
				$zSql.=" LIMIT 0,10   ";
			}
		} else {
			$zSql.=" ORDER BY mission_ordre ASC ";
			if ($_iLimit==0){
				$zSql.=" LIMIT 0,10   ";
			}
		}

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
 		$zDatabaseFo =  $db['cnfifo']['database'] ;

		$toRow = array();
		
		$zSql  = " SELECT MAX(mission_ordre) as iOrdre FROM $zDatabaseFo.cnfifo_mission LIMIT 0,1" ;

		$zQuery = $this->db->query($zSql);
		$toRow = $zQuery->result();

		$iMax = 1;
		foreach($toRow as $oRow){
			$iMax = $oRow->iOrdre + 1;
		}

		return $iMax;
		
  	}

	public function deleteMission($_iMissionId){
		global $db;
 		$zDatabaseFo =  $db['cnfifo']['database'] ;
		$this->db->query('delete from '.$zDatabaseFo.'.cnfifo_mission where mission_id = '.$_iMissionId);
	}


	public function flux_ordre($_iMode,$_iOrdre,$_iId){
		
		global $db;
 		$zDatabaseFo =  $db['cnfifo']['database'] ;

		$toRow = array();
		switch ($_iMode) {

			// monter
			case '1':
				$zSql  = " SELECT mission_id,mission_ordre FROM $zDatabaseFo.cnfifo_mission WHERE 1 ";
				$zSql  .= " AND mission_ordre < " . $_iOrdre . " ORDER BY mission_ordre DESC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;

			// Descendre
			case '2':
				$zSql  = " SELECT mission_id,mission_ordre FROM $zDatabaseFo.cnfifo_mission WHERE mission_ordre > " . $_iOrdre . " ORDER BY mission_ordre ASC LIMIT 0,1" ;

				$zQuery = $this->db->query($zSql);
				$toRow = $zQuery->result();

				break;
		}
		

		foreach($toRow as $oRow){
			$zSql  = " UPDATE $zDatabaseFo.cnfifo_mission SET mission_ordre = " . $oRow->mission_ordre . " WHERE mission_id = " . $_iId ;
			$this->db->query($zSql);

			$zSql  = " UPDATE $zDatabaseFo.cnfifo_mission SET mission_ordre = " . $_iOrdre . " WHERE mission_id = " . $oRow->mission_id ;
			$this->db->query($zSql);
		}
 		
  	}

}
