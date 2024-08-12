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

		$zWhere = " WHERE 1=1 ";

		//$zSql = "select COUNT(*) over () found_rows,n.* from V_NORMALITE_COMPTE n where 1=1 " ;

		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( PSTP_LIBELLE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  PSTP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  COMPTE_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  CONCLUSION LIKE '%".$oRequest['search']['value']."%' ) ";
		}

		if( !empty($oRequest['CONCLUSION']) && ($oRequest['CONCLUSION']!="") ) {   
			$zWhere.=" AND norm.CONCLUSION = '" . $oRequest['CONCLUSION'] . "'";
		}

		if( !empty($oRequest['SENS']) && ($oRequest['SENS']!="") ) {   
			$zWhere.=" AND norm.SENS_ENCOURS = '" . $oRequest['SENS'] . "'";
		}

		if( !empty($oRequest['PSTP_CODE']) && ($oRequest['PSTP_CODE']!="") ) {   
			$zWhere.=" AND norm.PSTP_CODE = '" . $oRequest['PSTP_CODE'] . "'";
		}

		if( !empty($oRequest['COMPTE_NUM']) && ($oRequest['COMPTE_NUM']!="") ) {   
			$zWhere.=" AND norm.COMPTE_NUM = '" . $oRequest['COMPTE_NUM'] . "'";
		}

		if($_iAnneeExo!=""){
			$zWhere.=" AND norm.ECRI_EXERCICE = '" . $_iAnneeExo . "' ";
		}

		$zData = @file_get_contents(APPLICATION_PATH ."sql/normalite.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExo), $zData) ; 

		$zDateParam = date("d/m/".$_iAnneeExo) ;

		$zSql = str_replace("%ZDATE%", trim($zDateParam), $zData) ; 
		
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

	/** 
	* function permettant d'afficher la liste des propriétaires codes
	*
	*
	* @return liste en tableau d'objet
	*/

	public function getAllCompte($_zTerm = ''){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select distinct compte_num,compte_lib from COMPTE p
				 WHERE compte_num IN (SELECT distinct lecr_cpt_general from EXECUTION2023.lgecriture)
				 AND p.compte_owner='01' " ;


		if ($_zTerm != '') {
			$zSql .= " AND compte_lib like '%". $_zTerm ."%'" ; 
		}

		$zSql .= " GROUP BY compte_num,compte_lib
				   ORDER BY compte_num " ; 
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}
}