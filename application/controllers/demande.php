<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage Demande 
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Demande extends MY_Controller 
{

	/**  
	* Classe qui concerne les demandes
	* @package  DGT  
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
	
		$zLibelle = "Liste des demandes de la DGT";
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

		$toGetListe = $this->demande->getDemande($iNombreTotal,$this); 

		$iTransfert = 0 ; 
		if( !empty($oRequest['mand_mode_paie']) &&  $oRequest['mand_mode_paie']=="OO") {   
			$iTransfert = 1 ; 
		}
		//die();
		//print_r ($toGetListe);
		//die();

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = '';

			foreach ($toColonne as $oColonne){
				
				$oColonne = explode("-", $oColonne);
				$oColonne = explode(".", $oColonne[1]);

					switch ($oColonne[1]){

							case 'STATUT':

								switch ($oGetListe['STATUT']){
								case 'REJET':
									$zSens = "#dc3545";
									
									break;

								case 'ADMIS EN DEPENSE':
									$zSens = "#28a745";
									
									break;

								default:
									$zSens = "#007bff";
									break;
							}
							
							$oDataTemp[] = "<span style=\"color:".$zSens."\">" . $oGetListe['STATUT'] . "</span>";
							break;

							case 'ECRI_REF':
								if ($iTransfert == 1){

									$zAffiche  = ($oGetListe['ECRI_REF']!="")?"<strong>-REF Ecriture :</strong> " . $oGetListe['ECRI_REF'] . "<br>":""; 
									$zAffiche .= ($oGetListe['BT_ENV_TRANSF_DATE']!="")?"<strong>-BT date :</strong> " . $oGetListe['BT_ENV_TRANSF_DATE'] . "<br>":""; 
									$zAffiche .= ($oGetListe['BT_ENV_EDIT_DATE']!="")?"<strong>-BT edit date :</strong> " . $oGetListe['BT_ENV_EDIT_DATE'] . "<br>":"";  
									$zAffiche .= ($oGetListe['BT_REC_DATE']!="")?"<strong>-BT rec date :</strong> " . $oGetListe['BT_REC_DATE'] . "<br>":""; 
									$zAffiche .= ($oGetListe['BT_REC_VALID_DATE']!="")?"<strong>BT date valide :</strong> " . $oGetListe['BT_REC_VALID_DATE'] . "<br>":"";   

									$oDataTemp[] = $zAffiche;
								} else {
									$oDataTemp[] = $oGetListe[$oColonne[1]];
								}

								break;

							default:
								$oDataTemp[] = $oGetListe[$oColonne[1]];
								break;
					}

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
	* @return template HTML
	*/
	public function getDetail(){
		
		global $oSmarty ; 

		$iEcriNum	= $this->postGetValue ("iEcriNum", 0);
		$iAnneeExercice	= $this->postGetValue ("iExo", 2024);
		$iNumMandat	= $this->postGetValue ("iNumMandat", 0); 
		$iMode		= $this->postGetValue ("iModePaiement", 0);
		$iOffset	= $this->postGetValue ("iOffset", 600);

		$oGetDetail = $this->demande->GetDetail($iEcriNum, $iNumMandat, $iMode, $iAnneeExercice) ; 
		
		$oGetLECecriture = array(); //$this->demande->GetLEGecriture($iEcriNum) ; 
		$oTransfert = array();
		$oVirement = array();

		//echo $oGetDetail->MAND_NUM_INFO;

		if(isset($oGetDetail)){
			
			switch ($oGetDetail->MAND_MODE_PAIE){
				case 'OO':
					// Transfert
					$oTransfert = $this->demande->GetTransfert($oGetDetail->MAND_NUM_INFO,$iAnneeExercice);
					break;
					
				default :
					// Virement
					$oVirement = $this->demande->GetVirement($oGetDetail->MAND_NUM_INFO,$iAnneeExercice);
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