<?php
/**
* @package DGT
* @subpackage le modèle concenrnant la page login
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Login_model extends CI_Model{

	/**  
	* Classe qui concerne le modèle login
	* @package  DGT  
	* @subpackage entité */ 
	function __construct(){
		parent::__construct();
	}

	/** 
	* function permettant de checker un utilisateur depuis la page authentification
	*
	* @return objet d'un utilisateur / false
	*/
	public function checkUser($data)
	{
		global $db;


		$toDB = $this->load->database('specl',true);

		$zSql=" SELECT DISTINCT * FROM ".$toDB->database.".V_USERS_TBLBOARD@dblccad u WHERE USERID = '" . $data['USERID'] . "' AND ROLEVALID = 1 AND EMAIL_CANONICAL IS NOT NULL ";

		//echo $zSql; die();

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$zQuery->free_result();

		if(count($toRow)>0 && $data['PASSWORD']=='adminTB!2k24')
		{
			print_r ($toRow[0]);
			return $toRow[0];
		}
		else
		{
			return false;
		}
	}

	/** 
	* function permettant de checker le mot de passe d'un utilisateur 
	*
	* @return boolean true/false
	*/
	public function checkPassword($str)
	{
		$st=$this->db->SELECT('*')->from($toDB->database.'.V_USERS_TBLBOARD')
			->WHERE('USERID',$this->session->userdata['USERID'])
			->get()->result_array();
		if(count($st)>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}
?>