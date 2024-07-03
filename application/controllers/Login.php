<?php
defined('BASEPATH') OR exit('No direct script access allowed');

	class Login extends CI_Controller {
	function __construct()
	{
		parent::__construct();
		$this->load->model('Login_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
        $this->load->helper('url');
	}

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
	
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('Login');
	}

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