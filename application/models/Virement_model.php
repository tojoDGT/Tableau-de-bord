<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* @package DGT
* @subpackage le modèle concenrnant les virements
* @author RANDRIANANTENAINA Tojo Michaël
*/
class Virement_model extends CI_Model {

	/**  
	* Classe qui concerne le modèle virement
	* @package  DGT  
	* @subpackage entité */ 
	function __construct(){
		parent::__construct();
	}

	/** 
	* function permettant de retourner le colonne à afficher dans une variable session
	*
	* @return liste des colonnes à afficher
	*/
	public function getSessionColonne ($_iParamReturn)
	{
		$toColonne = array();
		switch ($_iParamReturn){

			case 1:
				$toColonneVirement = array();
				if(empty($_SESSION["colonneAfficheVirement"])){
					array_push($toColonneVirement, 'IdentifiantNumInfo-dtl.MANDAT');
					array_push($toColonneVirement, 'PCASSIGNATAIRE-dtl.PCASSIGNATAIRE');
					array_push($toColonneVirement, 'PCPAYEUR-dtl.PCPAYEUR');
					array_push($toColonneVirement, 'STATUT-dtl.STATUS');
					array_push($toColonneVirement, 'DATE DE VIREMENT-virement.DMDVIRDATEVALID');
					array_push($toColonneVirement, 'TYPE BUDGET DEPENSE-dtl.TYPE_BUDG_DEP');
					array_push($toColonneVirement, 'EXERCICE-dtl.EXERCICE');
					array_push($toColonneVirement, 'OBJET-dtl.DEPENSEOBJET');
					array_push($toColonneVirement, 'TITULAIRE-dtl.TITULAIRE');
					array_push($toColonneVirement, 'CATEGORIE DEPENSE-dtl.CATEG_DEPENSE');
					array_push($toColonneVirement, 'MONTANT-dtl.MONTANT');

					$_SESSION["colonneAfficheVirement"] = serialize($toColonneVirement);
				} else {
					$toColonneVirement = unserialize($_SESSION["colonneAfficheVirement"]);
				}

				$toColonne = $toColonneVirement ; 
				break;

			case 2:

				$toColonneOP46 = array();
				if(empty($_SESSION["colonneAfficheOP46"])){
					array_push($toColonneOP46, 'Identifiant-virement.ID');
					array_push($toColonneOP46, 'DATE DE VIREMENT-virement.DMDVIRDATEVALID');
					array_push($toColonneOP46, 'TITULAIRE-virement.TITULAIRE');
					array_push($toColonneOP46, 'VILLE-c.VILLE');
					array_push($toColonneOP46, 'OBJET-c.OBJET');
					//array_push($toColonneOP46, 'DATE DOSSIER-c.DATE_DOSSIER');
					array_push($toColonneOP46, 'STATUT-virement.STATUS');
					array_push($toColonneOP46, 'CATEGORIE DEPENSE-dtl.CATEG_DEPENSE');
					//array_push($toColonneOP46, 'PCPAYEUR-virement.PCPAYEUR');
					//array_push($toColonneOP46, 'PCASSIGNATAIRE-virement.PCASSIGNATAIRE');

					array_push($toColonneOP46, 'EXERCICE-d.PERI_EXERCICE');
					array_push($toColonneOP46, 'DENOMINATION-c.DENOMINATION');
					array_push($toColonneOP46, 'POSTE-p.PSTP_LIBELLE');
					array_push($toColonneOP46, 'CODE TIERS-t.CODE_TIERS');
					array_push($toColonneOP46, 'MONTANT-virement.MONTANT');

					$_SESSION["colonneAfficheOP46"] = serialize($toColonneOP46);
				} else {
					$toColonneOP46 = unserialize($_SESSION["colonneAfficheOP46"]);
				}

				$toColonne = $toColonneOP46 ; 

				break;
		}

		return $toColonne ; 
	}

	
	/** 
	* function permettant d'afficher la liste des virements
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function GetVirementListe(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		$toRow = array();

		$toDB = $this->load->database('catia',true);
	
			
		$toColumns = array( 
				0  => 'PCASSIGNATAIRE', 
				1  => 'PCPAYEUR',
				2  => 'ENTITECODE', 
				3  => 'EXERCICE',
				4  => 'DEPENSEOBJET',
				5  => 'MONTANT', 
				4  => 'DATERECUPDOSSIER',
				5  => 'PROGRAMME', 
				6  => 'NUMERO_COMPTE'
		);


		$oRequest = $_REQUEST;

		$_iAnneeExercice = 2024;
		if( !empty($oRequest['EXERCICE']) &&  $oRequest['EXERCICE']!="") {   
			$_iAnneeExercice = $oRequest['EXERCICE'];
		}

		$zWhere = "  ";
		$zOtherWhere = "  WHERE 1=1 ";

		if( !empty($oRequest['EXERCICE']) &&  $oRequest['EXERCICE']!="") {   
			$zWhere.=" AND dtl.EXERCICE = '".$oRequest['EXERCICE']."'  ";
		}

		if( !empty($oRequest['PCPAYEUR']) &&  $oRequest['PCPAYEUR']!="") {   
			$zWhere.=" AND dtl.PCPAYEUR = '".$oRequest['PCPAYEUR']."'  ";
		}

		if( !empty($oRequest['PCASSIGNATAIRE']) &&  $oRequest['PCASSIGNATAIRE']!="") {   
			$zWhere.=" AND dtl.PCASSIGNATAIRE = '".$oRequest['PCASSIGNATAIRE']."'  ";
		}

		if( !empty($oRequest['TYPE_BUDGET_DEP']) &&  $oRequest['TYPE_BUDGET_DEP']!="") {   
			$zOtherWhere.=" AND TYPE_BUDG_DEP = '".$oRequest['TYPE_BUDGET_DEP']."'  ";
		}

		if( !empty($oRequest['STATUS']) &&  $oRequest['STATUS']!="") {   
			$zOtherWhere.=" AND STATUS = '".$oRequest['STATUS']."'  ";
		}

		if( !empty($oRequest['CATEG_DEPENSE']) &&  $oRequest['CATEG_DEPENSE']!="") {   
			$zOtherWhere.=" AND CATEG_DEPENSE= '".$oRequest['CATEG_DEPENSE']."'  ";
		} 

		if( !empty($oRequest['DATE_DEB']) &&  $oRequest['DATE_FIN']!="") {   
			$zDateDebVrmt = $oRequest['DATE_DEB'] ; 
			$zDateFinVrmt = $oRequest['DATE_FIN'] ; 

			if ($zDateDebVrmt == $zDateFinVrmt){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinVrmt,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinVrmt =  $oDate->format('d/m/Y');
			}

			$zWhere.="  AND virement.DMDVIRDATEVALID BETWEEN '".$zDateDebVrmt."' AND '".$zDateFinVrmt."' ";
		}

		$toMandMode1 = array();
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( dtl.PCASSIGNATAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.PCPAYEUR LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.ENTITECODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.EXERCICE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.DEPENSEOBJET LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.TITULAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  dtl.MONTANT LIKE '%".$oRequest['search']['value']."%' ) ";
		}

		if( !empty($oRequest['search']['value']) ) {  
			$zOtherWhere.=" AND  CATEG_DEPENSE LIKE '%".$oRequest['search']['value']."%'  ";
		}

		$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/compteVirement.sql"); 
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zWhere.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zWhere.=" ORDER BY PCPAYEUR ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['start']+(int)$oRequest['length'];
		} else {
			$zWhere.=" ORDER BY PCPAYEUR ASC ";
		}

		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		$zData = str_replace("%OTHERWHERE%", trim($zOtherWhere), $zData) ; 
		$zData = str_replace("%DEBUT%", trim($zDebut), $zData) ; 
		$zSql = str_replace("%FIN%", trim($zFin), $zData) ; 

		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		/*
		echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$_iNbrTotal = 0;

		if(sizeof($toRow)>0){
			//$_iNbrTotal = (trim($zOtherWhere)!="")?$toRow[0]['FOUND_ROWS1']:$toRow[0]['FOUND_ROWS'] ;
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}


	/** 
	* function permettant d'afficher la liste des PCPAYEUR / PCASSIGNATAIRE
	*
	*
	* @return liste en tableau d'objet
	*/

