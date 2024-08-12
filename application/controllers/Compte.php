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
					$oDataTemp[] = $oGetListe['ECRI_EXERCICE'];
					$oDataTemp[] = $oGetListe['COMPTE_NUM'];
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['BAL_ENTR_D']), 2, ',', ' ') . " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['BAL_ENTR_C']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['OPER_GEST_D']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['OPER_GEST_C']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['OPER_FIN_GEST_D']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['OPER_FIN_GEST_C']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['TOTAL_G_D']), 2, ',', ' '). " Ar"; 
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['TOTAL_G_C']), 2, ',', ' '). " Ar"; 
					
					$zSens = "";

					switch ($oGetListe['SENS_ENCOURS']){
						case 'DEBITEUR':
							$zSens = "#dc3545";
							
							break;

						case 'CREDITEUR':
							$zSens = "#28a745";
							
							break;

						default:
							$zSens = "#007bff";
							break;
					}
					
					$oDataTemp[] = "<span style=\"color:".$zSens."\"><strong>" . $oGetListe['SENS_ENCOURS'] . "</strong></span>";
					//$oDataTemp[] = $oGetListe['SENSOG'];

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
				$toGetListe = $this->compte->getCompteAVentiler($iAnneeExo,$iNombreTotal,$this) ;

				/*echo "<pre>";
				print_r ($toGetListe);
				echo "</pre>";*/

				$oDataAssign = array();
				$iIncrement = 1;
				foreach ($toGetListe as $oGetListe){
					
					$oDataTemp=array(); 

					$oDataTemp[] = $oGetListe['PSTP_LIBELLE'];
					$oDataTemp[] = $oGetListe['EXERCICE'];
					$oDataTemp[] = $oGetListe['COMPTE'];
					$oDataTemp[] = $oGetListe['REFERENCE_ECRITURE'];
					$oDataTemp[] = $oGetListe['LIBELLE_ECRITURE'];
					$oDataTemp[] = $oGetListe['DATE_ECRITURE'];
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['ECRITURE_MT']), 2, ',', ' ') . " Ar"; 
					$oDataTemp[] = $oGetListe['STATUS'];
					$oDataTemp[] = $oGetListe['PROPRIETAIRE'];
					$oDataTemp[] = $oGetListe['LIBELLE_LIGNE'];
					$oDataTemp[] = number_format(str_replace(",",".",$oGetListe['MONTANT_OPERATION']), 2, ',', ' ') . " Ar";
					
					$zSens		= "";
					$zLibelle	= "";

					switch ($oGetListe['SENS']){
						case 'D':
							$zSens		= "#dc3545";
							$zLibelle	= "DEBITEUR";
							break;

						case 'C':
							$zSens		= "#28a745";
							$zLibelle	= "CREDITEUR";
							
							break;

						default:
							$zSens = "#007bff";
							break;
					}
					
					$oDataTemp[] = "<span style=\"color:".$zSens."\"><strong>" . $zLibelle . "</strong></span>";
					
					$oDataAssign[] = $oDataTemp;
					$iIncrement++;
				}

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

	public function getCompteSelect2(){

		global $oSmarty ;
		
		$zTerm = "" ;
        $tRetour = array () ;

        $iFiltre = 0;
		if (isset ($_GET['q']))
        {
            $zTerm = htmlentities ($_GET['q']) ;
        }
        else
        {
            $zTerm = "" ;
        }

		if (isset ($_GET['iFiltre']))
        {
            $iFiltre = $_GET['iFiltre'] ;
        }

		$toListe = $this->compte->getAllCompte($zTerm);

		/*echo "<pre>";
		print_r ($toListe);
		echo "</pre>";*/

		$iActif = 0;

		$toRes = array();

        foreach ($toListe as $oListe)
        {

            $toTemp         = array () ;
            $toTemp["id"]   = $oListe['COMPTE_NUM'];
            $toTemp["text"] = $oListe['COMPTE_LIB'] ;
            $toRes []       = $toTemp ;
        }

		$zCallback = $_GET ['callback'] ;
        $zToReturn = $zCallback . "(\n" ;
        $zToReturn .= json_encode ($toRes) ;
        $zToReturn .= ")" ;
		
		echo $zToReturn ; 
		
	}

}