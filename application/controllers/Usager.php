<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package SOI
* @subpackage Usager de la page accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Usager extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  SOI  
	* @subpackage entité */ 
	function __construct()
	{
		parent:: __construct();
		$this->load->model('Usager_model', 'usager');

		if(empty($this->session->userdata['id'])){ redirect('Login');}

	}
	
	/** 
	* function permettant d'afficher la liste des usagers 
	*
	*
	* @return liste
	*/
	public function liste ()
	{
		global $oSmarty ; 
		
		$oData=array();
		$iMenuActifId = 2;
		$iSousMenuActifId = 3;
		$toGetAllData = array();
	
		$zLibelle = "Liste des usagers de la SOI";
		$zLibelle1 = "Usager"; 
						
		$zPathTpl = ADMIN_TEMPLATE_PATH . "usager/liste.portion.tpl";
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
		$this->load_my_view_Common("usager/liste.tpl",$oData);
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
		$iNombreTotal = 0;
		$toGetListe = $this->usager->getUsager($iNombreTotal,$this) ; 

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = $oGetListe['usager_nom'];
			$oDataTemp[] = $oGetListe['usager_prenom'];
			$oDataTemp[] = $oGetListe['usager_orgrattachement'];
			$oDataTemp[] = $oGetListe['usager_email'];
			$oDataTemp[] = $oGetListe['usager_telephone'];

			$zAction = '<a title="Modifier le usager" alt="Modifier" href="'.base_url().'usager/edit/'.$oGetListe['usager_id'].'" title="Modifier" style="cursor:pointer;" class="action dialog-link"><i style="font-size:22px;color:#12105A" class="fa fa-edit"></i></a>&nbsp;&nbsp;';

			/*if ($oSession['privilege'] == 'superadmin'){*/
				$zAction .= '<a href="#" title="Supprimer" alt="Supprimer" class="supprFormation" dataSuppr="'.$oGetListe['usager_id'].'" class="action suppr"><i style="font-size:22px;color: #F10610;" class="fa fa-times-rectangle"></i></a>' ; 
			/*}*/
			
			$oDataTemp[] = $zAction;
			
			
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
	* function modification ordre affichage
	*
	* @return fiche html
	*/
	public function getOrdreAffichage() {
		global $oSmarty ; 

		$iMode = $this->postGetValue ("iMode", 0);
		$iOrdre = $this->postGetValue ("iOrdre", 0);
		$iId = $this->postGetValue ("iId", 0); 
		
		$this->usager->flux_ordre($iMode,$iOrdre,$iId);

		$oSmarty->assign("zBasePath",base_url());

		$zPortionTable = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "usager/liste.portion.tpl" );
		
		echo $zPortionTable ;  
	}
	
	/** 
	* function edition d'un usager
	*
	* @return fiche html
	*/
	public function edit($iId = FALSE){
		
		$oData['zBasePath'] = base_url();

		$iMenuActifId = 2;
		$iSousMenuActifId = 4;
		$oData['oForm'] = array();

		$zLibelle  = "d'un usager " . strtoupper($_zHashUrl);
		$zLibelle1 = "usager " . strtoupper($_zHashUrl);
		
		$oUsager	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		if ($iId){
			
			$oUsager = $this->usager->getEdit($iId);
			$oData['oUsager'] = $oUsager;
		}

		$zTplpath = "usager/modif.tpl" ; 
		$oData['oUsager'] = $oUsager;
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
	* function edition d'un usager
	*
	* @return fiche html
	*/
	public function edit1903($iId = FALSE){
		
		$oData['zBasePath'] = base_url();

		$iMenuActifId = -103;
		$iAccueil = 8;
		$oData['oForm'] = array();

		$zLibelle  = "d'un usager " . strtoupper($_zHashUrl);
		$zLibelle1 = "usager " . strtoupper($_zHashUrl);
		
		$oUsager	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		$zContentCourt = $this->setFckEditor('descriptionCourt', '',100);
		$zContentLong = $this->setFckEditor('descriptionLong', '',100);
		if ($iId){
			
			$oUsager = $this->usager->getEdit($iId);
			$zContentCourt = $this->setFckEditor('descriptionCourt', $oUsager['descriptionCourt'],200);
			$zContentLong = $this->setFckEditor('descriptionLong', $oUsager['descriptionLong'],200);
			$oData['oUsager'] = $oUsager;
		}

		$zTplpath = "usager/modif.tpl" ; 
		$oData['iAccueil'] = $iAccueil;
		$oData['oUsager'] = $oUsager;
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
	* Enregistrement usagers 
	*
	* @return redirection liste
	*/
	public function save()
	{
		$oData = array();
		
		$iId = $this->postGetValue ("iId",''); 
		$oData = array();
		
		$oData["usager_nom"]				= $this->postGetValue ("usager_nom", '');
		$oData["usager_prenom"]				= $this->postGetValue ("usager_prenom", '');
		$oData["usager_orgrattachement"]	= $this->postGetValue ("usager_orgrattachement", '');
		$oData["usager_email"]				= $this->postGetValue ("usager_email", '');
		$oData["usager_telephone"]			= $this->postGetValue ("usager_telephone", 0);

		
		if ($iId == '') {
			$iUsagerId = $this->usager->insert($oData);
		} else {
			$this->usager->update($oData, $iId);
		}

		redirect("usager/liste");
	}


	/** 
	* Suppression usager
	*
	* @param string $_zHashModule type d'usagers
	*
	* @return redirection liste
	*/
 	public function supprimer(){
		
		global $oSmarty;

		$oData = array();

		$iElementId		= $_POST['supprId'] ;
		$this->usager->deleteUsager($iElementId);
		
		echo "1";
	}


	

}