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

		switch ($iTypeAfficheSearch){

				case 1:

					$toColonne = $this->virement->getSessionColonne(1);

					$iNombreTotal = 0;

					$toGetListe = $this->virement->GetVirementListe($iNombreTotal,$this) ; 

					$oDataAssign = array();
					$iIncrement = 1;


					$oDataAssign = array();
					$iIncrement = 1;
					
					foreach ($toGetListe as $oGetListe){
						
						$oDataTemp=array(); 
						$oDataTemp[] = '';

						foreach ($toColonne as $oColonne){
							$oColonne = explode("-", $oColonne);
							$oColonne = explode(".", $oColonne[1]);
							$oDataTemp[] = $oGetListe[$oColonne[1]];
						}
						
						$oDataAssign[] = $oDataTemp;
						$iIncrement++;
					}

				break;

				case 2:

					$toColonne = $this->virement->getSessionColonne(2);

					$iNombreTotal = 0;

					$toGetListe = $this->virement->GetVirementListe_op46($iNombreTotal,$this) ; 

					/*echo "<pre>";
					print_r ($toGetListe);
					echo "</pre>";*/

					$oDataAssign = array();
					$iIncrement = 1;
	
					foreach ($toGetListe as $oGetListe){
						
						$oDataTemp=array(); 

						$oDataTemp[] = '';

						foreach ($toColonne as $oColonne){
							$oColonne = explode("-", $oColonne);
							$oColonne = explode(".", $oColonne[1]);

							if($oColonne[1]=="CATEG_DEPENSE"){
								$oDataTemp[] = is_null($oGetListe['CATEG_DEPENSE'])?'<span style="color:red">En cours de virement</span>':$oGetListe['CATEG_DEPENSE'];
							} else {
								$oDataTemp[] = $oGetListe[$oColonne[1]];
							}
						}
						$oDataAssign[] = $oDataTemp;
						$iIncrement++;
					}

				break;
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

		$iTitreId			= $this->postGetValue ("iTitreId", 0);
		$iNumMandat			= $this->postGetValue ("iNumMandat", 0);
		$iAnneeExercice		= $this->postGetValue ("iExo", 2024);
		$iTypeAfficheSearch	= $this->postGetValue ("iTypeAfficheSearch", 0);
		$iOffset			= $this->postGetValue ("iOffset", 600);
		
		$oGetLECecriture = array(); //$this->virement->GetLEGecriture($iEcriNum) ; 
		$oTransfert = array();
		$oVirement = array();

		$zPath = ($iTypeAfficheSearch==1)?"compteVirement":"OP_46";

		$oGetDetail = $this->virement->GetDetail($iTypeAfficheSearch,$iTitreId,$iNumMandat, $iAnneeExercice) ; 

		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("iTitreId",$iTitreId);
		$oSmarty->assign("iNumMandat",$iNumMandat);
		$oSmarty->assign("oVirement",$oVirement);
		$oSmarty->assign("oTransfert",$oTransfert);
		$oSmarty->assign("oGetDetail",$oGetDetail);
		$oSmarty->assign("iOffset",$iOffset);


		$zDetailEcriture = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/".$zPath."/getDetail.tpl" );
		
		echo $zDetailEcriture ;  
			
    }

}