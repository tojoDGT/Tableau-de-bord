<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage le modèle concenrnant les comptes
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Compte_model extends CI_Model {

	/**  
	* Classe qui concerne les comptes
	* @package  DGT  
	* @subpackage entité */ 
	function __construct(){
		parent::__construct();

	}

	/** 
	* function permettant d'afficher la liste de normalité de compte
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function getCompteNormalite($_iAnneeExo,&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		$toRow = array();

		$toDB = $this->load->database('catia',true);
		

		$toColumns = array( 
			0  => 'PSTP_LIBELLE', 
			1  => 'PSTP_CODE',
			2  => 'ECRI_EXERCICE', 
			3  => 'CLASSE',
			4  => 'COMPTE_NUM',
			5  => 'BAL_ENTR_D',
			6  => 'BAL_ENTR_C', 
			7  => 'OPER_GEST_D',
			8  => 'OPER_GEST_C', 
			9  => 'OPER_FIN_GEST_D',
			10  => 'OPER_FIN_GEST_C',
			11  => 'TOTAL_G_D',
			12  => 'TOTAL_G_C', 
			13  => 'SOLDE_DEBIT',
			14  => 'SOLDE_CREDIT', 
			15  => 'SENSFIN',
			16  => 'SENSOG',
			17  => 'CONCLUSION'
		);

		$oRequest = $_REQUEST;

		//$zSql = "select * from (";

		$zWhere = "";

		//$zSql = "select COUNT(*) over () found_rows,n.* from V_NORMALITE_COMPTE n where 1=1 " ;

		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( PSTP_LIBELLE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  PSTP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  COMPTE_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  CONCLUSION LIKE '%".$oRequest['search']['value']."%' ) ";
		}

		if($_iAnneeExo!=""){
			$zWhere.=" AND ecriture.ECRI_EXERCICE = '" . $_iAnneeExo . "' ";
		}

		$zData = @file_get_contents(APPLICATION_PATH ."sql/normalite.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ZDATE%", '31/12/2023', $zData) ; 
		
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


		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}
}