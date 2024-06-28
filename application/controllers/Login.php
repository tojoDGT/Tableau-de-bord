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
		if($this->isLoggedin()){ redirect('utilisateur/liste');}
		$oData['title']='Login Boiler Plate';
		if($_POST)
		{
			$config=array(
				array(
					'field' => 'username',
					'label' => 'Username',
					'rules' => 'trim|required'
				),
				array(
					'field' => 'password',
					'label' => 'Password',
					'rules' => 'trim|required' 
				)
			);
			$this->form_validation->set_rules($config);
			if ($this->form_validation->run() == false) {
				// if validation has errors, save those errors in variable and send it to view
				$oData['errors'] = validation_errors();
				$this->load_my_view_Common('login/login.tpl',$oData);
			} else {
				// if validation passes, check for user credentials from database
				$user = $this->Login_model->checkUser($_POST);
				if ($user) {
				// if an record of user is returned from model, save it in session and send user to dashboard
					$this->session->set_userdata($user);
					//redirect(base_url() . 'reporting/liste/formation/programme');
					redirect('dashboard/stat/general');
				} else {
				// if nothing returns from model , show an error
					$oData['errors'] = 'Sorry! The credentials you have provided are not correct';
					$this->load_my_view_Common('login/login.tpl',$oData);
				}
			}

		}
		else
		{
			$this->load_my_view_Common('login/login.tpl',$oData);
		}

	}
	public function change_password()
	{
		if($this->isLoggedin()){
			$oData['title']='Change Password';
			if($_POST)
			{
				$config=array(
					array(
						'field' => 'old_password',
						'label' => 'Old Password',
						'rules' => 'trim|required|callback_checkPassword'
					),
					array(
						'field' => 'password',
						'label' => 'Password',
						'rules' => 'trim|required'
					),
					array(
						'field' => 'conf_password',
						'label' => 'Confirm Password',
						'rules' => 'trim|required|matches[password]'
					)
				);
				$this->form_validation->set_rules($config);
				if ($this->form_validation->run() == false)
				{
					// if validation has errors, save those errors in variable and send it to view
					$oData['errors'] = validation_errors();
					$this->load_my_view_Common('change_password',$oData);
				}
				else
				{
					// if validation passes, check for user credentials from database
					$this->Login_model->updatePassword($_POST['password'],$this->session->userdata['id']);
					$this->session->set_flashdata('log_success','Congratulations! Password Changed');
					redirect(base_url() . 'reporting/liste/formation/programme');
				}

			}
			else
			{
				$this->load_my_view_Common('change_password',$oData);
			}
		}
		else
		{
			redirect('Login');
		}

	}

	public function dashboard()
	{
		if($this->isLoggedin())
		{
			redirect('campagne/liste');
		}
		else
		{
			redirect('Login');
		}
	}

	public function logout()
	{
		$this->session->sess_destroy();
		redirect('Login');
	}

	public function isLoggedin()
	{
		if(!empty($this->session->userdata['id']))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}