	public function getPstLibelle($_zChamp){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = "	SELECT DISTINCT ".$_zChamp.",PSTP_CODE,PSTP_LIBELLE from VIREMENT.CV_NOTEDTL,
					catia.poste_comptable@dblccad  p
					WHERE p.pstp_code = ".$_zChamp."
					GROUP BY ".$_zChamp.",PSTP_CODE,PSTP_LIBELLE
					ORDER BY PSTP_CODE" ;

		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}


	/** 
	* function permettant d'afficher la liste des status de virement
	*
	*
	* @return liste en tableau d'objet
	*/

	public function getStatutVirement(){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = " SELECT DISTINCT NOTESTATUSLIBELLE FROM  VIREMENT.CV_NOTESTATUS   " ;

		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}


	/** 
	* function permettant d'afficher la liste des propriétaires codes
	*
	*
	* @return liste en tableau d'objet
	*/

	public function getSigle($_zChamp){
		
		global $db;

		$oRequest = $_REQUEST;

		$toDB = $this->load->database('catia',true);

		$toRow = array();

		$zSql = " SELECT distinct ".$_zChamp."
				  FROM nonepn.titre                       t,
					   nonepn.dossier                     d,
					   ctiers.compte_tiers                c,
					   CTIERS.TIERS                       tt,
					   nonepn.ctiers_rga                  cais,
					   catia.poste_comptable@dblccad  p    
				 WHERE     t.dossier_id = d.id
					   AND t.compte_tiers = d.compte_tiers
					   AND c.id_ct = d.compte_tiers
					   AND tt.code_tiers = t.code_tiers
					   AND p.pstp_code = c.comptable_gestionnaire
					   AND d.compte_tiers = cais.compte_tiers
					   AND d.mode_reglement = 'VB'
					   AND d.compte_tiers NOT IN ('46-14-7-A26-10101', '46-14-7-A25-10101')
					   AND d.peri_exercice >= '2023'
					   AND valid = '1'
			     group by ".$_zChamp."
				 ORDER BY ".$_zChamp." ASC" ;


		//echo $zSql;
		
		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();


		return $toRow;
	}

