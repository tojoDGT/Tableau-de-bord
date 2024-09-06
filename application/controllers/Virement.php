<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage Virement 
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Virement extends MY_Controller 
{

	/**  
	* Classe qui concerne les virements
	* @package  DGT  
	* @subpackage entité */ 
	function __construct()
	{ 
		parent:: __construct();
		$this->load->model('Virement_model', 'virement');

		if(empty($this->session->userdata['USERID'])){ redirect('Login');}

	}
	 
	/** 
	* function permettant d'afficher la liste des virements 
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
	
		$zLibelle = "Liste des virements de la DGT";
		$zLibelle1 = "Virement"; 
						
		$zPathTpl = ADMIN_TEMPLATE_PATH . "virement/liste.portion.tpl";
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
		$this->load_my_view_Common("virement/liste.tpl",$oData);
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

		$toColonne = $this->virement->getSessionColonne();

		//print_r ($toColonne);

		$iNombreTotal = 0;

		$toGetListe = $this->virement->GetVirementListe($iNombreTotal,$this) ; 

		//print_r ($toGetListe);

		$oDataAssign = array();
		$iIncrement = 1;
		/*echo "<pre>";
		print_r ($toGetListe);
		echo "</pre>";*/

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = '';
			$oDataTemp[] = $oGetListe['PCASSIGNATAIRE'];
			$oDataTemp[] = $oGetListe['PCPAYEUR'];
			$oDataTemp[] = $oGetListe['ENTITECODE'];

			$oDataTemp[] = $oGetListe['EXERCICE'];
			$oDataTemp[] = $oGetListe['DEPENSEOBJET'];
			$oDataTemp[] = $oGetListe['TITULAIRE'];

			$oDataTemp[] = $oGetListe['CATEG_DEPENSE'];
			$oDataTemp[] = $oGetListe['MONTANT'];
			
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
	* @return template HTML
	*/
	public function getDetail(){
		
		global $oSmarty ; 

		$iEcriNum	= $this->postGetValue ("iEcriNum", 0);
		$iAnneeExercice	= $this->postGetValue ("iExo", 2023);
		$iNumMandat	= $this->postGetValue ("iNumMandat", 0); 
		$iMode		= $this->postGetValue ("iModePaiement", 0);
		$iOffset	= $this->postGetValue ("iOffset", 600);

		$oGetDetail = $this->virement->GetDetail($iEcriNum, $iNumMandat, $iMode, $iAnneeExercice) ; 
		
		$oGetLECecriture = array(); //$this->virement->GetLEGecriture($iEcriNum) ; 
		$oTransfert = array();
		$oVirement = array();

		//echo $oGetDetail->MAND_NUM_INFO;

		if(isset($oGetDetail)){
			
			switch ($oGetDetail->MAND_MODE_PAIE){
				case 'OO':
					// Transfert
					$oTransfert = $this->virement->GetTransfert($oGetDetail->MAND_NUM_INFO,$iAnneeExercice);
					break;
					
				default :
					// Virement
					$oVirement = $this->virement->GetVirement($oGetDetail->MAND_NUM_INFO,$iAnneeExercice);
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
		$oSmarty->assign("iOffset",$iOffset);
		$oSmarty->assign("oGetLECecriture",$oGetLECecriture);

		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/getDetail.tpl" );
		
		echo $zDetailEcriture ;  
			
    }

}