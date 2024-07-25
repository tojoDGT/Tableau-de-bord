<?php
/**
* @package DGT
* @subpackage page Authentification
* @author RANDRIANANTENAINA Tojo Michaël
*/
defined('BASEPATH') OR exit('No direct script access allowed');

	class Login extends CI_Controller {
	function __construct()
	{
		/**  
		* Classe qui concerne l'authentification d'un utilisateur
		* @package  DGT  
		* @subpackage entité */ 

		parent::__construct();
		$this->load->model('Login_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
        $this->load->helper('url');
	}

	/** 
	* function permettant d'afficher la page par defaut 
	* pour la connexiob
	*
	* @return redirection page authentification
	*/
	public function index()
	{
		if($this->isLoggedin()){ 
			redirect('utilisateur/liste');
			
		}
		$oData['title']='Login Boiler Plate';
		if($_POST)
		{
			
			$user = $this->Login_model->checkUser($_POST);
			if ($user) {
			
				$this->session->set_userdata($user);
				
				redirect('dashboard/stat/general');
			} else {
			
				$oData['errors'] = 'Sorry! The credentials you have provided are not correct';
				$this->load_my_view_Common('login/login.tpl',$oData);
			}
		}
		else
		{
			$this->load_my_view_Common('login/login.tpl',$oData);
		}

	}
	
	/** 
	* function appelé pour la déconnexion
	* 
	*
	* @return redirection index
	*/
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('Login');
	}

	/** 
	* function permettant de tester si on est connecté/loggé
	* 
	*
	* @return redirection index
	*/
	public function isLoggedin()
	{
		if(!empty($this->session->userdata['USERID']))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}