	/** 
	* function permettant d'afficher la liste des virements opérations 46
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function GetVirementListe_op46(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		$toRow = array();

		$toDB = $this->load->database('catia',true);
			
		$toColumns = array( 
				0  => 'virement.DMDVIRDATEVALID', 
				1  => 'dtl.TITULAIRE',
				2  => 'c.VILLE', 
				3  => 'd.OBJET',
				4  => 'd.DATE_DOSSIER',
				5  => 'virement.STATUS', 
				4  => 'dtl.CATEG_DEPENSE',
				5  => 'dtl.PCPAYEUR',
				6  => 'dtl.PCASSIGNATAIRE',
				7  => 'd.PERI_EXERCICE',
				8  => 'c.DENOMINATION',
				9  => 'p.PSTP_LIBELLE',
				10  => 'dtl.CATEGORIE',
				11  => 'dtl.MONTANT'
		);


		$oRequest = $_REQUEST;

		$_iAnneeExercice = 2023;

		$zWhere = " ";
		$zOtherWhere = " ";

		if( !empty($oRequest['PERI_EXERCICE']) &&  $oRequest['PERI_EXERCICE']!="") {   
			$zWhere.=" AND d.PERI_EXERCICE = '".$oRequest['PERI_EXERCICE']."'  ";
			$_iAnneeExercice = $oRequest['PERI_EXERCICE'];
		}

		if( !empty($oRequest['PERI_MOIS']) &&  $oRequest['PERI_MOIS']!="") {   
			$zWhere.=" AND d.PERI_MOIS = '".$oRequest['PERI_MOIS']."'  ";
		}

		if( !empty($oRequest['PCPAYEUR']) &&  $oRequest['PCPAYEUR']!="") {   
			$zWhere.=" AND virement.PCPAYEUR = '".$oRequest['PCPAYEUR']."'  ";
		}

		if( !empty($oRequest['PCASSIGNATAIRE']) &&  $oRequest['PCASSIGNATAIRE']!="") {   
			$zWhere.=" AND virement.PCASSIGNATAIRE = '".$oRequest['PCASSIGNATAIRE']."'  ";
		}

		if( !empty($oRequest['DENOMINATION']) &&  $oRequest['DENOMINATION']!="") {   
			$zWhere.=" AND c.DENOMINATION = '".$oRequest['DENOMINATION']."'  ";
		}

		if( !empty($oRequest['STATUS']) &&  $oRequest['STATUS']!="") {   
			$zWhere.=" AND virement.STATUS = '".$oRequest['STATUS']."'  ";
		}

		/*if( !empty($oRequest['CATEG_DEPENSE']) &&  $oRequest['CATEG_DEPENSE']!="") {   
			$zOtherWhere.=" AND CATEG_DEPENSE= '".$oRequest['CATEG_DEPENSE']."'  ";
		} */

