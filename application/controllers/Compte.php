<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage modules comptes
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Compte extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  DGT  
	* @subpackage entité */ 
	function __construct()
	{
		parent:: __construct();
		$this->load->model('Compte_model', 'compte');
		$this->load->model('Dashboard_model', 'dashboard');

		if(empty($this->session->userdata['USERID'])){ redirect('Login');}

	}
	
	/** 
	* function permettant d'afficher la liste des comptes 
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
	
		
		$zLibelle	= "comptes"; 
		$zLibelle1 = "Liste des comptes des applications";
						
		$zPathTpl = ADMIN_TEMPLATE_PATH . "compte/liste.portion.tpl";
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
		$this->load_my_view_Common("compte/liste.tpl",$oData);
	}

	/** 
	* function Ajax chargement de la liste des comptes à partir de la base
	*
	* @return Ajax
	*/
	public function getAjax(){
		
		$oUser = array();
		$oCandidat = array();

		$iSwitch = $this->postGetValue ("iSwitch", 1); 
		$iAnneeExo = $this->postGetValue ("iAnnee", 2023); 

		$oSession = $_SESSION;

		$oRequest = $_REQUEST;
		$iNombreTotal = 0;

		switch ($iSwitch){
			case 1:
				$toGetListe = $this->compte->getCompteNormalite($iAnneeExo,$iNombreTotal,$this) ;

				/*echo "<pre>";
				print_r ($toGetListe);
				echo "</pre>";*/

				$oDataAssign = array();
				$iIncrement = 1;
				foreach ($toGetListe as $oGetListe){
					
					$oDataTemp=array(); 

					$oDataTemp[] = $oGetListe['PSTP_LIBELLE'];
					$oDataTemp[] = $oGetListe['PSTP_CODE'];
					$oDataTemp[] = $oGetListe['COMPTE_NUM'];
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['SOLDE_DEBIT']), 2, ',', ' ') . " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['SOLDE_CREDIT']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['TOTAL_G_D']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['TOTAL_G_C']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = $oGetListe['SENSFIN'];
					$oDataTemp[] = $oGetListe['SENSOG'];

					$zBadge = "badge-danger";
					$zFa = "far fa-thumbs-up";
					switch ($oGetListe['CONCLUSION']){

						case 'SOLDE ANORMAL':
						case 'COMPTE INEXISTANT':
							$zBadge = "badge-danger";
							$zFa = "fas fa-exclamation-circle";
							break;

						case 'COMPTE REDRESSE':
							$zBadge = "badge-warning";
							$zFa = "fas fa-exclamation-circle";
							break;

						case 'SOLDE NORMAL':
							$zBadge = "badge-success";
							$zFa = "far fa-thumbs-up";
							break;
					}
					
					$zConclusion = "<small style=\"padding:10px;\" class=\"badge ".$zBadge."\"><i class=\"far ".$zFa."\"></i> ".$oGetListe['CONCLUSION']."</small>";
					
					$oDataTemp[] = $zConclusion;
					
					$oDataAssign[] = $oDataTemp;
					$iIncrement++;
				}

				break;

			case 2:
				/*$toGetListe = $this->compte->getComptePc($iNombreTotal,$this,$zPsCode) ;
				
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
				}*/

				break;

			case 3:
				/*$toGetListe = $this->compte->getCompteAgent($iNombreTotal,$this) ;

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
				}*/
				break;

			case 4:
				/*$toGetListe = $this->compte->getCompteAgent($iNombreTotal,$this) ;

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
				}*/
				break;
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
	* function permettant ...
	*
	* @return template HTML
	*/
	public function getCompte(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);

		$oGetInfo = $this->compte->getInfoPostComptableUser($iUserId) ;
		$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2023',1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2023',1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2023',2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2023',2) ;

		//print_r ($oGetInfo);
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$oSmarty->assign("iUserId", $iUserId);
		$oSmarty->assign("zAfficheValide", $zAfficheValide);
		$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
		$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
		$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "compte/getUserPerformance.tpl" );
		
		
		echo $zTplAffiche ;  
			
    }
}