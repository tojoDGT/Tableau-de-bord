<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package CNFI
* @subpackage Entité
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Rnf extends MY_Controller 
{

	/**  
	* Classe qui concerne le modèle demande
	* @package  DGT  
	* @subpackage RNF */ 
	function __construct(){
		parent::__construct();
		//unset($_SESSION["rnfSaveFormule"]);
		if(empty($_SESSION["rnfSaveFormule"])){

			$_SESSION["rnfSaveFormule"] = array();
		}
	}

	/** 
	* function permettant d'afficher le template entité / nature de recette
	*
	*/
	public function template ()
	{
		global $oSmarty ; 
		$oData = array();

		//unset($_SESSION["rnfSaveFormule"]);

		/*echo "<pre>";
		print_r ($_SESSION["rnfSaveFormule"]);
		echo "</pre>";*/

		$toSaveForm = $_SESSION["rnfSaveFormule"] ;


		$iMenuActifId = 663;
		$oData['iMenuActifId']		= $iMenuActifId;

		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("toSaveForm",$toSaveForm);
		$zRender = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "rnf/tpl-render.tpl" );

		$oSmarty->assign("zRender",$zRender);
		$oSmarty->assign("toSaveForm",$toSaveForm);
		$this->load_my_view_Common("rnf/template.tpl",$oData);
	}



	/** 
	* function permettant d'afficher le template entité / nature de recette
	*
	*/
	public function setHtml ()
	{
		global $oSmarty ; 
		$oData = array();

		$iType = $this->postGetValue ("iType", 0);

		$iMenuActifId = 663;
		$oData['iMenuActifId']		= $iMenuActifId;

		$oSmarty->assign("iType",$iType);
		$oSmarty->assign("zBasePath",base_url());
		$zTypeTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "rnf/tpl-".$iType.".tpl" );
		$oSmarty->assign("zTypeTpl",$zTypeTpl);
		$zReturnTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "rnf/tpl-form.tpl" );

		echo $zReturnTpl;
	}


	/** 
	* function permettant de sauvegarder dans une session les données dans le formulaire
	*
	*/
	public function save ()
	{
		global $oSmarty ; 
		$oData = array();

		$toSaveForm = $_SESSION["rnfSaveFormule"] ;

		$iType = $this->postGetValue ("iType",'');
		$zIntitule = $this->postGetValue ("intitule",'');
		$oCaption = $_REQUEST["caption"];
		$oChampNom = $_REQUEST["champNom"];
		$oMontant = $_REQUEST["montant"];

		$oSaveForm = array();
		$oSaveForm['iType'] = $iType ; 
		$oSaveForm['intitule'] = $zIntitule ; 
		$oSaveForm['caption'] = $oCaption ; 
		$oSaveForm['champNom'] = $oChampNom ; 
		$oSaveForm['montant'] = $oMontant ; 
		$oSaveForm['iKey'] = sizeof($toSaveForm)+1 ; 
		$iKey = sizeof($toSaveForm)+1 ; 


		/*$oSaveForm['zRender'] = $zRender ; */

		/*echo "<pre>";
		print_r ($toSaveForm);
		echo "</pre>";*/

		array_push($toSaveForm, $oSaveForm);

		$_SESSION["rnfSaveFormule"] = $toSaveForm ; 

		$oSmarty->assign("toSaveForm",$toSaveForm);
		$oSmarty->assign("zBasePath",base_url());
		$zRender = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "rnf/tpl-render.tpl" );


		/*echo "<pre>";
		print_r ($_SESSION["rnfSaveFormule"]);
		echo "</pre>";*/

		echo $zRender;


	}


	/** 
	* permet de retourner une template ligne
	*
	*
	* @return template
	*/
	public function getTemplate(){

		global $oSmarty ; 

		$iIndexNew = $this->postGetValue ("iIndexNew",''); 
		$iType = $this->postGetValue ("iType",'');
		$zHashUrl = $this->postGetValue ("zHashUrl",'');

		switch ($iType)
		{
			case '1':

				break;
			
			case '2':
				break;

			case '3':
				break;

		}
		
		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("iIndexNew",$iIndexNew);
		$oSmarty->assign("iType",$iType);
		$zSelect = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "rnf/template.portion.tpl" );
		
		echo $zSelect ; 
	}
}