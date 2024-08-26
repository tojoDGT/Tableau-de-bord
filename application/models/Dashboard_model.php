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

		//$zSql = "select * from (";

		$zSql = "select COUNT(*) over () found_rows,t.* from EXECUTION".$_iAnneeExercice.".ECRITURE t where 1=1 " ;

		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( ECRI_NUM LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  PERI_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  ECRI_LIB LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
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
	* function permettant d'afficher la liste des propriétaires codes
	*
	*
	* @return liste en tableau d'objet
	*/

	public function __getPropCode($_iAnneeExercice){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select t.PROP_CODE from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM " ;

		if( !empty($oRequest['PROP_CODE']) &&  sizeof($oRequest['PROP_CODE'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zPropCode){
				$zValue = "'". $zPropCode . "'";
				array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				$zSql .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
			}
		}

		$zSql .=" AND t.PROP_CODE <> 'ERR' ";

		$zSql .=" GROUP BY t.PROP_CODE ORDER BY t.PROP_CODE";

		//echo $zSql;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


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
	public function getNombreMontantParMois($_iAnneeExercice='2024',$_iMode,$_zParamAffich="PROP_CODE"){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "select ".$_zParamAffich.",SUM(MAND_MONTANT) as MONTANT,COUNT(t.ECRI_NUM) as NOMBRE,to_char(ECRI_DT_VALID, 'MM') as Mois,ECRI_EXERCICE 
				 from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM
				 AND t.PROP_CODE <> 'ERR' 
				 AND ECRI_EXERCICE = '" .$_iAnneeExercice."' AND ECRI_DT_VALID IS NOT NULL
				 GROUP BY ".$_zParamAffich.",to_char(ECRI_DT_VALID, 'MM'),ECRI_EXERCICE
				 ORDER BY ".$_zParamAffich.",to_char(ECRI_DT_VALID, 'MM') ASC" ;

		//echo $zSql . "\n\n<br>";
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJs($_iMode,$toRow,$_zParamAffich);


		return $zReturn;
	}

	public function getPropCode($_iAnneeExercice){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$toValue = array("90","06","40","20");

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

		$zSql = "SELECT  COUNT(m.ECRI_NUM) as NOMBRE,to_char(ECRI_DT_VALID, 'MM') as MOIS
				from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.ENTITE = '".$_zPsCode."' AND MAND_VISA_VALIDE = 1 
				GROUP BY to_char(ECRI_DT_VALID, 'MM')
				ORDER BY to_char(ECRI_DT_VALID, 'MM') ASC" ;
		
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

		$zSql = "SELECT  COUNT(m.ECRI_NUM) as NOMBRE,to_char(ECRI_DT_VALID, 'MM') as MOIS
				from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				AND m.MAND_UTR_VISA = '".$_iUserId."' AND MAND_VISA_VALIDE = 1 
				GROUP BY to_char(ECRI_DT_VALID, 'MM')
				ORDER BY to_char(ECRI_DT_VALID, 'MM') ASC" ;
		
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

		$zSql = " SELECT  COUNT(m.MAND_DT_RJT) as NOMBRE,to_char(MAND_DT_RJT, 'MM') as MOIS
				  from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				  AND m.ENTITE = '".$_zPsCode."' AND MAND_VISA_VALIDE = 0 
				  GROUP BY to_char(MAND_DT_RJT, 'MM')
				  ORDER BY to_char(MAND_DT_RJT, 'MM') ASC" ;

		
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

		$zSql = " SELECT  COUNT(m.MAND_DT_RJT) as NOMBRE,to_char(MAND_DT_RJT, 'MM') as MOIS
				  from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
				  AND m.MAND_UTR_RJT = '".$_iUserId."' AND MAND_VISA_VALIDE = 0 
				  GROUP BY to_char(MAND_DT_RJT, 'MM')
				  ORDER BY to_char(MAND_DT_RJT, 'MM') ASC" ;

		
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

		$zSql = "select ".$_zParamAffich.",SUM(MAND_MONTANT) as montant,COUNT(t.ECRI_NUM) as nombre,ECRI_EXERCICE 
				 from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM
				 AND t.PROP_CODE <> 'ERR' 
				 AND ECRI_EXERCICE = '" .$_iAnneeExercice."' AND ECRI_DT_VALID IS NOT NULL
				 GROUP BY ".$_zParamAffich.",ECRI_EXERCICE
				 ORDER BY ".$_zParamAffich." ASC" ;
	
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		$zReturn = $this->DispatchDataForChartJsDonut($_iMode,$toRow,$_zParamAffich);


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
			array_push($toAfficheLibelle, "'".$oRow[$_zParamAffich]."'");
			array_push($toAfficheNombre, "'".$oRow["NOMBRE"]."'");
			array_push($toAfficheMontant, "'".str_replace(",",".",$oRow['MONTANT'])."'");
		}

		/*
		echo "<pre>";
		print_r ($toAfficheMontant);
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

		$toColor = array('#00c0ef', '#3c8dbc','#434348','#7cb5ec','#90ed7d', '#f7a35c', '#8085e9', '#00c0ef', '#3c8dbc' );

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

		/*
		echo "<pre>";
		print_r ($toAffiche);
		echo "</pre>";
		*/

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

		$zSql = "SELECT     
          M.EXERCICE,
           M.SOA,
           M.COMPTE,
           M.MAND_VISA_TEF,
           M.MAND_NUM_INFO    NUMERO_MANDAT,
           T.NUMERO_TITRE     NUMERO_TITRE,
           T.CODE_TIERS       CODE_TIERS,
           T.TITULAIRE        TITULAIRE,
           M.MAND_OBJET,
           T.MONTANT          MONTANT,
           M.MAND_DATE_RECUP,
           M.MAND_DATE_REEL_VISA,
           CASE
               WHEN NVL (v.OVREF, 'OV') <> 'OV' AND V.NOTESTATUS = '5'
               THEN
                   'VIRE'
               WHEN NVL (e.ecri_valid, 0) = 1 AND m.mand_mode_paie = 'VB'
               THEN
                   'EN INSTANCE DE VIREMENT'
               WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
                    AND NVL (m.mand_rejet, 0) = 0
               THEN
                   'VISE'
               WHEN     m.MAND_COMPTE_CREDIT IS NULL
                    AND NVL (m.mand_rejet, 0) = 1
               THEN
                   'REJETE'-- (Motif:' || M.rejet_note || ')'
               WHEN M.MAND_DATE_TRAIT IS NULL
               THEN
                   'RECUPERE AU NIVEAU GUICHET UNIQUE'
               WHEN NVL (m.mand_date_recup,
                         TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
                    TO_DATE ('01/01/2019', 'DD/MM/RRRR')
               THEN
                   'DOSSIER NON PARVENU AU TRESOR'
           END                STATUT,
           V.OVREF            REFERENCE,
           CASE
               WHEN NVL (v.OVREF, 'OV') <> 'OV' AND V.NOTESTATUS = '5'
               THEN
                   TRUNC (V.OVDATEVALID)
               WHEN NVL (e.ecri_valid, 0) = 1 AND m.mand_mode_paie = 'VB'
               THEN
                   TRUNC (E.ECRI_DT_VALID)
               WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
                    AND NVL (m.mand_rejet, 0) = 0
               THEN
                   TRUNC (M.MAND_DATE_VISA)
               WHEN     m.MAND_COMPTE_CREDIT IS NULL
                    AND NVL (m.mand_rejet, 0) = 1
               THEN
                   TRUNC (M.MAND_DT_RJT)
               WHEN M.MAND_DATE_TRAIT IS NULL
               THEN
                   TRUNC (M.MAND_DATE_RECUP)
               WHEN NVL (m.mand_date_recup,
                         TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
                    TO_DATE ('01/01/2019', 'DD/MM/RRRR')
               THEN
                   TRUNC (M.MAND_DATE_ORD)
           END                DATE_SITUATION,
           M.ASSIGNATAIRE,
           M.MANDATAIRE,
           V.OVPCPAYEUR
      FROM EXECUTION".$_iAnneeExercice.".MANDAT                M,
           TITRE_XXI                 T,
           EXECUTION".$_iAnneeExercice.".ECRITURE              E,
           T_VIREMENT  V
     WHERE 1=1
           AND M.COMPTE NOT IN ('6011','6131','6522','6521')
           --AND M.SOA = '00-17-0-620-00000'
           AND M.ID_MAND = T.ID_MAND
           AND M.ENTITE = T.ENTITE
           AND M.ECRI_NUM = E.ECRI_NUM(+)
           --AND M.MAND_NUM_INFO=v.infonumero (+)
           AND T.NUMERO_TITRE = V.TITRENUMERO(+)
           --AND V.NOTESTATUS(+) = '5'
           AND M.MAND_MODE_PAIE = 'VB'
    UNION
SELECT 
           M.EXERCICE,
           M.SOA,
           M.COMPTE,
           M.MAND_VISA_TEF,
           M.MAND_NUM_INFO    NUMERO_MANDAT,
           T.NUMERO_TITRE     NUMERO_TITRE,
           T.CODE_TIERS       CODE_TIERS,
           T.TITULAIRE        TITULAIRE,
           M.MAND_OBJET,
           T.MONTANT          MONTANT,
           M.MAND_DATE_RECUP,
           M.MAND_DATE_REEL_VISA,
           CASE
               WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NULL
               THEN
                   'EN INSTANCE DE TRANSFERT'
               WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NOT NULL
               THEN
                   LIB_STATUS
               WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
                    AND NVL (m.mand_rejet, 0) = 0
               THEN
                   'VISE'
               WHEN     m.MAND_COMPTE_CREDIT IS NULL
                    AND NVL (m.mand_rejet, 0) = 1
               THEN
                   'REJETE (Motif:' || M.rejet_note || ')'
               WHEN M.MAND_DATE_TRAIT IS NULL
               THEN
                   'RECUPERE AU NIVEAU GUICHET UNIQUE'
               WHEN NVL (m.mand_date_recup,
                         TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
                    TO_DATE ('01/01/2019', 'DD/MM/RRRR')
               THEN
                   'DOSSIER NON PARVENU AU TRESOR'
           END                STATUT,
           BT_REF             REFERENCE,
           CASE
               WHEN BT_STATUS = '0'
               THEN
                   TRUNC (BT_ENV_EDIT_DATE)
               WHEN BT_STATUS = '2'
               THEN
                   TRUNC (BT_ENV_VALID_DATE)
               WHEN BT_STATUS = '4'
               THEN
                   TRUNC (BT_REC_DATE)
               WHEN BT_STATUS = '5'
               THEN
                   TRUNC (BT_REC_VALID_DATE)
               WHEN NVL (e.ecri_valid, 0) = 1 AND BT_REF IS NULL
               THEN
                   TRUNC (E.ECRI_DT_VALID)
               WHEN     m.MAND_COMPTE_CREDIT IS NOT NULL
                    AND NVL (m.mand_rejet, 0) = 0
               THEN
                   TRUNC (M.MAND_DATE_VISA)
               WHEN     m.MAND_COMPTE_CREDIT IS NULL
                    AND NVL (m.mand_rejet, 0) = 1
               THEN
                   TRUNC (M.MAND_DT_RJT)
               WHEN M.MAND_DATE_TRAIT IS NULL
               THEN
                   TRUNC (M.MAND_DATE_RECUP)
               WHEN NVL (m.mand_date_recup,
                         TO_DATE ('01/01/2019', 'DD/MM/RRRR')) =
                    TO_DATE ('01/01/2019', 'DD/MM/RRRR')
               THEN
                   TRUNC (M.MAND_DATE_ORD)
         END                DATE_SITUATION,
         M.ASSIGNATAIRE,
           M.MANDATAIRE,
           '' OVPCPAYEUR
      FROM EXECUTION".$_iAnneeExercice.".MANDAT          M,
           TITRE_XXI           T,
           EXECUTION".$_iAnneeExercice.".ECRITURE        E,
           T_TRANSFERT  TR
     WHERE 1=1
           AND M.COMPTE NOT IN ('6011','6131','6522','6521')
           AND M.MAND_MODE_PAIE = 'OO'
           --AND M.SOA = '00-17-0-620-00000'
           AND M.ECRI_NUM = E.ECRI_NUM(+)
           AND M.ID_MAND = T.ID_MAND(+)
           AND T.MAND_NUM_INFO = TR.DET_BEXECUTION".$_iAnneeExercice.".MANDAT(+)
--           ) group by SUBSTR(SOA,4,2) ;" ;


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
	public function getGraph(){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$oRequest = $_REQUEST;

		$zSql = "select count(PROP_CODE) as NB,SUM(MAND_MONTANT) as TOTAL, PROP_CODE,ECRI_EXERCICE from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM " ;

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zSql.=" AND t.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
		}

		if( !empty($oRequest['MIN_ABREV']) &&  $oRequest['MIN_ABREV']!="") {   
			$zSql.=" AND m.MIN_ABREV = '".$oRequest['MIN_ABREV']."'  ";
		}

		if( !empty($oRequest['TYPE_MAND']) &&  $oRequest['TYPE_MAND']!="") {   
			$zSql.=" AND m.TYPE_MAND = '".$oRequest['TYPE_MAND']."'  ";
		}

		if( !empty($oRequest['PROP_CODE']) &&  sizeof($oRequest['PROP_CODE'])>0) {   
			
			$toPropCode = array();
			foreach ($oRequest['PROP_CODE'] as $zPropCode){
				$zValue = "'". $zPropCode . "'";
				array_push($toPropCode, $zValue);
			}
			
			if(sizeof($toPropCode)>0){
				$zSql .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
			}
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  sizeof($oRequest['MAND_MODE_PAIE'])>0) {   
			
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

		$zSql .= " GROUP BY PROP_CODE,ECRI_EXERCICE ORDER BY ECRI_EXERCICE ASC ";

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
	public function getStatGLobal(){
		
		global $db;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$oRequest = $_REQUEST;

		$zSqlWhere = "";

		$zSqlWhere2 = "";

		if( !empty($oRequest['ECRI_EXERCICE']) &&  $oRequest['ECRI_EXERCICE']!="") {   
			$zSqlWhere .=" AND t.ECRI_EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
			$zSqlWhere2.=" AND EXERCICE = '".$oRequest['ECRI_EXERCICE']."'  ";
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
				$zSqlWhere .=" AND t.PROP_CODE IN (".implode(",",$toPropCode).")";
			}
		}

		if( !empty($oRequest['MAND_MODE_PAIE']) &&  sizeof($oRequest['MAND_MODE_PAIE'])>0) {   
			
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

		$zSousRequete	 = " select COUNT(*) from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM AND m.MAND_REJET = 1 ";
		$zSousRequete   .= $zSqlWhere ; 


		$zSql = "select distinct (SELECT SUM(MAND_MONTANT) over () FROM EXECUTION".$_iAnneeExercice.".MANDAT WHERE MAND_REJET<>1 ".$zSqlWhere2." OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) TOTAL,COUNT(*) over ()  as NB_SOA,SUM(MAND_MONTANT) over () NBTOTAL, (".$zSousRequete.") as rejete
		
		
		from EXECUTION".$_iAnneeExercice.".ECRITURE t,EXECUTION".$_iAnneeExercice.".MANDAT m WHERE t.ECRI_NUM = m.ECRI_NUM AND m.MAND_REJET<>1 " ;

		
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
