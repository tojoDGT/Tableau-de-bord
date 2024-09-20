<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage gestion des Utilisateurs d'application de la DGT 
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Utilisateur extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  DGT  
	* @subpackage entité */ 
	function __construct()
	{
		parent:: __construct();
		$this->load->model('Utilisateur_model', 'utilisateur');
		$this->load->model('Dashboard_model', 'dashboard');

		if(empty($this->session->userdata['USERID'])){ redirect('Login');}

	}
	
	/** 
	* function permettant d'afficher la liste des utilisateurs 
	*
	*
	* @return liste
	*/
	public function liste ()
	{
		global $oSmarty ; 
		
		$oData=array();
		$iMenuActifId = 33;
		$iSousMenuActifId = 33;
		$toGetAllData = array();
	
		
		$zLibelle	= "utilisateurs"; 
		$zLibelle1 = "Liste des utilisateurs des applications";
						
		$zPathTpl = ADMIN_TEMPLATE_PATH . "utilisateur/liste.portion.tpl";
		$oData['zBasePath']			= base_url();
		$oData['zLibelle']			= $zLibelle;
		$oData['zLibelle1']			= $zLibelle1;
		$oData['iAccueil']			= $iAccueil;
		$oData['iMenuActifId']		= $iMenuActifId;
		$oData['iSousMenuActifId']  = $iSousMenuActifId;

		$oSmarty->assign('oSession',  $_SESSION);
		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("toGetAllData",$toGetAllData);
		$zPortionTable = $oSmarty->fetch( $zPathTpl );
		$oData['zPortionTable'] = $zPortionTable;
		$this->load_my_view_Common("utilisateur/liste.tpl",$oData);
	}

	/** 
	* function Ajax chargement de la liste des utilisateurs à partir de la base
	*
	* @return Ajax
	*/
	public function getAjax(){
		
		$oUser = array();
		$oCandidat = array();

		$iPc = $this->postGetValue ("pc", 0);
		$zPsCode = $this->postGetValue ("zPsCode", 0);

		$oSession = $_SESSION;

		$oRequest = $_REQUEST;
		$iNombreTotal = 0;

		switch ($iPc){
			case 0:
				$toGetListe = $this->utilisateur->getUtilisateur($iNombreTotal,$this) ;
				break;

			case 1:
				$toGetListe = $this->utilisateur->getUtilisateurPc($iNombreTotal,$this,$zPsCode) ;
				break;

			case 2:
				$toGetListe = $this->utilisateur->getUtilisateurAgent($iNombreTotal,$this) ;
				break;
		}
		
		/*echo "<pre>";
		print_r ($toGetListe);
		echo "</pre>";

		die("tojo");*/

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = '';
			$oDataTemp[] = $oGetListe['USERID'];
			$oDataTemp[] = $oGetListe['LAST_NAME'];
			$oDataTemp[] = $oGetListe['FIRST_NAME'];
			$oDataTemp[] = $oGetListe['EMAIL_CANONICAL'];
			$oDataTemp[] = $oGetListe['ACTIVITYNAME'];
			
			$oDataAssign[] = $oDataTemp;
			$iIncrement++;
		}
		$taJson = array(
						"draw"            => intval( $oRequest['draw'] ),
						"recordsTotal"    => intval( $iNombreTotal ),
						"recordsFiltered" => intval( $iNombreTotal ),
						"data"            => $oDataAssign
					);
		echo json_encode($taJson);
			
    }

	/** 
	* function permettant le la liste des agents avec performance
	*
	* @return template HTML
	*/
	public function getUserPerformance(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);

		$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId) ;
		$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2024',1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2024',1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2024',2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2024',2) ;

		//print_r ($oGetInfo);
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$oSmarty->assign("iUserId", $iUserId);
		$oSmarty->assign("zAfficheValide", $zAfficheValide);
		$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
		$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
		$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/getUserPerformance.tpl" );
		
		
		echo $zTplAffiche ;  
			
    }

	/** 
	* function permettant affichage des rôles
	*
	* @return Ajax
	*/
	public function getRole(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);

		$toApplicationId = array();

		$toGetInfoAgent = $this->utilisateur->getDetailUtilisateur($iUserId) ;

		foreach ($toGetInfoAgent as $oGetInfoAgent){
			array_push($toApplicationId, $oGetInfoAgent['ROLEAPPLIID']);
		}
		$toGetAllApplication = $this->utilisateur->getAllApplication() ;
		
		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("iUserId",$iUserId);
		$oSmarty->assign("toGetInfoAgent",$toGetInfoAgent);
		$oSmarty->assign("toApplicationId",$toApplicationId);
		$oSmarty->assign("toGetAllApplication",$toGetAllApplication);
		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/getRole.tpl" );
		
		echo $zDetailEcriture ;  
			
    }

	/** 
	* function permettant les rôles des agents dans une pposte comptable
	*
	* @return template HTML
	*/
	public function getPcUserRole(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);

		$toApplicationId = array();

		$toGetInfoAgent = $this->utilisateur->getDetailUtilisateur($iUserId) ;

		/*echo "<pre>";
		print_r ($toGetInfoAgent);
		echo "</pre>";*/

		foreach ($toGetInfoAgent as $oGetInfoAgent){
			array_push($toApplicationId, $oGetInfoAgent['ROLEAPPLIID']);
		}
		$toGetAllApplication = $this->utilisateur->getAllApplication() ;
		
		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("iUserId",$iUserId);
		$oSmarty->assign("toGetInfoAgent",$toGetInfoAgent);
		$oSmarty->assign("toApplicationId",$toApplicationId);
		$oSmarty->assign("toGetAllApplication",$toGetAllApplication);
		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/getPcUserRole.tpl" );
		
		echo $zDetailEcriture ;  
			
    }
}