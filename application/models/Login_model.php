<?php
class Login_model extends CI_Model{
	function __construct(){
		parent::__construct();
	}

	public function checkUser($data)
	{
		global $db;


		$toDB = $this->load->database('specl',true);

		$zSql=" SELECT DISTINCT * FROM ".$toDB->database.".V_USERS_TBLBOARD u WHERE USERID = '" . $data['USERID'] . "' AND ROLEVALID = 1 AND EMAIL_CANONICAL IS NOT NULL ";

		/*echo $zSql;
		die();*/

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*print_r ($toRow);
		die();*/
		$zQuery->free_result();

		if(count($toRow)>0)
		{
			print_r ($toRow[0]);
			return $toRow[0];
		}
		else
		{
			return false;
		}
	}
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

	public function updatePassword($password,$id)
	{
		$pass=array(
			'password' => sha1(md5($password))
		);
		$this->db->WHERE('USERID',$id)->update('users',$pass);
	}
}
?>