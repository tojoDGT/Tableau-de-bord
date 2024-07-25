<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class MY_Controller extends CI_Controller 
{
	function __construct()
		{
			parent:: __construct();

			define('NB_PER_PAGE',10);


		}


	function load_my_view($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);


			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);


		}


	function load_my_view_affichage($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);
			
			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);

		}



	function load_my_view_ajout($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);
			

			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);

		}

	function load_my_view_fiche($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);
			

			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);

		}

	function load_my_view_search($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);


			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);


		}

	function load_my_view_img($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."offre/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."offre/pages/footer.page.php");
			$oSmarty->assign('zContenu', ADMIN_TEMPLATE_PATH ."offre/pages/contenu.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."offre/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);
			
			

			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);

		}

	function load_my_view_accueil($_oData, $_zPage)
		{
			global $oSmarty;

			$oSmarty->assign('zHeader', ADMIN_TEMPLATE_PATH ."accueil/pages/header.page.php");
			$oSmarty->assign('zFooter', ADMIN_TEMPLATE_PATH ."accueil/pages/footer.page.php");
			$oSmarty->assign('zLeft', ADMIN_TEMPLATE_PATH ."accueil/pages/left.page.php");
			$oSmarty->assign('oData', $_oData);


			$oSmarty->display(ADMIN_TEMPLATE_PATH.$_zPage);


		}
		

	function date_en_to_fr($date_to_convert, $separator_en, $separtor_fr){
		if($date_to_convert && isset($date_to_convert)){
			$tab = explode($separator_en, $date_to_convert);
			if (count($tab) == 3) {
				$res = $tab[2] . $separtor_fr . $tab[1] . $separtor_fr . $tab[0];
				return $res;
			}
		}
		return $date_to_convert;
	}

	function date_fr_to_en($date_to_convert, $separator_fr, $separtor_en){
		if($date_to_convert && isset($date_to_convert)){
			$tab = explode($separator_fr, $date_to_convert);
			if (count($tab) == 3) {
				$res = $tab[2] . $separtor_en . $tab[1] . $separtor_en . $tab[0];
				return $res;
			}
		}
		return $date_to_convert;
	}

	 /** 
	* Modif Îles aux trésors 
	* redimensionnement et deplacement d'une image
	*
	* @param string $_sImagePath chemin d'origine
	* @param int $_sImageResPath chemin de la redemensionnement
	* @param string $_sImageResPath chemin de la redemensionnement
	* @param int $_iMaxWidth maximum taille de l'image
	* @param int $_iMaxHeight minimum taille de l'image
	* @return 
	*/
    function resizePicture ($_sImagePath, $_sImageResPath, $_iMaxWidth = 0, $_iMaxHeight = 0,$_zLocalisation)
    {

        $zPath = str_replace ("CNFI","DSE",PATH_ROOT_DIR);
		$_sImageResPath = $_zLocalisation. $_sImageResPath ; 
		
		@ini_set ("memory_limit", -1) ;

        $tsImageInfos = getimagesize ($_sImagePath) ;

        $sImageMimeType = $tsImageInfos["mime"] ;
        $tsTokens = explode ("/", $sImageMimeType) ;
        $sImageType = strtoupper (trim ($tsTokens[1])) ;

        $createImageFromXXX = "imageCreateFrom" . $sImageType ;
        $imageXXX = "image" . $sImageType ;

        $oImgSrc = $createImageFromXXX ($_sImagePath) ;
        $iWidth = $tsImageInfos[0] ;
        $iHeight = $tsImageInfos[1] ;
        $iOrigWidth = $iWidth ;
        $iOrigHeight = $iHeight ;

        if (($iWidth < $_iMaxWidth) && ($iHeight < $_iMaxHeight))
        {
            @copy ($_sImagePath, $_sImageResPath) ;
        }
        elseif (($iWidth >= $_iMaxWidth) && ($iHeight >= $_iMaxHeight))
        {

            $rRatioWidth = $_iMaxWidth / $iWidth ;
            $rRationHeight = $_iMaxHeight / $iHeight ;

            $rRatio = ($rRatioWidth < $rRationHeight)  ? $rRatioWidth : $rRationHeight ;

            $iWidth = ceil ($iWidth * $rRatio) ;
            $iHeight = ceil ($iHeight * $rRatio) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        elseif ($iWidth >= $_iMaxWidth)
        {
            
            $rRatioWidth = $_iMaxWidth / $iWidth ;

            $iWidth = ceil ($iWidth * $rRatioWidth) ;
            $iHeight = ceil ($iHeight * $rRatioWidth) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        else
        {
            
            $rRationHeight = $_iMaxHeight / $iHeight ;
            
            $iWidth = ceil ($iWidth * $rRationHeight) ;
            $iHeight = ceil ($iHeight * $rRationHeight) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        
        @chmod ($_sImageResPath, 0666) ;

    }


	/** 
	* importation commune
	*
	* @return view
	*/
	private function importCommune(){

		require(APPLICATION_PATH ."/Classes/PHPExcel.php");

		error_reporting(E_ALL);
		ini_set('display_errors', TRUE);
		ini_set('display_startup_errors', TRUE);
		date_default_timezone_set('Europe/London');

		define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');

		$oPhpExcel = new PHPExcel();
	
		$zFileInput = APPLICATION_PATH . '/Classes/commune.xls';

		$iTypeFile = PHPExcel_IOFactory::identify($zFileInput);
		$oReader = PHPExcel_IOFactory::createReader($iTypeFile);

		$oPhpExcel = $oReader->load($zFileInput);
	
		$oSheet = $oPhpExcel->getSheet(3); 
		$iLongeurExcel = $oSheet->getHighestRow(); 
		$iLongeurColonne = $oSheet->getHighestColumn();

		for ($iBoucle = 1; $iBoucle <= $iLongeurExcel; $iBoucle++){ 
			
			$toBoucleData = $oSheet->rangeToArray('A' . $iBoucle . ':' . $iLongeurColonne . $iBoucle,
											NULL,
											TRUE,
											FALSE);
			if ($iBoucle > 1359) {
					$toBoucleData1 = $toBoucleData[0];

					$oInsert = array();
					$oInsert['commune_provinceId'] = $toBoucleData1[0];
					$oInsert['commune_regionId'] = $toBoucleData1[1];
					$oInsert['commune_districtId'] = $toBoucleData1[2];
					$oInsert['commune_commune'] = $toBoucleData1[3];
					
					$this->cnfi->insertCommune($oInsert);
			}
		}

		echo "1";
	}


	function postGetValue ($_zName, $_iDefValue = null)
	{
		$zRes = $_iDefValue ;

		if (isset ($_POST [$_zName]))
		{
			$zRes = (!is_array ($_POST [$_zName])) ? trim ($_POST [$_zName]) : $_POST [$_zName] ;
		}
		else if (isset ($_GET [$_zName]))
		{
			 $zRes = (!is_array ($_GET [$_zName])) ? trim ($_GET [$_zName]) : $_GET [$_zName] ;
		}

		return $zRes ;
	}


	public function updateData($_sDatabase,$_sTable,$_oWhere, $_oDataToUpdate) {
		
 		$bdd = $this->load->database($_sDatabase, TRUE);
		$bdd->where($_oWhere);
		return	$bdd->update($_sTable, $_oDataToUpdate);    
		// echo $bdd->last_query();  
 	}

	/* Modif Îles aux trésors 
	 redimensionnement et deplacement d'une image
	*/
    function resizePictureRC ($_sImagePath, $_sImageResPath, $_iMaxWidth = 0, $_iMaxHeight = 0)
    {

        
		//$_sImageResPath = $_sImagePath . $_sImageResPath ; 
		
		@ini_set ("memory_limit", -1) ;

        $tsImageInfos = getimagesize ($_sImagePath) ;

        $sImageMimeType = $tsImageInfos["mime"] ;
        $tsTokens = explode ("/", $sImageMimeType) ;
        $sImageType = strtoupper (trim ($tsTokens[1])) ;

        $createImageFromXXX = "imageCreateFrom" . $sImageType ;
        $imageXXX = "image" . $sImageType ;

        $oImgSrc = $createImageFromXXX ($_sImagePath) ;
        $iWidth = $tsImageInfos[0] ;
        $iHeight = $tsImageInfos[1] ;
        $iOrigWidth = $iWidth ;
        $iOrigHeight = $iHeight ;

        if (($iWidth < $_iMaxWidth) && ($iHeight < $_iMaxHeight))
        {
            @copy ($_sImagePath, $_sImageResPath) ;
        }
        elseif (($iWidth >= $_iMaxWidth) && ($iHeight >= $_iMaxHeight))
        {

            $rRatioWidth = $_iMaxWidth / $iWidth ;
            $rRationHeight = $_iMaxHeight / $iHeight ;

            $rRatio = ($rRatioWidth < $rRationHeight)  ? $rRatioWidth : $rRationHeight ;

            $iWidth = ceil ($iWidth * $rRatio) ;
            $iHeight = ceil ($iHeight * $rRatio) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        elseif ($iWidth >= $_iMaxWidth)
        {
            
            $rRatioWidth = $_iMaxWidth / $iWidth ;

            $iWidth = ceil ($iWidth * $rRatioWidth) ;
            $iHeight = ceil ($iHeight * $rRatioWidth) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        else
        {
            
            $rRationHeight = $_iMaxHeight / $iHeight ;
            
            $iWidth = ceil ($iWidth * $rRationHeight) ;
            $iHeight = ceil ($iHeight * $rRationHeight) ;

            $oNewImg = imageCreateTrueColor ($iWidth, $iHeight) ;
            imageCopyResampled ($oNewImg, $oImgSrc, 0, 0, 0, 0, $iWidth, $iHeight, $iOrigWidth, $iOrigHeight) ;
            $imageXXX ($oNewImg, $_sImageResPath) ;

        }
        
        @chmod ($_sImageResPath, 0666) ;

    }


}