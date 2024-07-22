<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package SOI
* @subpackage Utilisateur de la page accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Utilisateur extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  SOI  
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
	* function Ajax chargement de la liste à partir de la base
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
	* function Ajax chargement détail ecriture / Mandat
	*
	* @return Ajax
	*/
	public function getUserPerformance(){
		
		global $oSmarty ; 


		$iUserId = $this->postGetValue ("iUserId", 0);

		$oGetInfo = $this->utilisateur->getInfoPostComptableUser($iUserId) ;
		$zAfficheValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2023',1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2023',1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMoisUser($iUserId,'2023',2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMoisUser($iUserId,'2023',2) ;

		//print_r ($oGetInfo);
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$oSmarty->assign("zAfficheValide", $zAfficheValide);
		$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
		$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
		$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/getUserPerformance.tpl" );
		
		
		echo $zTplAffiche ;  
			
    }

	/** 
	* function Ajax chargement détail ecriture / Mandat
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
	* function Ajax chargement détail ecriture / Mandat
	*
	* @return Ajax
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
		
		$this->utilisateur->flux_ordre($iMode,$iOrdre,$iId);

		$oSmarty->assign("zBasePath",base_url());

		$zPortionTable = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "utilisateur/liste.portion.tpl" );
		
		echo $zPortionTable ;  
	}
	
	/** 
	* function edition d'un utilisateur
	*
	* @return fiche html
	*/
	public function edit($iId = FALSE){
		
		$oData['zBasePath'] = base_url();

		$iMenuActifId = 3;
		$iSousMenuActifId = 3;
		$oData['oForm'] = array();

		$zLibelle  = "d'un utilisateur " . strtoupper($_zHashUrl);
		$zLibelle1 = "utilisateur " . strtoupper($_zHashUrl);
		
		$oUtilisateur	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		if ($iId){
			
			$oUtilisateur = $this->utilisateur->getEdit($iId);
			$oData['oUtilisateur'] = $oUtilisateur;
		}

		$zTplpath = "utilisateur/modif.tpl" ; 
		$oData['oUtilisateur'] = $oUtilisateur;
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
	* function edition d'un utilisateur
	*
	* @return fiche html
	*/
	public function edit1903($iId = FALSE){
		
		$oData['zBasePath'] = base_url();

		$iMenuActifId = -103;
		$iAccueil = 8;
		$oData['oForm'] = array();

		$zLibelle  = "d'un utilisateur " . strtoupper($_zHashUrl);
		$zLibelle1 = "utilisateur " . strtoupper($_zHashUrl);
		
		$oUtilisateur	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		$zContentCourt = $this->setFckEditor('descriptionCourt', '',100);
		$zContentLong = $this->setFckEditor('descriptionLong', '',100);
		if ($iId){
			
			$oUtilisateur = $this->utilisateur->getEdit($iId);
			$zContentCourt = $this->setFckEditor('descriptionCourt', $oUtilisateur['descriptionCourt'],200);
			$zContentLong = $this->setFckEditor('descriptionLong', $oUtilisateur['descriptionLong'],200);
			$oData['oUtilisateur'] = $oUtilisateur;
		}

		$zTplpath = "utilisateur/modif.tpl" ; 
		$oData['iAccueil'] = $iAccueil;
		$oData['oUtilisateur'] = $oUtilisateur;
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
	* Enregistrement utilisateurs 
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

			$iUtilisateurId = $this->utilisateur->insert($oData);
		} else {

				
			
			$oSession = $_SESSION;
			$oUtilisateur = $this->utilisateur->getEdit($iId);

			

			if ($oSession['id'] == $oUtilisateur['id']){

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
			
			$this->utilisateur->update($oData, $iId);
		}

		redirect("utilisateur/liste");
	}


	/** 
	* Suppression utilisateur
	*
	* @param string $_zHashModule type d'utilisateurs
	*
	* @return redirection liste
	*/
 	public function supprimer(){
		
		global $oSmarty;

		$oData = array();

		$iElementId		= $_POST['supprId'] ;
		$this->utilisateur->deleteUtilisateur($iElementId);
		
		echo "1";
	}


	

}