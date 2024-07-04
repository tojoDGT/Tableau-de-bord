<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package SOI
* @subpackage Demande de la page accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Demande extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  SOI  
	* @subpackage entité */ 
	function __construct()
	{ 
		parent:: __construct();
		$this->load->model('Demande_model', 'demande');

		if(empty($this->session->userdata['USERID'])){ redirect('Login');}

	}
	 
	/** 
	* function permettant d'afficher la liste des demandes 
	*
	*
	* @return liste
	*/
	public function liste ()
	{
		global $oSmarty ; 
		
		$oData=array();
		$iMenuActifId = 3;
		$iSousMenuActifId = 5;
		$toGetAllData = array();
	
		$zLibelle = "Liste des demandes de la SOI";
		$zLibelle1 = "Demande"; 
						
		$zPathTpl = ADMIN_TEMPLATE_PATH . "demande/liste.portion.tpl";
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
		$this->load_my_view_Common("demande/liste.tpl",$oData);
	}


	/** 
	* function Ajax chargement de la liste à partir de la base
	*
	* @return Ajax
	*/
	public function getAjax(){
		
		$oUser = array();
		$oCandidat = array();

		$oSession = $_SESSION;

		$oRequest = $_REQUEST;

		$iTypeAfficheSearch	= $this->postGetValue ("iTypeAfficheSearch", 1);

		//print_r($oRequest);
		//die();

		$toColonne = $this->demande->getSessionColonne();

		//print_r ($toColonne);

		$iNombreTotal = 0;

		$toGetListe = $this->demande->getDemande($iNombreTotal,$this) ; 

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = '';

			foreach ($toColonne as $oColonne){
				$oColonne = explode(".", $oColonne);
				$oDataTemp[] = $oGetListe[$oColonne[1]];
			}

			// cas REGULARISATION
			if($iTypeAfficheSearch==2){
				$zClass="badge-secondary";

				if($oGetListe["STATUT"]=='VISE'){
					$zClass="badge-success";
				}
				
				$oDataTemp[] = '<span class="badge '.$zClass.'">'.$oGetListe["STATUT"].'</span>';
			}
			
			
			$oDataAssign[] = $oDataTemp;
			$iIncrement++;
		}

		//print_r ($oDataTemp);
		$taJson = array(
						"draw"            => intval( $oRequest['draw'] ),
						"recordsTotal"    => intval( $iNombreTotal ),
						"recordsFiltered" => intval( $iNombreTotal ),
						"data"            => $oDataAssign
					);

		/*echo "<pre>";
		print_r ($taJson);
		echo "</pre>";*/

		echo json_encode($taJson);
			
    }

	/** 
	* function Ajax chargement détail ecriture / Mandat
	*
	* @return Ajax
	*/
	public function getDetail(){
		
		global $oSmarty ; 

		$iEcriNum	= $this->postGetValue ("iEcriNum", 0);
		$iNumMandat	= $this->postGetValue ("iNumMandat", 0);
		$iMode		= $this->postGetValue ("iModePaiement", 0);

		$oGetDetail = $this->demande->GetDetail($iEcriNum, $iNumMandat, $iMode) ; 
		
		$oGetLECecriture = array(); //$this->demande->GetLEGecriture($iEcriNum) ; 
		$oTransfert = array();
		$oVirement = array();

		//echo $oGetDetail->MAND_NUM_INFO;

		if(isset($oGetDetail)){
			
			switch ($oGetDetail->MAND_MODE_PAIE){
				case 'OO':
					// Transfert
					$oTransfert = $this->demande->GetTransfert($oGetDetail->MAND_NUM_INFO);
					break;
					
				default :
					// Virement
					$oVirement = $this->demande->GetVirement($oGetDetail->MAND_NUM_INFO);
					break;
			}
		}

		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("iTransfert",$iTransfert);
		$oSmarty->assign("iEcriNum",$iEcriNum);
		$oSmarty->assign("oVirement",$oVirement);
		$oSmarty->assign("oTransfert",$oTransfert);
		$oSmarty->assign("iModePaiement",$iMode);
		$oSmarty->assign("oGetDetail",$oGetDetail);
		$oSmarty->assign("oGetLECecriture",$oGetLECecriture);

		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/getDetail.tpl" );
		
		echo $zDetailEcriture ;  
			
    }

	/** 
	* function Ajax chargement détail ecriture / Mandat
	*
	* @return Ajax
	*/
	public function getPrivilege(){
		
		global $oSmarty ; 



		$oSmarty->assign("zBasePath",base_url());


		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/getPrivilege.tpl" );
		
		echo $zDetailEcriture ;  
			
    }

	/** 
	* function modification ordre affichage
	*
	* @return fiche html
	*/
	public function getOrdreAffichage() {
		global $oSmarty ; 

		$iMode = $this->postGetValue ("iMode", 0);
		$iOrdre = $this->postGetValue ("iOrdre", 0);
		$iId = $this->postGetValue ("iId", 0); 
		
		$this->demande->flux_ordre($iMode,$iOrdre,$iId);

		$oSmarty->assign("zBasePath",base_url());

		$zPortionTable = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "demande/liste.portion.tpl" );
		
		echo $zPortionTable ;  
	}
	
	/** 
	* function edition d'un demande
	*
	* @return fiche html
	*/
	public function edit($iId = FALSE){
		
		global $oSmarty ; 

		$oData['zBasePath'] = base_url();

		$iMenuActifId = 3;
		$iSousMenuActifId = 6;
		$oData['oForm'] = array();

		$zLibelle  = "d'une demande " . strtoupper($_zHashUrl);
		$zLibelle1 = "demande " . strtoupper($_zHashUrl);
		
		$oDemande	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		if ($iId){
			
			$oDemande = $this->demande->getEdit($iId);
			$oData['oDemande'] = $oDemande;
		}


		$zContentDemande = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneDemande.tpl" );
		$zContentDeveloppement = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneDeveloppeur.tpl" );
		$zContentObservation = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneObservateur.tpl" );
		$zContentFaq = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneFaq.tpl" );
		
		
		$oData['zContentDemande'] = $zContentDemande;
		$oData['zContentDeveloppement'] = $zContentDeveloppement;
		$oData['zContentObservation'] = $zContentObservation;
		$oData['zContentFaq'] = $zContentFaq;

		$zTplpath = "demande/modif.tpl" ; 
		$oData['oDemande'] = $oDemande;
		$oData['oSession'] = $_SESSION;
		$oData['iMenuActifId'] = $iMenuActifId;
		$oData['iSousMenuActifId'] = $iSousMenuActifId;
		$oData['zLibelle'] = $zLibelle;
		$oData['zLibelle1'] = $zLibelle1;
		$oData['iId'] = $iId;
		$oData['zHashUrl'] = $_zHashUrl;
		
		$this->load_my_view_Common($zTplpath,$oData);
	}

	/** 
	* function edition d'un demande
	*
	* @return fiche html
	*/
	public function edit1903($iId = FALSE){
		
		$oData['zBasePath'] = base_url();

		$iMenuActifId = -103;
		$iAccueil = 8;
		$oData['oForm'] = array();

		$zLibelle  = "d'un demande " . strtoupper($_zHashUrl);
		$zLibelle1 = "demande " . strtoupper($_zHashUrl);
		
		$oDemande	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		$zContentCourt = $this->setFckEditor('descriptionCourt', '',100);
		$zContentLong = $this->setFckEditor('descriptionLong', '',100);
		if ($iId){
			
			$oDemande = $this->demande->getEdit($iId);
			$zContentCourt = $this->setFckEditor('descriptionCourt', $oDemande['descriptionCourt'],200);
			$zContentLong = $this->setFckEditor('descriptionLong', $oDemande['descriptionLong'],200);
			$oData['oDemande'] = $oDemande;
		}

		$zTplpath = "demande/modif.tpl" ; 
		$oData['iAccueil'] = $iAccueil;
		$oData['oDemande'] = $oDemande;
		$oData['zContentCourt'] = $zContentCourt;
		$oData['zContentLong'] = $zContentLong;
		$oData['iMenuActifId'] = $iMenuActifId;
		$oData['zLibelle'] = $zLibelle;
		$oData['zLibelle1'] = $zLibelle1;
		$oData['iId'] = $iId;
		$oData['zHashUrl'] = $_zHashUrl;
		
		$this->load_my_view_Common($zTplpath,$oData);
	}


	/** 
	* FCK Editor
	* retourner le wysiwig
	*
	* @return view
	*/
	public function setFckEditor($_zName, $_zValue, $_iHeight){
		
		require_once (APPLICATION_PATH.'assets/fckeditor/fckeditor.php');

		$oFCKeditor = new FCKeditor ($_zName) ;
		$oFCKeditor->BasePath = base_url().'assets/fckeditor/' ;
		$oFCKeditor->ToolbarSet	= 'Basic' ;
		$oFCKeditor->Width	= '50%' ;
		$oFCKeditor->Height	= $_iHeight ;
		$oFCKeditor->Value = $_zValue ;
		$zHtml =  $oFCKeditor->CreateHtml () ;

		return $zHtml;
    	
    }

	/** 
	* Enregistrement demandes 
	*
	* @return redirection liste
	*/
	public function save()
	{
		$oData = array();
		
		$iId = $this->postGetValue ("iId",''); 
		$oData = array();

		

		
		$oData["nom"]				= $this->postGetValue ("nom", '');
		$oData["prenom"]			= $this->postGetValue ("prenom", '');
		$oData["fullname"]			= $this->postGetValue ("prenom", '');
		$oData["status"]			= 1;

		$iChangeImage = 0;
		if (isset($_FILES['image']) && trim($_FILES['image']['name']) != "") {
			

			$oFile = $_FILES['image'];

			$zFileName = utf8_decode($_FILES["image"]["name"]);
			$zFileName = str_replace(" ","_",$zFileName);
			$zFileName = strtr($zFileName, 
			'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ', 
			'AAAAAACEEEEIIIIOOOOOUUUUYaaaaaaceeeeiiiioooooouuuuyy');

			$zPath = PATH_ROOT_DIR;

			move_uploaded_file($_FILES["image"]["tmp_name"],$zPath . '/assets/common/dist/img/' . $zFileName);

			$this->resizePicture($zPath . '/assets/common/dist/img/' . $zFileName, $zFileName , "300", "153",$zPath . "/assets/common/dist/img/");
			$oData["image"]		= $zFileName ; 
			$iChangeImage = 1;

		}

		$oData["email"]				= $this->postGetValue ("email", '');
		$oData["isChef"]			= $this->postGetValue ("isChef", 0);
		$oData["isDeveloppeur"]		= $this->postGetValue ("isDeveloppeur", 0);
		$oData["privilege"]			= $this->postGetValue ("privilege", 'Admin');
		
		if ($iId == '') {
			
			$zLogin					= $this->postGetValue ("login", '');

			if($zLogin != ""){
				$oData["username"]	= $zLogin;
			}

			$zPassword				= $this->postGetValue ("password", '');
			$oData["password"]		= sha1(md5($zPassword));

			$iDemandeId = $this->demande->insert($oData);
		} else {

				
			
			$oSession = $_SESSION;
			$oDemande = $this->demande->getEdit($iId);

			

			if ($oSession['id'] == $oDemande['id']){

				$zLogin						= $this->postGetValue ("login", '');

				if($zLogin != ""){
					$oData["username"]			= $zLogin;
				}
				
				$isChangePass				= $this->postGetValue ("isChangePass", 0);
				if($isChangePass == 1){
					$zPassword				= $this->postGetValue ("password", '');
					if($zPassword != ""){
						$oData["password"]	= sha1(md5($zPassword));
					}
				}

				$_SESSION["fullname"] = $oData["prenom"];

				if($iChangeImage == 1){
					$_SESSION["image"] = $oData["image"];
				}

			}
			
			$this->demande->update($oData, $iId);
		}

		redirect("demande/liste");
	}


	/** 
	* Suppression demande
	*
	* @param string $_zHashModule type d'demandes
	*
	* @return redirection liste
	*/
 	public function supprimer(){
		
		global $oSmarty;

		$oData = array();

		$iElementId		= $_POST['supprId'] ;
		$this->demande->deleteDemande($iElementId);
		
		echo "1";
	}


	

}