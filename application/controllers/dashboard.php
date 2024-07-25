<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage Dashboard de la page accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Dashboard extends MY_Controller 
{

	/**  
	* Classe qui concerne la page d'accueil du tableau de bord FO
	* @package  DGT  
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
	* @return redirection vers la page qui necessite le changement de colonne
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
	* function permettant d'afficher la statistique de la page demandée
	*
	* @param string $_zParam type de page à afficher
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

				//$zReturnMinAbrev = $zReturnTypeMand; //$this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"MIN_ABREV");
				//$zReturnModePaiement = $zReturnTypeMand;//$this->dashboard->getNombreMontantParMois($iAnneeExercice,$iModeAffichage,"MAND_MODE_PAIE");
				//$zReturnDonut = $this->dashboard->getNombreMontantParMoisEcriture($iAnneeExercice,$iModeAffichage,"PROP_CODE");
				//$zReturnPie = $zReturnDonut;//$this->dashboard->getNombreMontantParMoisEcriture($iAnneeExercice,$iModeAffichage,"TYPE_MAND");


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

			case 'performance-des-agents':
				$iMenuActifId = 2;
				$iSousMenuActifId = 5;

				$zLibelle1 = "Les agents dans le poste comptable"; 
				$oSmarty->assign("zBasePath",base_url());
				$zListingTpl = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/listingAgents.tpl" );

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
	* function permettant de retourner la liste des postes comptables
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
	* function permettant d'afficher la statitistique globale
	*
	* @return template HTML
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
	* @return template HTML
	*/
	public function getTabsPcActive(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zType = $this->postGetValue ("iType", 'statistique');
		$zPsCode = $this->postGetValue ("zPsCode", '');

		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign("zPsCode", $zPsCode);
		switch ($zType){

			case 'statistique':

				$oGetInfo = $this->utilisateur->getInfoPostComptable($zPsCode) ;
				$zAfficheValide = $this->dashboard->getValidePcParMois($zPsCode,'2023',1) ;
				$zAfficheRefus = $this->dashboard->getRefusePcParMois($zPsCode,'2023',1) ;

				$zAfficheRadarValide = $this->dashboard->getValidePcParMois($zPsCode,'2023',2) ;
				$zAfficheRadarRefus = $this->dashboard->getRefusePcParMois($zPsCode,'2023',2) ;

				$oSmarty->assign("oGetInfo", $oGetInfo);
				$oSmarty->assign("zAfficheValide", $zAfficheValide);
				$oSmarty->assign("zAfficheValide", $zAfficheValide);
				$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
				$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
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
	* function Ajax chargement de la liste validé / refusé à partir de la base
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
	* function permettant d'afficher l'onglet relatif à un poste comptable
	*
	* @return template HTML
	*/
	public function getTabsPc(){

		global $oSmarty ; 

		$oRequest = $_REQUEST;

		$zType = $this->postGetValue ("iType", 'statistique');
		$zPsCode = $this->postGetValue ("zPsCode", '');

		$oGetInfo = $this->utilisateur->getInfoPostComptable($zPsCode) ;
		$zAfficheValide = $this->dashboard->getValidePcParMois($zPsCode,'2023',1) ;
		$zAfficheRefus = $this->dashboard->getRefusePcParMois($zPsCode,'2023',1) ;

		$zAfficheRadarValide = $this->dashboard->getValidePcParMois($zPsCode,'2023',2) ;
		$zAfficheRadarRefus = $this->dashboard->getRefusePcParMois($zPsCode,'2023',2) ;

		//print_r ($oGetInfo);
		
		$oSmarty->assign("oGetInfo", $oGetInfo);
		$oSmarty->assign("zAfficheValide", $zAfficheValide);
		$oSmarty->assign("zAfficheRefus", $zAfficheRefus);
		$oSmarty->assign("zAfficheRadarValide", $zAfficheRadarValide);
		$oSmarty->assign("zAfficheRadarRefus", $zAfficheRadarRefus);
		$zTplAffiche = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/statistique.tpl" );

		$oSmarty->assign("zBasePath", base_url());
		$oSmarty->assign('zTplAffiche',  $zTplAffiche);
		$zHtmlGraph = $oSmarty->fetch( ADMIN_TEMPLATE_PATH . "dashboard/zone/child/performance/parametre.tpl" );


		echo $zHtmlGraph;
			
    }

	/** 
	* function Ajax chargement des suivis de dossiers
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
}