<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage le modèle concenrnant le tableau de bord accueil
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Dashboard_model extends CI_Model {

	/**  
	* Classe qui concerne le modèle tableau de bord
	* @package  DGT  
	* @subpackage entité */ 
	function __construct(){
		parent::__construct();

	}

	/** 
	* function permettant d'afficher la liste des suivis de dossiers
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function getDashboard(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		$toRow = array();

		$toDB = $this->load->database('catia',true);
		

		$toColumns = array( 
			0  => 'ECRI_NUM', 
			1  => 'PERI_CODE',
			2  => 'ECRI_REF', 
			3  => 'ECRI_LIB',
			4  => 'ECRI_DT_CECRITURE',
			5  => 'ECRI_DT_SECRITURE'
		);

		$oRequest = $_REQUEST;

		$zWhere = "";
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  PERI_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  ECRI_LIB LIKE '%".$oRequest['search']['value']."%' ) ";
		}

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getDashboard.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", '2024', $zData) ; 
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY ECRI_NUM ASC ";
		}

		$zSql .= " OFFSET ".$zDebut." ROWS FETCH NEXT ".$zFin." ROWS ONLY";


		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher le nombre / montant par mois dans la statistique
	*
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param string $_zParamAffich : propriétaire code
	*
	* @return format Json
	*/
	public function getNombreMontantParMoisPropCode($_iAnneeExercice='2024',$_iMode,$_zParamAffich="SUBSTR (m.soa, 1, 1)"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getNombreMontantParMoisPropCode.sql"); 
		$zData = str_replace("%PARAM%", trim($_zParamAffich), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 

		//echo $zSql . "\n\n<br>";
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJs($_iMode,$toRow,'PROP_CODE');


		return $zReturn;
	}

	/** 
	* function permettant d'afficher le nombre / montant par mois dans la statistique
	*
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param string $_zParamAffich : propriétaire code
	*
	* @return format Json
	*/
	public function getNombreMontantParMois($_iAnneeExercice='2024',$_iMode,$_zParamAffich="PROP_CODE"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();
		
		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getNombreMontantParMois.sql"); 
		$zData = str_replace("%PARAM%", trim($_zParamAffich), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 

		//echo $zSql . "\n\n<br>";
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJs($_iMode,$toRow,$_zParamAffich);


		return $zReturn;
	}


	/** 
	* function permettant d'afficher le nombre / montant par mois dans la statistique
	*
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param string $_zParamAffich : propriétaire code
	*
	* @return format Json
	*/
	public function getNombreParMoisStatutDossierAgent($_iType, $iUserEntiteId,$_iAnneeExercice='2024',$_zParamAffich="STATUT"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getNombreParMoisStatutDossierAgent.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 

		if($_iType==1){
			$zSql .= "AND MAND_UTR_VISA = '" . $iUserEntiteId . "'" ; 
		} else {
			$zSql .= "AND ENTITE = '" . $iUserEntiteId . "'" ; 
		}
					
		$zSql .= "	AND EXERCICE = '".$_iAnneeExercice."'   AND SUBSTR (soa, 1, 1) IN ('9','0','4','2') 
					AND MOIS IS NOT NULL
					GROUP BY STATUT,MOIS
					ORDER BY STATUT,MOIS " ;

		//echo $zSql . "\n\n<br>";
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$zReturn = $this->DispatchDataForChartJs(1,$toRow,$_zParamAffich);
		$zReturn = $this->getGraphUser(1,$toRow,$_zParamAffich);

		//echo $zReturn;


		return $zReturn;
	}

	public function getGraphUser($_iMode,$_toRow,$_zParamAffich){
			
			$toStatut = array('ADMIS EN DEPENSE', 'REJET', 'EN INSTANCE DE VISA COMPTA' , 'EN INSTANCE DE PRISE EN CHARGE');

			$zTestPropCode = "-1";
			$zAfficheSerieStat = "";
			
			foreach($toStatut as $zStatut){
										
					$zAfficheSerieStat .= "{";
					$zAfficheSerieStat .= "name: '".$zStatut."',";
					
					$tiNombre = array();

					if($zStatut != $zTestPropCode){
						$zTestPropCode = $zStatut;
						$iTest = 0;
					} 

					for($iIncrement=1;$iIncrement<=12;$iIncrement++){
							
						$iTest++;

						$iNombre = 0; 
						
						foreach($_toRow as $oRow){
							if($iIncrement == (int)$oRow["MOIS"] && $oRow[$_zParamAffich] == $zStatut) {
									$iNombre = $oRow["NOMBRE"];
							}
						}
						
						array_push ($tiNombre, $iNombre);
					}
					
					$zAfficheSerieStat .= "data: [".implode(",", $tiNombre)."],";
					$zAfficheSerieStat .= "stack: 'male'";
					$zAfficheSerieStat .= "},";
			}

			return $zAfficheSerieStat;

	}

	public function getPropCode($_iAnneeExercice){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$toValue = array("9","0","4","2");

		$zSql = "select t.PROP_LIBELLE from EXECUTION".$_iAnneeExercice.".PROPRIETAIRE t" ;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toAssign = array();
		for($iIncr=0;$iIncr<sizeof($toRow);$iIncr++){
			$oAssign = array();
			$oAssign['PROP_CODE'] = $toValue[$iIncr];
			$oAssign['PROP_LIBELLE'] = $toRow[$iIncr]['PROP_LIBELLE'];
			array_push($toAssign, $oAssign);
		}

		//print_r ($toAssign);

		return $toAssign;
	}

	/** 
	* function permettant d'afficher la liste des dossiers validés pour les postes comptable indiqué par mois
	*
	* @param string $_zPsCode : poste comptable indiqué
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param integer $_iTypeAffiche : Type d'affichage
	*
	* @return format Json
	*/
	public function getValidePcParMois($_zPsCode,$_iAnneeExercice='2024',$_iTypeAffiche){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zWhere.=" AND m.ENTITE = '".$_zPsCode."'"  ; 

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getValidePcParMois.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		$zReturn = $this->DispatchDataForChartJsPyramid($toRow,1,$_iTypeAffiche);


		return $zReturn;
	}

	/** 
	* function permettant d'afficher la liste des dossiers validés pour les agents d'un poste comptable indiqué par mois
	*
	* @param string $_iUserId : Utilisateur donné
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param integer $_iTypeAffiche : Type d'affichage
	*
	* @return format Json
	*/
	public function getValidePcParMoisUser($_iUserId,$_iAnneeExercice='2024',$_iTypeAffiche){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zWhere.=" AND m.MAND_UTR_VISA = '".$_iUserId."'" ; 

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getValidePcParMoisUser.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		$zReturn = $this->DispatchDataForChartJsPyramid($toRow,1,$_iTypeAffiche);


		return $zReturn;
	}

	/** 
	* function permettant d'afficher la liste des dossiers refusés pour les postes comptable indiqué par mois
	*
	* @param string $_zPsCode : poste comptable indiqué
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param integer $_iTypeAffiche : Type d'affichage
	*
	* @return format Json
	*/
	public function getRefusePcParMois($_zPsCode,$_iAnneeExercice='2024',$_iTypeAffiche){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zWhere.=" AND m.ENTITE = '".$_zPsCode."'" ;  
		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getRefusePcParMois.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 

		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		$zReturn = $this->DispatchDataForChartJsPyramid($toRow,0,$_iTypeAffiche);


		return $zReturn;
	}

	/** 
	* function permettant d'afficher la liste des dossiers refusés pour les agents d'un poste comptable indiqué par mois
	*
	* @param string $_iUserId : Utilisateur donné
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param integer $_iTypeAffiche : Type d'affichage
	*
	* @return format Json
	*/
	public function getRefusePcParMoisUser($_iUserId,$_iAnneeExercice='2024',$_iTypeAffiche){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zWhere.=" AND m.MAND_UTR_RJT = '".$_iUserId."'";

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getRefusePcParMoisUser.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		$zReturn = $this->DispatchDataForChartJsPyramid($toRow,0,$_iTypeAffiche);


		return $zReturn;
	}

	/** 
	* function permettant d'afficher en Json les retours de résultat
	*
	* @param tableau object $_toRow : tableau d'objet retour
	* @param integer $_iValid :  valide / refus
	* @param integer $_iTypeAffiche : Type d'affichage
	*
	* @return format Json
	*/
	private function DispatchDataForChartJsPyramid($_toRow,$_iValid,$_iTypeAffiche){

		$zAfficheSerieStat = "";
		$toAffiche = array();


		$iTest = 1;
		foreach ($_toRow as $oRow){
			
			if($iTest != (int)$oRow['MOIS']){
				$oAffiche = array();
				$oAffiche["NOMBRE"] = 0;
				$oAffiche["MOIS"]	= $iTest;
				array_push ($toAffiche,$oAffiche);
				$iTest++;
			} 

			$oAffiche = array();
			$oAffiche["NOMBRE"] = $oRow['NOMBRE'];
			$oAffiche["MOIS"]	= $oRow['MOIS'];
			array_push ($toAffiche,$oAffiche);
			
			$iTest++;
		}

		$toMois = array("Nan", "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
		

		if ($_iTypeAffiche==1){

			$iColor = 0;
			foreach ($toAffiche  as $oRow){

				$toData = array();
			
				$zAfficheSerieStat .= '"' . (int)$oRow["MOIS"] . '":{';
				$zAfficheSerieStat .= '"Nombre":"'.(int)$oRow["NOMBRE"].'",';
				$zAfficheSerieStat .= '"Mois":"'.$toMois[(int)$oRow["MOIS"]].'",';
				$zAfficheSerieStat .= '"Valid":"'.$_iValid.'"';
				$zAfficheSerieStat .= '},';

			}

			return $zAfficheSerieStat;

		} else {
			$iColor = 0;
			$toData = array();
			foreach ($toAffiche  as $oRow){
				array_push($toData, $oRow['NOMBRE']);
			}

			$zAfficheSerieStat .= "data: [".implode(",",$toData)."],";
			return $zAfficheSerieStat;
		}
		
	}

	
	/** 
	* function permettant d'afficher le nombre / montant d'un ecriture
	*
	* @param integer $_iAnneeExercice Année de l'exercice
	* @param integer $_iMode :  mode affichage
	* @param integer $_zParamAffich : proprietaire code
	*
	* @return template HTML
	*/
	public function getNombreMontantParMoisEcriture($_iAnneeExercice='2024',$_iMode,$_zParamAffich="PROP_CODE"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getNombreMontantParMoisEcriture.sql"); 
		$zData = str_replace("%PARAM%", trim($_zParamAffich), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJsDonut($_iMode,$toRow,$_zParamAffich);


		return $zReturn;
	}

	public function getNombreMontantParMoisEcriturePropCode($_iAnneeExercice='2024',$_iMode,$_zParamAffich="PROP_CODE"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getNombreParMoisStatutDossierAgent.sql"); 
		$zData = str_replace("%PARAM%", trim($_zParamAffich), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
	
		
		$zQuery = $toDB->query($zSql);

		//echo $zSql;
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJsDonut($_iMode,$toRow,"PROP_CODE");


		return $zReturn;
	}

	/** 
	* function privée permettant d'afficher en Json les retours de résultat
	*
	* @param integer $_iMode : mode d'affichage
	* @param tableau objet $_toRow :  tableau objet retour résultat
	* @param string $_zParamAffich : Type d'affichage
	*
	* @return format Json
	*/
	private function DispatchDataForChartJsDonut($_iMode=2,$_toRow,$_zParamAffich){

		$zAfficheSerieStat = "";
		$toAffiche = array();
		$iTotal = 0;
		$toAfficheLibelle = array();
		$toAfficheMontant = array();
		$toAfficheNombre = array();
		$toTotal = array();

		$toColor = array('#7cb5ec','#434348','#90ed7d', '#f7a35c', '#8085e9', '#00c0ef', '#3c8dbc' );

		$iTotal = 0;

		$zTestPropCode = "-1";
		foreach ($_toRow as $oRow){
			
			$zLibelle = "";
			switch ($oRow[strtoupper($_zParamAffich)]){

				case 0:
					$zLibelle = "ETAT";
					break;

				case 9:
					$zLibelle = "EPN";
					break;

				case 4:
					$zLibelle = "COMMUNE";
					break;

				case 2:
					$zLibelle = "REGION";
					break;

				default:
					$zLibelle = $oRow[strtoupper($_zParamAffich)];
					break;
	
			}
			
			array_push($toAfficheLibelle, "'".$zLibelle."'");
			array_push($toAfficheNombre, "'".$oRow["NOMBRE"]."'");
			array_push($toAfficheMontant, "'".str_replace(",",".",$oRow['MONTANT'])."'");
		}

		
		/*echo "<pre>";
		print_r ($toAfficheLibelle);
		echo "</pre>";*/

		$zAfficheSerieStat .= "labels: [";
		$zAfficheSerieStat .= implode(",",$toAfficheLibelle);
		$zAfficheSerieStat .= "  ],";
		$zAfficheSerieStat .= "  datasets: [";
		$zAfficheSerieStat .= "	{";
		if($_iMode==1){
			$zAfficheSerieStat .= "	  data: [".implode(",",$toAfficheNombre)."],";
		} else {
			$zAfficheSerieStat .= "	  data: [".implode(",",$toAfficheMontant)."],";
		}
		
		$zAfficheSerieStat .= "	  backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],";
		$zAfficheSerieStat .= "	}";
		$zAfficheSerieStat .= "  ]";


		//echo $zAfficheSerieStat;


		return $zAfficheSerieStat;
	}

	/** 
	* function privée permettant d'afficher en Json les retours de résultat
	*
	* @param integer $_iMode : mode d'affichage
	* @param tableau objet $_toRow :  tableau objet retour résultat
	* @param string $_zParamAffich : Type d'affichage
	*
	* @return format Json
	*/
	private function DispatchDataForChartJs($_iMode=2,$_toRow,$_zParamAffich){

		$zAfficheSerieStat = "";
		$toAffiche = array();

		//$toColor = array('#00c0ef', '#3c8dbc','#434348','#7cb5ec','#90ed7d', '#f7a35c', '#8085e9', '#00c0ef', '#3c8dbc' );

		$toColor = array('#7cb5ec','#3c8dbc','#90ed7d', '#434348', '#8085e9', '#00c0ef', '#3c8dbc');

		$zTestPropCode = "-1";
		foreach ($_toRow as $oRow){

			if($oRow[$_zParamAffich] != $zTestPropCode){
				$zTestPropCode = $oRow[$_zParamAffich];
				$toAffiche[$zTestPropCode]['nombre'] = array();
				$toAffiche[$zTestPropCode]['montant'] = array();
				$iTest = 0;
			} 

			
			if($zTestPropCode == $oRow[$_zParamAffich]){

				$iTest++;
				if($iTest != (int)$oRow['MOIS']){
					$iTest++;
					array_push($toAffiche[$zTestPropCode]['nombre'], 0);
					array_push($toAffiche[$zTestPropCode]['montant'], 0);
				}

				array_push($toAffiche[$zTestPropCode]['nombre'], $oRow['NOMBRE']);
				array_push($toAffiche[$zTestPropCode]['montant'], str_replace(",",".",$oRow['MONTANT']));
			}
		}

		
		/*echo "<pre>";
		print_r ($toAffiche);
		echo "</pre>";*/
		

		$iColor = 0;
		foreach ($toAffiche as $zkey => $oRow){

			$toData = array();
			$toData = ($_iMode==1)?$oRow['nombre']:$oRow['montant'];
		
			$zAfficheSerieStat .= "{";
			$zAfficheSerieStat .= "label				: '".$zkey."',";
			$zAfficheSerieStat .= "backgroundColor		: '".$toColor[$iColor]."',";
			$zAfficheSerieStat .= "borderColor			: '".$toColor[$iColor]."',";
			$zAfficheSerieStat .= "pointRadius          : true,";
			$zAfficheSerieStat .= "pointColor			: '#3b8bba',";
			$zAfficheSerieStat .= "pointStrokeColor		: '".$toColor[$iColor]."',";
			$zAfficheSerieStat .= "pointHighlightFill	: '#fff',";
			$zAfficheSerieStat .= "pointHighlightStroke	: '".$toColor[$iColor]."',";
			$zAfficheSerieStat .= "data					: [".implode(",", $toData)."]";
			$zAfficheSerieStat .= "},";

			$iColor++;
		}

		//echo $zAfficheSerieStat;

		return $zAfficheSerieStat;
	}

	/** 
	* function permettant d'afficher la liste des abreviations des Ministères
	*
	* @return tableau objet
	*/
	public function getMinAbrev($_iAnneeExercice){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select MIN_ABREV from EXECUTION".$_iAnneeExercice.".MANDAT GROUP BY MIN_ABREV ORDER BY MIN_ABREV" ;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}

	/** 
	* function permettant d'afficher la liste des types de mandats
	*
	* @return tableau objet
	*/
	public function getTypeMandat($_iAnneeExercice){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select DISTINCT TYPE_MAND from EXECUTION".$_iAnneeExercice.".MANDAT GROUP BY TYPE_MAND ORDER BY TYPE_MAND ASC" ;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}

	/** 
	* function permettant d'afficher la liste des dates d'exercice
	*
	* @return tableau objet
	*/
	public function getAllDateExercice($_iAnneeExercice){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select ECRI_EXERCICE from EXECUTION".$_iAnneeExercice.".ECRITURE " ;

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zSql.=" WHERE ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		$zSql .=" GROUP BY ECRI_EXERCICE ORDER BY ECRI_EXERCICE ASC";

		//echo $zSql;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}


	/** 
	* function permettant d'afficher la liste suivis Mandats
	*
	* @return tableau objet
	*/
	public function getSuiviMandat(){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zData = @file_get_contents(APPLICATION_PATH ."sql/dashboard/getSuiviMandat.sql"); 
		$zSql = str_replace("%ANNEE%", '2024', $zData) ; 
		
		//echo $zSql;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}


	/** 
	* function permettant d'afficher la graphe
	*
	* @return tableau objet
	*/
	public function getGraph($_iAnneeExercice){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$oRequest = $_REQUEST;

		$zSql = "select count(PROP_CODE) as NB,
		SUM(MAND_MONTANT) as TOTAL, SUBSTR (m.soa, 1, 1) PROP_CODE,ECRI_EXERCICE from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM " ;

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zSql.=" AND t.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zSql.=" AND m.MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}

		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zSql.=" AND m.TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		}

		/*if( !empty($oRequest['PROP_CODE']) &&  sizeof($oRequest['PROP_CODE'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zPropCode){
				$zValue = "'". $zPropCode . "'";
				array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				//$zSql .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
				$zSql .=" AND SUBSTR (m.soa, 1, 2) IN (".implode(",",$toPropCode).")";
			}
		}*/

		$zSql .=" AND SUBSTR (m.soa, 1, 1) IN ('9','0','4','2')";

		//if( !empty($oRequest['MAND_MODE_PAIE']) &&  sizeof($oRequest['MAND_MODE_PAIE'])>0) {   

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  is_array($oRequest['MAND_MODE_PAIE'])>0) {   
			
		   $toMandMode = array();
			foreach ($oRequest['MAND_MODE_PAIE'] as $zMandMode){
				if($zMandMode!=""){
					$zValue = "'". $zMandMode . "'";
					array_push($toMandMode, $zValue);
				}
			}
			
			if(sizeof($toMandMode)>0){
				$zSql .=" AND m.MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}

		$zSql .= " GROUP BY SUBSTR (m.soa, 1, 1),ECRI_EXERCICE ORDER BY ECRI_EXERCICE ASC ";

		//echo $zSql;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		return $toRow;
	}

	/** 
	* function permettant d'afficher la statistique globale
	*
	* @return tableau objet
	*/
	public function getStatGLobal($_iAnneeExercice, $_this=''){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$oRequest = $_REQUEST;

		$zSqlWhere = "";
		$zSqlWhere2 = "";
		$zSqlWhere3 = "";

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			//$zSqlWhere2 .=" AND t.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
			$zSqlWhere.=" AND EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
			$zSqlWhere3 = $zSqlWhere ; 
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zSqlWhere  .=" AND m.MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
			//$zSqlWhere2 .=" AND MIN_ABREV <> '".$oRequest['MIN_ABREV']."'  ";
		}

		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zSqlWhere.=" AND m.TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		}

		if( !empty($oRequest['PROP_CODE']) &&  sizeof($oRequest['PROP_CODE'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zPropCode){
				if($zPropCode!=""){
					$zValue = "'". $zPropCode . "'";
					array_push($toPropCode, $zValue);
				}
			}
			
			if(sizeof($toPropCode)>0){
				//$zSqlWhere .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
				$zSqlWhere .=" AND SUBSTR (m.soa, 1, 1) IN (".implode(",",$toPropCode).")";
			}
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  $oRequest['MAND_MODE_PAIE']!="") {   

			if($oRequest['MAND_MODE_PAIE']=='VB'){
				$zSqlWhere .=" AND MAND_MODE_PAIE IN ('VB','ME')";
			} else {
				$zSqlWhere.=" AND MAND_MODE_PAIE = '".$oRequest['MAND_MODE_PAIE']."'  ";
			}
			
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  is_array($oRequest['MAND_MODE_PAIE'])>0) {   
			
		   $toMandMode = array();
			foreach ($oRequest['MAND_MODE_PAIE'] as $zMandMode){
				if($zMandMode!=""){
					$zValue = "'". $zMandMode . "'";
					array_push($toMandMode, $zValue);
				}
			}
			
			if(sizeof($toMandMode)>0){
				$zSqlWhere .=" AND m.MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}

		if( !empty($oRequest['PROP_CODE']) &&  $oRequest['PROP_CODE']!="") {   
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zValue){
					array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				$zSqlWhere .=" AND SUBSTR (soa, 1, 1) IN (".implode(",",$toPropCode).")";
			}
		}


		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zSqlWhere.=" AND TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		} 


		/*if( !empty($oRequest['STATUT']) &&  $oRequest['STATUT']!="") {   
			$zSqlWhere.=" AND STATUT = '".$oRequest['STATUT']."'  ";
		} */

		if( !empty($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zSqlWhere.=" AND m.ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( !empty($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zSqlWhere.=" AND MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}

		if( !empty($oRequest['date_debut_rec']) &&  $oRequest['date_fin_rec']!="") {   
			$zDateDebRec = $oRequest['date_debut_rec'] ; 
			$zDateFinRec = $oRequest['date_fin_rec'] ; 

			if ($zDateDebRec == $zDateFinRec){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinRec,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinRec =  $oDate->format('d/m/Y');
			}

			$zSqlWhere.="  AND MAND_DATE_RECUP BETWEEN '".$zDateDebRec."' AND '".$zDateFinRec."' ";
		}

		//print_r ($oRequest);


		if( !empty($oRequest['date_debut_visa']) &&  $oRequest['date_fin_visa']!="") {   
			$zDateDebVisa = $oRequest['date_debut_visa'] ; 
			$zDateFinVisa = $oRequest['date_fin_visa'] ; 

			if ($zDateDebVisa == $zDateFinVisa){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinVisa,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinVisa =  $oDate->format('d/m/Y');
			}

			$zSqlWhere.="  AND MAND_DATE_REEL_VISA BETWEEN '".$zDateDebVisa."' AND '".$zDateFinVisa."' ";
		}

		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='PROP_CODE[]'){
					$zValue = "'". $oData['value'] . "'";
					array_push($toPropCode, $zValue);
				}
			}
			
			if(sizeof($toPropCode)>0){
				$zSqlWhere .=" AND SUBSTR (soa, 1, 1) IN (".implode(",",$toPropCode).")";
			}
		}

		$toMandMode1 = array();
		if( !empty($oRequest['data']) &&  sizeof($oRequest['data'])>0) {   

		   $toMandMode = array();
			foreach ($oRequest['data'] as $oData){
				if($oData['name']=='MAND_MODE_PAIE'){
					if($oData['value']!=""){
						$zValue = "'". $oData['value'] . "'";
						array_push($toMandMode, $zValue);
						array_push($toMandMode1, $oData['value']);
					}
				}
				
			}
			
			if(sizeof($toMandMode)>0){

				if(in_array("'VB'", $toMandMode)){
					/* Money electronique */
					$zValue = "'ME'";
					array_push($toMandMode,$zValue);
				}  

				$zSqlWhere .=" AND MAND_MODE_PAIE IN (".implode(",",$toMandMode).")";
			}
		}

		$zSousRequete	 = " select COUNT(*) from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE m.ECRI_NUM = t.ECRI_NUM(+) AND m.MAND_REJET = 1 ";
		$zSousRequete   .= $zSqlWhere ; 


		$zSql = "select distinct (SELECT SUM(MAND_MONTANT) over () FROM EXECUTION".$_iAnneeExercice.".MANDAT WHERE MAND_REJET<>1 ".$zSqlWhere3." OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) TOTAL,COUNT(*) over ()  as NB_SOA,SUM(MAND_MONTANT) over () NBTOTAL, (".$zSousRequete.") as rejete
		
		
		from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE m.ECRI_NUM = t.ECRI_NUM(+) AND m.MAND_REJET<>1 " ;

		
		$zSql .= $zSqlWhere;

		$zSql .= " ORDER BY ECRI_EXERCICE ASC ";

		$zSql .= " OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY";

		//echo $zSql;
		//die();
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/


		return $toRow;
	}
}
