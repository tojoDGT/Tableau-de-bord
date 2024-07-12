<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package SOI
* @subpackage Dashboard de la page accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Dashboard extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du FO
	* @package  SOI  
	* @subpackage entité */ 
	function __construct()
	{ 
		parent:: __construct();
		$this->load->model('Dashboard_model', 'dashboard');
		$this->load->model('Demande_model', 'demande');
		$this->load->model('Utilisateur_model', 'utilisateur');

		if(empty($this->session->userdata['USERID'])){ redirect('Login');}

	}

	/** 
	* function permettant de changer la colonne à afficher
	*
	*
	* @return liste
	*/
	public function changeCol ()
	{
		$toColonne = array();
		unset($_SESSION["colonneAffiche"]);
		$zReturnUrl = $this->postGetValue ("zReturnUrl", 0);
		if(empty($_SESSION["colonneAffiche"])){
			
			$toColonnePost = $this->postGetValue ("colonneAffiche", 0);

			foreach ($toColonnePost as $zColonnePost){
				array_push($toColonne, $zColonnePost);
			}

			$_SESSION["colonneAffiche"] = serialize($toColonne);
		} 

		$toUrl = explode("index.php/", $zReturnUrl);

		redirect($toUrl[1]);
	}

	 
	/** 
	* function permettant d'afficher la liste des demandes 
	*
	*
	* @return liste
	*/
	public function stat($_zParam="general")
	{
		global $oSmarty ; 
		
		$oData=array();
		$iMenuActifId = 1;
		$toGetAllData = array();
	
		$zLibelle = "TABLEAU DE BORD";

		//die("tojo");
		
		$toColonne = $this->demande->getSessionColonne();

		$toGetAllExercice = $this->dashboard->getAllDateExercice() ; 

		//print_r ($toColonne);
		
		switch ($_zParam){

			case 'general':

				$iAnneeExercice = $this->postGetValue ("iAnneeExercice", 2023);
				$iModeAffichage = $this->postGetValue ("iModeAffichage", 1);

				$zReturn = $this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"PROP_CODE");
				$zReturnTypeMand = $this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"TYPE_MAND");
				$zReturnMinAbrev = $this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"MIN_ABREV");
				$zReturnModePaiement = $this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"MAND_MODE_PAIE");
				$zReturnDonut = $this->dashboard->getNombreMontantParMoisEcriture($iAnneeExercice,$iModeAffichage,"PROP_CODE");
				$zReturnPie = $this->dashboard->getNombreMontantParMoisEcriture($iAnneeExercice,$iModeAffichage,"TYPE_MAND");


				//echo $zReturnMinAbrev;
				
				$iSousMenuActifId = 1;
				$zLibelle1 = ""; 
				$oSmarty->assign('iAnneeExercice', $iAnneeExercice);
				$oSmarty->assign('iModeAffichage', $iModeAffichage);
				$oSmarty->assign('zReturn', $zReturn);
				$oSmarty->assign('zReturnTypeMand', $zReturnTypeMand);
				$oSmarty->assign('zReturnMinAbrev', $zReturnMinAbrev);
				$oSmarty->assign('zReturnModePaiement', $zReturnModePaiement);
				$oSmarty->assign('zReturnDonut', $zReturnDonut);
				$oSmarty->assign('zReturnPie', $zReturnPie);
				$oSmarty->assign('toGetAllExercice',  $toGetAllExercice);
				$zPathTpl = ADMIN_TEMPLATE_PATH . "dashboard/zone/general.tpl";
				break;
			
			case 'situation-des-dossiers':
			case 'situation-des-op':

				$toGetPropCode = $this->dashboard->getPropCode() ; 
				$toMinAbrev = $this->dashboard->getMinAbrev() ; 
				$toTypeMandat = $this->dashboard->getTypeMandat() ; 
				
				$zAnnee = "-1";
				$zAfficheSerieStat = "";

				$oSmarty->assign('toGetPropCode',  $toGetPropCode);
				$oSmarty->assign('toMinAbrev',  $toMinAbrev);
				$oSmarty->assign('toTypeMandat',  $toTypeMandat);
				$oSmarty->assign('toGetAllExercice',  $toGetAllExercice);
				$oSmarty->assign('zBasePath',  base_url());

				switch ($_zParam){
					case 'situation-des-dossiers':
						$iMenuActifId = 2;
						$iSousMenuActifId = 2;
						$zLibelle1 = "Situation des dossiers"; 
						$oSmarty->assign('iTypeAfficheSearch',  1);
						$zSearchTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/search.tpl" );
						break;

					case 'situation-des-op':
						$iMenuActifId = 2;
						$iSousMenuActifId = 3;
						$zLibelle1 = "Situations des OP et régularisations"; 
						$oSmarty->assign('iTypeAfficheSearch',  2);
						$zSearchTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/search.tpl" );
						break;
				}

				
				$oSmarty->assign('zAfficheSerieStat',  $zAfficheSerieStat);
				$oSmarty->assign('toColonne',  $toColonne);
				$zFirstTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/graph.tpl" );
				$zListingTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/listing.tpl" );
				$zStatGLobal = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/stat.tpl" );
				
				$oSmarty->assign('zSearchTpl',  $zSearchTpl);
				$oSmarty->assign('zFirstTpl',  $zFirstTpl);
				$oSmarty->assign('zListingTpl',  $zListingTpl);
				$oSmarty->assign('zStatGLobal',  $zStatGLobal);

				$zPathTpl = ADMIN_TEMPLATE_PATH . "dashboard/zone/situation-des-dossiers.tpl";

				
				break;


			case 'performance-des-pc':
				$iMenuActifId = 2;
				$iSousMenuActifId = 4;

				$zLibelle1 = "Les postes comptables"; 
				$zListingTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/listing.tpl" );

				$oSmarty->assign('zListingTpl',  $zListingTpl);
				$zPathTpl = ADMIN_TEMPLATE_PATH . "dashboard/zone/performance-des-pc.tpl";
				break;
		}
		
		
		$oData['zBasePath']			= base_url();
		$oData['zLibelle']			= $zLibelle;
		$oData['zLibelle1']			= $zLibelle1;
		
		$oData['iMenuActifId']		= $iMenuActifId;
		$oData['iSousMenuActifId']  = $iSousMenuActifId;

		$oSmarty->assign('oSession',  $_SESSION);
		$oSmarty->assign("zBasePath",base_url());
		$oSmarty->assign("toGetPropCode",$toGetPropCode);
		$zPortionTable = $oSmarty->fetch( $zPathTpl );
		$oData['zPortionTable'] = $zPortionTable;

		//die("tojo111");
		$this->load_my_view_Common("dashboard/liste.tpl",$oData);
	}

	/** 
	* function graphe Ajax chargement de la graphe
	*
	* @return Ajax
	*/
	public function getGraphAjax(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zAfficheSerieStat = "";

		$toGetPropCode = $this->dashboard->getPropCode() ; 

		$toGetAllExercice = $this->dashboard->getAllDateExercice() ;
		
		$iPointStart = date("Y");
		
		if(sizeof($toGetAllExercice)>0){
			$iPointStart = $toGetAllExercice[0]['ECRI_EXERCICE'];
		}

		$toTableauResult = $this->dashboard->getGraph();

		$zAfficheSerieStat = "";
		$zCategorieAffiche = "";
		$zNombreAffiche = "";

		$iModeGraph = $oRequest["iModeGraph"];

		switch ($iModeGraph){

			case '1':


					foreach($toGetPropCode as $oGetPropCode){
									
							$zAfficheSerieStat .= "{";
							$zAfficheSerieStat .= "name: '".$oGetPropCode['PROP_CODE']."',";
							
							$tiNombre = array();

							foreach($toGetAllExercice as $oGetAllExercice){
									$iNombre = 0; 
									
									foreach($toTableauResult as $oTableauResult){
										if($oTableauResult["ECRI_EXERCICE"] == $oGetAllExercice["ECRI_EXERCICE"] && $oTableauResult["PROP_CODE"] == $oGetPropCode["PROP_CODE"]) {
											
											
											if( !empty($oRequest['iMode']) &&  $oRequest['iMode']==2) {   
												$iTotal = str_replace(",",".", $oTableauResult["TOTAL"]);
												$iNombre = $iTotal;
											} else {
												$iNombre = $oTableauResult["NB"];
											}
										}
									}
									
									array_push ($tiNombre, $iNombre);
							}
							
							$zAfficheSerieStat .= "data: [".implode(",", $tiNombre)."],";
							$zAfficheSerieStat .= "stack: 'male'";
							$zAfficheSerieStat .= "},";
					}

					

				break;

			case '2':

				foreach($toGetPropCode as $oGetPropCode){
					$zAfficheSerieStat .= "[";
					$zAfficheSerieStat .= "'".$oGetPropCode['PROP_CODE']."',";

					$iNombre = 0; 
					foreach($toGetAllExercice as $oGetAllExercice){
							
							
							foreach($toTableauResult as $oTableauResult){
								if($oTableauResult["ECRI_EXERCICE"] == $oGetAllExercice["ECRI_EXERCICE"] && $oTableauResult["PROP_CODE"] == $oGetPropCode["PROP_CODE"]) {
									
									
									if( !empty($oRequest['iMode']) &&  $oRequest['iMode']==2) {   
										$iTotal = str_replace(",",".", $oTableauResult["TOTAL"]);
										$iNombre += $iTotal;
									} else {
										$iNombre += $oTableauResult["NB"];
									}
								}
							}
					}
					
					$zAfficheSerieStat .= $iNombre;

					$zAfficheSerieStat .= "],";
				}
				break;

			case '3':

				$zCategorie = "";
				$zCategorieAffiche = "";
				$toCategorie = array();

				$iNombreAffiche = "";
				$zNombreAffiche = "";
				$toNombreAffiche = array();

				foreach($toGetPropCode as $oGetPropCode){

					$zCategorie = "'".$oGetPropCode['PROP_CODE']."'";
					array_push ($toCategorie, $zCategorie);

					
					foreach($toGetAllExercice as $oGetAllExercice){

							$iNombre = 0; 
							foreach($toTableauResult as $oTableauResult){
								if($oTableauResult["ECRI_EXERCICE"] == $oGetAllExercice["ECRI_EXERCICE"] && $oTableauResult["PROP_CODE"] == $oGetPropCode["PROP_CODE"]) {
									
									
									if( !empty($oRequest['iMode']) &&  $oRequest['iMode']==2) {   
										$iTotal = str_replace(",",".", $oTableauResult["TOTAL"]);
										$iNombre = $iTotal;
									} else {
										$iNombre = $oTableauResult["NB"];
									}
								}
							}

							array_push ($toNombreAffiche, $iNombre);
					}
					
				}

				$zCategorieAffiche = implode(",", $toCategorie);
				$zNombreAffiche = implode(",", $toNombreAffiche);

				break;

			case '4':
				break;

			case '5':
				break;



		}

		$oSmarty->assign('iPointStart',  $iPointStart);
		$oSmarty->assign('zCategorieAffiche',  $zCategorieAffiche);
		$oSmarty->assign('zNombreAffiche',  $zNombreAffiche);
		$oSmarty->assign('iModeGraph',  $oRequest['iModeGraph']);
		$oSmarty->assign('iMode',  $oRequest['iMode']);
		$oSmarty->assign('zAfficheSerieStat', $zAfficheSerieStat);
		$zTplGraphPortion = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/Graph/graph".$iModeGraph.".tpl" );

		$oSmarty->assign('zAfficheSerieStat',  $zAfficheSerieStat);
		$oSmarty->assign('zTplGraphPortion',  $zTplGraphPortion);
		$oSmarty->assign('iModeGraph',  $oRequest['iModeGraph']);
		$oSmarty->assign("zBasePath",base_url());
		$zHtmlGraph = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/graph.tpl" );


		echo $zHtmlGraph;
			
    } 


	/** 
	* function Ajax chargement de la liste à partir de la base
	*
	* @return Ajax
	*/
	public function getPostComptable(){
		
		$oUser = array();
		$oCandidat = array();

		$oSession = $_SESSION;

		$oRequest = $_REQUEST;
		$iNombreTotal = 0;
		$toGetListe = $this->utilisateur->posteComptable($iNombreTotal,$this) ;
		
		/*echo "<pre>";
		print_r ($toGetListe);
		echo "</pre>";*/

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 
			
			$oDataTemp[] = $oGetListe['PSTP_CODE'];
			$oDataTemp[] = $oGetListe['PSTP_LIBELLE'];

			$zAction = '<a title="Consultation" alt="Consultation" libelle="'.$oGetListe['PSTP_LIBELLE'].'" id="'.$oGetListe['PSTP_CODE'].'" onClick="getTabPc(this);" title="Consultation" style="cursor:pointer;" class="action dialog-link"><i style="font-size:22px;color:#12105A" class="fa fa-search"></i></a>&nbsp;&nbsp;';

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
	* function get statitistique global
	*
	* @return Ajax
	*/
	public function getStatGLobal(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zAfficheSerieStat = "";
		$oResult = $this->dashboard->getStatGLobal();

		/*print_r ($oResult);*/
		
		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign("oResult", $oResult);
		$zHtmlGraph = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/stat.tpl" );


		echo $zHtmlGraph;
			
    }

	/** 
	* function get statitistique global
	*
	* @return Ajax
	*/
	public function getTabsPcActive(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zType = $this->postGetValue ("iType", 'statistique');
		$zPsCode = $this->postGetValue ("zPsCode", '');

		$oSmarty->assign("zBasePath", base_url());
		switch ($zType){

			case 'statistique':

				$oGetInfo = $this->utilisateur->getInfoPostComptable($zPsCode) ;
				$oSmarty->assign("oGetInfo", $oGetInfo);
				$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/statistique.tpl" );
				break;

			case 'agents':
				$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/agents.tpl" );
				break;

			case 'valider':
			case 'refuser':
				$toColonne = $this->demande->getSessionColonne();
				$oSmarty->assign("zBasePath", base_url());
				$oSmarty->assign("zPsCode", $zPsCode);
				$oSmarty->assign("toColonne", $toColonne);
				$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/".$zType.".tpl" );
				break;

		}


		echo $zTplAffiche;
			
    }


	/** 
	* function Ajax chargement de la liste à partir de la base
	*
	* @return Ajax
	*/
	public function getDossierValideRefusAjax(){
		
		$oUser = array();
		$oCandidat = array();

		$oSession = $_SESSION;

		$oRequest = $_REQUEST;

		$iTypeAfficheSearch	= $this->postGetValue ("iTypeAfficheSearch", 1);
		$iVisaValid	= $this->postGetValue ("MAND_VISA_VALIDE", 1);


		$iNombreTotal = 0;

		$toGetListe = $this->demande->getDossier($iNombreTotal,$this) ; 

		/*print_r($toGetListe);
		die();*/

		$iIncrement = 1;
		$oDataAssign = array();
		
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = '';
			$oDataTemp[] = $oGetListe['ECRI_NUM'];
			$oDataTemp[] = $oGetListe['MAND_NUM_INFO'];
			$oDataTemp[] = ($iVisaValid==1)?$oGetListe['ECRI_LIB']:'<span class="text-danger float-end">'.$oGetListe['REJET_NOTE']."</span>";

			if ($iVisaValid==0){
				$oDataTemp[] = $oGetListe['MAND_DT_RJT'];
			}
			$oDataTemp[] = $oGetListe['MAND_OBJET'];
			$oDataTemp[] = $oGetListe['MAND_DATE_RECUP'];
			$oDataTemp[] = $oGetListe['MAND_MONTANT1'];
			
			
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
	* function get statitistique global
	*
	* @return Ajax
	*/
	public function getTabsPc(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zType = $this->postGetValue ("iType", 'statistique');
		$zPsCode = $this->postGetValue ("zPsCode", '');

		$oGetInfo = $this->utilisateur->getInfoPostComptable($zPsCode) ;

		//print_r ($oGetInfo);
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/statistique.tpl" );

		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign('zTplAffiche',  $zTplAffiche);
		$zHtmlGraph = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/parametre.tpl" );


		echo $zHtmlGraph;
			
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

		$toGetListe = $this->demande->getDashboard($iNombreTotal,$this) ; 

		$oDataAssign = array();
		$iIncrement = 1;
		foreach ($toGetListe as $oGetListe){
			
			$oDataTemp=array(); 

			$oDataTemp[] = $oGetListe['ECRI_NUM'];
			$oDataTemp[] = $oGetListe['PERI_CODE'];
			$oDataTemp[] = $oGetListe['ECRI_REF'];
			$oDataTemp[] = $oGetListe['ECRI_LIB'];
			$oDataTemp[] = $oGetListe['ECRI_DT_CECRITURE'];
			$oDataTemp[] = $oGetListe['ECRI_DT_SECRITURE'];
			$oDataTemp[] = $oGetListe['ECRI_LIB'];
			$oDataTemp[] = $oGetListe['ECRI_MT'];

			/*$zAction = '<a title="Modifier le demande" alt="Modifier" href="'.base_url().'demande/edit/'.$oGetListe['CODE'].'" title="Modifier" style="cursor:pointer;" class="action dialog-link"><i style="font-size:22px;color:#12105A" class="fa fa-edit"></i></a>&nbsp;&nbsp;';*/

			//echo $zAction;
			
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

		/*echo "<pre>";
		print_r ($taJson);
		echo "</pre>";*/

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
		
		$oDashboard	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		if ($iId){
			
			$oDashboard = $this->demande->getEdit($iId);
			$oData['oDashboard'] = $oDashboard;
		}


		$zContentDashboard = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneDashboard.tpl" );
		$zContentDeveloppement = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneDeveloppeur.tpl" );
		$zContentObservation = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneObservateur.tpl" );
		$zContentFaq = $oSmarty->fetch( ADMIN_TEMPLATE_PATH .  "demande/zone/zoneFaq.tpl" );
		
		
		$oData['zContentDashboard'] = $zContentDashboard;
		$oData['zContentDeveloppement'] = $zContentDeveloppement;
		$oData['zContentObservation'] = $zContentObservation;
		$oData['zContentFaq'] = $zContentFaq;

		$zTplpath = "demande/modif.tpl" ; 
		$oData['oDashboard'] = $oDashboard;
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
		
		$oDashboard	= array();
		$oData['oContact1'] = array();
		$oData['oContact2'] = array();
		
		$zContentCourt = $this->setFckEditor('descriptionCourt', '',100);
		$zContentLong = $this->setFckEditor('descriptionLong', '',100);
		if ($iId){
			
			$oDashboard = $this->demande->getEdit($iId);
			$zContentCourt = $this->setFckEditor('descriptionCourt', $oDashboard['descriptionCourt'],200);
			$zContentLong = $this->setFckEditor('descriptionLong', $oDashboard['descriptionLong'],200);
			$oData['oDashboard'] = $oDashboard;
		}

		$zTplpath = "demande/modif.tpl" ; 
		$oData['iAccueil'] = $iAccueil;
		$oData['oDashboard'] = $oDashboard;
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

			$iDashboardId = $this->demande->insert($oData);
		} else {

				
			
			$oSession = $_SESSION;
			$oDashboard = $this->demande->getEdit($iId);

			

			if ($oSession['id'] == $oDashboard['id']){

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
		$this->demande->deleteDashboard($iElementId);
		
		echo "1";
	}


	

}