		if( !empty($oRequest['DATE_DEB']) &&  $oRequest['DATE_FIN']!="") {   
			$zDateDebVrmt = $oRequest['DATE_DEB'] ; 
			$zDateFinVrmt = $oRequest['DATE_FIN'] ; 

			if ($zDateDebVrmt == $zDateFinVrmt){
				$oDate = new DateTime($_this->date_fr_to_en($zDateFinVrmt,"/","-"));
				$oDate->modify('+1 day');
				$zDateFinVrmt =  $oDate->format('d/m/Y');
			}

			$zWhere.="  AND virement.DMDVIRDATEVALID BETWEEN '".$zDateDebVrmt."' AND '".$zDateFinVrmt."' ";
		}

		if( !empty($oRequest['CATEG_DEPENSE']) &&  $oRequest['CATEG_DEPENSE']!="") {   

			if($oRequest['CATEG_DEPENSE']=='-1'){
				$zWhere.=" AND CATEG_DEPENSE IS NULL ";
			} else {
				$zWhere.=" AND CATEG_DEPENSE= '".$oRequest['CATEG_DEPENSE']."'  ";
			}
		} 

		$toMandMode1 = array();
		
		if( !empty($oRequest['search']['value']) ) {   
			$zWhere.=" AND ( virement.TITULAIRE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  c.VILLE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  d.OBJET LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  t.ID LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  d.DATE_DOSSIER LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  d.PERI_EXERCICE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  c.DENOMINATION LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  p.PSTP_LIBELLE LIKE '%".$oRequest['search']['value']."%'  ";
			$zWhere.=" OR  CATEG_DEPENSE LIKE '%".$oRequest['search']['value']."%' ) ";
		}

		$zColonne = "	ROW_NUMBER() OVER (ORDER BY virement.DMDVIRDATEVALID ASC) AS r__,
						COUNT(*) OVER () AS found_rows,c.denomination,t.code_tiers,c.ville,
						t.ID,CONCAT (TO_CHAR(t.montant,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS montant,t.compte_tiers,
						d.objet,d.date_dossier,d.peri_exercice,
						tt.titulaire,
						p.*,virement.* "; 


		$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/46_virement.sql"); 
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zWhere.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zWhere.=" ORDER BY virement.DMDVIRDATEVALID ASC ";
			}

			//$zSql.=" ORDER BY DMDVIRDATEVALID ASC ";

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['start']+(int)$oRequest['length'];
		} else {
			$zWhere.=" ORDER BY virement.DMDVIRDATEVALID ASC ";
		}

