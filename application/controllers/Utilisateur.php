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
		$this->load->model('Demande_model', 'demande');

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

				break;

			case 1:
				$toGetListe = $this->utilisateur->getUtilisateurPc($iNombreTotal,$this,$zPsCode) ;

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

				break;

			case 2:
				$toGetListe = $this->utilisateur->getUtilisateurAgent($iNombreTotal,$this) ;

				$oDataAssign = array();
				$iIncrement = 1;
				foreach ($toGetListe as $oGetListe){
					
					$oDataTemp=array(); 

					//$oDataTemp[] = '';
					$oDataTemp[] = $oGetListe['USERID'];
					$oDataTemp[] = $oGetListe['USERNAME'];
					$oDataTemp[] = $oGetListe['USERFIRSTNAME'];
					$oDataTemp[] = $oGetListe['ADRESSE'];
					$oDataTemp[] = $oGetListe['USERMAIL'];

					$zAction = '<a title="Consultation" alt="Consultation" libelle="'.$oGetListe['USERNAME'].' '.$oGetListe['USERFIRSTNAME'].'" id="'.$oGetListe['USERID'].'" onClick="getTabPc(this);" title="Consultation" style="cursor:pointer;" class="action dialog-link"><i style="font-size:22px;color:#12105A" class="fa fa-search"></i></a>&nbsp;&nbsp;';

					$oDataTemp[] = $zAction;
					
					$oDataAssign[] = $oDataTemp;
					$iIncrement++;
				}

				break;
		}
		
		/*echo "<pre>";
		print_r ($toGetListe);
		echo "</pre>";

		die("tojo");*/

		
		$taJson = array(
						"draw"            => intval( $oRequest['draw'] ),
						"recordsTotal"    => intval( $iNombreTotal ),
						"recordsFiltered" => intval( $iNombreTotal ),
						"data"            => $oDataAssign
					);
		echo json_encode($taJson);
			
    }

	/** 
	* function permettant d'afficher l'onglet relatif à un poste comptable
	*
	* @return template HTML
	*/
	public function getTabsUser(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$iUserId = $this->postGetValue ("iUserId", 0);
		$iAnneeExercice = $this->postGetValue ("iAnneeExercice", '2024');

		$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId,$iAnneeExercice) ;
		$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,2) ;

		/*print_r ($oGetInfo);*/
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$oSmarty->assign("iUserId", $iUserId);
		$oSmarty->assign("zAfficheValide", $zAfficheValide);
		$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
		$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
		$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
		//$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/getUserPerformance.tpl" );
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/agent/statistique.tpl" );


		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign('zTplAffiche',  $zTplAffiche);
		$zHtmlGraph = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/agent/parametre.tpl" );
		
		
		echo $zHtmlGraph;
			
    }

	/** 
	* function permettant d'afficher l'onglet relatif à un poste comptable
	*
	* @return template HTML
	*/
	public function getInfoCount(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$iUserId = $this->postGetValue ("iUserId", 0);
		$iAnneeExercice = $this->postGetValue ("iAnneeExercice", '2024');

		$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId,$iAnneeExercice) ;

		$zResponse =  array(
				'VALIDE' => $oGetInfo->VALIDE,
				'REJET' => $oGetInfo->REJET,
		);

		echo json_encode($zResponse);
			
    }

	/** 
	* function get statitistique global
	*
	* @return template HTML
	*/
	public function getTabsAgentActive(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zType = $this->postGetValue ("iType", 'statistique');
		$iUserId = $this->postGetValue ("iUserId", ''); 
		$iAnneeExercice = $this->postGetValue ("iAnneeExercice", '2024');

		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign("iUserId", $iUserId);
		switch ($zType){

			case 'statistique':

				$iUserId = $this->postGetValue ("iUserId", 0);

				$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId,$iAnneeExercice) ;
				$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,1) ;
				$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,1) ;

				$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,2) ;
				$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,2) ;

				$oSmarty->assign("oGetInfo", $oGetInfo);
				$oSmarty->assign("zAfficheValide", $zAfficheValide);
				$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
				$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
				$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
				$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/agent/statistique.tpl" );
				break;

			case 'valider':
			case 'refuser':
				$toColonne = $this->demande->getSessionColonne();
				$oSmarty->assign("zBasePath", base_url());
				$oSmarty->assign("zPsCode", $zPsCode);
				$oSmarty->assign("toColonne", $toColonne);
				$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/agent/".$zType.".tpl" );
				break;

		}


		echo $zTplAffiche;
			
    }



	/** 
	* function permettant le la liste des agents avec performance
	*
	* @return template HTML
	*/
	public function getUserPerformance(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);
		$iAnneeExercice = $this->postGetValue ("iAnneeExercice", '2024');

		$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId,$iAnneeExercice) ;
		$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,$iAnneeExercice,2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,$iAnneeExercice,2) ;

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