		$zData = str_replace("%COLUMN%", trim($zColonne), $zData) ; 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		$zData = str_replace("%OTHERWHERE%", trim($zOtherWhere), $zData) ; 
		$zData = str_replace("%DEBUT%", trim($zDebut), $zData) ; 
		$zSql = str_replace("%FIN%", trim($zFin), $zData) ; 


		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		/*
		echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$_iNbrTotal = 0;

		if(sizeof($toRow)>0){
			
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher la liste des dossiers
	*
	* @param integer $_iNbrTotal nombre total à afficher dans la pagination
	* @param object $_this : controller
	*
	* @return liste en tableau d'objet
	*/
	public function getDossier(&$_iNbrTotal = 0,$_this=''){
		
		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$oRequest = $_REQUEST;

		
		if( isset($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']==1){   
			$toColumns = array( 
				0  => 'm.ECRI_NUM', 
				1  => 'm.MAND_NUM_INFO',
				2  => 't.ECRI_LIB', 
				3  => 'm.MAND_OBJET',
				4  => 'm.MAND_DATE_RECUP', 
				5  => 'm.MAND_MONTANT1'
			);
		} else {
			$toColumns = array( 
				0  => 'm.ECRI_NUM', 
				1  => 'm.MAND_NUM_INFO',
				2  => 'm.REJET_NOTE', 
				3  => 'm.MAND_DT_RJT',
				4  => 'm.MAND_OBJET',
				5  => 'm.MAND_DATE_RECUP', 
				6  => 'm.MAND_MONTANT1'
			);
		}

		/*
		echo "<pre>";
		print_r ($oRequest);
		echo "</pre>";*/

		$zSql = "SELECT * FROM (";

		$zSql .= "	select ROW_NUMBER() OVER (ORDER BY m.MAND_NUM_INFO ASC) AS r__,
						COUNT(*) OVER () AS found_rows,t.*,m.soa,m.compte,m.commune,m.ID_MAND,REJET_NOTE,MAND_DT_RJT,
					(SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE m.ASSIGNATAIRE=pc.PSTP_CODE) as ASSIGNATAIRE,
				    (SELECT PSTP_LIBELLE FROM T_POSTE_COMPTABLE pc WHERE m.MANDATAIRE=pc.PSTP_CODE) as MANDATAIRE,
					m.MAND_VISA_TEF,
					m.MAND_NUM_INFO,  
					m.MAND_OBJET,
					m.MAND_DATE_RECUP,
					m.MAND_DATE_REEL_VISA,
					CASE
					WHEN m.MAND_MODE_PAIE = 'VB' THEN 'Virement bancaire'
					WHEN m.MAND_MODE_PAIE = 'OO' THEN 'Opération d`ordre'
					WHEN m.MAND_MODE_PAIE = 'BC' THEN 'Bon de Caisse'
					WHEN m.MAND_MODE_PAIE = 'OP' THEN 'Ordre de paiement'
					END MAND_MODE_PAIE,
					CONCAT (TO_CHAR(MAND_MONTANT,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS MAND_MONTANT1

		from T_ECRITURE t,T_MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM " ;

		if( isset($oRequest['zPsCode']) &&  $oRequest['zPsCode']!="") {   
			$zSql.=" AND m.ENTITE = '".$oRequest['zPsCode']."'  ";
		}

		if( isset($oRequest['MAND_VISA_VALIDE']) &&  $oRequest['MAND_VISA_VALIDE']!="") {   
			$zSql.=" AND m.MAND_VISA_VALIDE = ".$oRequest['MAND_VISA_VALIDE']."  ";
		}
		
		if( !empty($oRequest['search']['value']) ) {   
			$zSql.=" AND ( t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_REF LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  m.MAND_OBJET LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.PROP_CODE LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  t.ECRI_LIB LIKE '%".$oRequest['search']['value']."%'  ";
			$zSql.=" OR  m.MAND_MODE_PAIE LIKE '%".$oRequest['search']['value']."%' ) ";
		}
		
		$zDebut = 0;
		$zFin = 10;
		if (sizeof($oRequest)>0){
			
			if (isset($toColumns[$oRequest['order'][0]['column']]) && isset($oRequest['order'][0]['dir'])){
				$zSql.=" ORDER BY ". $toColumns[$oRequest['order'][0]['column']]."   ".$oRequest['order'][0]['dir']."    ";
			} else {
				$zSql.=" ORDER BY t.ECRI_NUM ASC ";
			}

			$zDebut = (int)$oRequest['start'] ;
			$zFin =  (int)$oRequest['start']+(int)$oRequest['length'];
		} else {
			$zSql.=" ORDER BY t.ECRI_NUM ASC ";
		}


		$zSql .= " ) niv1 WHERE r__ BETWEEN ".$zDebut." AND ".$zFin." " ;

		//$zSql .= " WHERE r between ".$zDebut." and ".$zFin."";
		//echo $zSql;
		//die();

		//set_time_limit(200000000000);

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result_array();

		$toError = $this->db->error();

		/*
		echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		//$_iNbrTotal = 0;

		if(sizeof($toRow)>0){
			$_iNbrTotal = $toRow[0]['FOUND_ROWS'] ;
		}

		return $toRow;

	}

	/** 
	* function permettant d'afficher de détail d'un dossier
	*
	* @param integer $_iEcriNum : Ecriture numéro
	* @param integer $_iNumMandat : numéro de mandant
	* @param integer $_iMode : Mode de paiement
	*
	* @return liste en tableau d'objet
	*/
	public function GetDetail($_iTypeAfficheSearch, $_id, $_iNumMandat, $_iAnneeExercice='2024'){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		switch ($_iTypeAfficheSearch){
			case 1:
				
				$zWhere = " AND dtl.INFONUMERO =  '" . $_iNumMandat . "'";
				$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/compteVirement.sql"); 
				
				break;
				
			case 2:


				$zWhere = " AND t.ID =  " . $_id;
				//$zColonne = " * ";

				$zColonne = "	ROW_NUMBER() OVER (ORDER BY virement.DMDVIRDATEVALID ASC) AS r__,
						COUNT(*) OVER () AS found_rows,c.denomination,t.code_tiers,c.ville,
						t.ID,CONCAT (TO_CHAR(t.montant,'FM999G999G999G999D00' , 'NLS_NUMERIC_CHARACTERS = '', '' '), ' Ar') AS montant,t.compte_tiers,
						d.objet,d.date_dossier,d.peri_exercice,
						tt.titulaire,
						p.*,virement.* "; 

				$zData = @file_get_contents(APPLICATION_PATH ."sql/situation/46_virement.sql"); 
				$zData = str_replace("%COLUMN%", trim($zColonne), $zData) ; 
		
				break;
		}
		
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zData = str_replace("%ANNEE%", trim($_iAnneeExercice), $zData) ; 
		$zData = str_replace("%OTHERWHERE%", '', $zData) ; 
		$zData = str_replace("%DEBUT%", 0, $zData) ; 
		$zSql = str_replace("%FIN%", 1, $zData) ; 

		//echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}

	/** 
	* function permettant d'afficher de détail d'un dossier
	*
	* @param integer $_iEcriNum : Ecriture numéro
	*
	* @return liste en tableau d'objet
	*/
	public function GetDetailViews($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select * from SUIVI_MDT WHERE  M.ECRI_NUM = " . $_iEcriNum;
		echo $zSql;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}
	
	/** 
	* function permettant d'afficher le detail d'un transfert
	*
	* @param integer $_iNumMandat : numéro du mandat
	*
	* @return liste en tableau d'objet
	*/
	public function GetTransfert($_iNumMandat, $_iAnnee="2024"){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);


		$zData = @file_get_contents(APPLICATION_PATH ."sql/transfert/transfert_detail.sql"); 
		$zData = str_replace("%WHERE%", trim($zWhere), $zData) ; 
		$zSql = str_replace("%ANNEE%", trim($_iAnnee), $zData) ; 

		$zSql .= "  AND T.MAND_NUM_INFO = '" . $_iNumMandat . "'";

		//echo $zSql;
		//die();

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->row();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}


	

	/** 
	* function permettant d'afficher le detail d'un LEGEcriture
	*
	* @param integer $_iNumMandat : numéro du mandat
	*
	* @return liste en tableau d'objet
	*/
	public function GetLEGecriture($_iEcriNum){

		global $db;

		//error_reporting(E_ALL);

		$toRow = array();

		$toDB = $this->load->database('catia',true);

		$zSql = "select COUNT(*) over () found_rows,m.* from TESTSOI.T_ECRITURE t,T_LGECRITURE m WHERE t.ECRI_NUM = m.ECRI_NUM AND t.ECRI_NUM = " . $_iEcriNum;

		$zQuery = $toDB->query($zSql);
		$toRow = $zQuery->result();

		/*echo "<pre>";
		print_r ($toRow);
		echo "</pre>";*/

		return $toRow;
	}
}