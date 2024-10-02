<?php 

global $oSmarty ; 
global $oDataUser ;

$oDataTempCol = array();

switch ($oDataUser['zParam']){

	case 'op_46':
		$toColonne = unserialize($_SESSION["colonneAfficheOP46"]);
		$zReturnUrl = BASE_PATH . "dashboard/stat/op_46";
		break;

	case 'compte-virement':
		$toColonne = unserialize($_SESSION["colonneAfficheVirement"]);
		$zReturnUrl = BASE_PATH . "dashboard/stat/compte-virement";
		break;

	default:
		$toColonne = unserialize($_SESSION["colonneAffiche"]);
		$zReturnUrl = BASE_PATH . "dashboard/stat/situation-des-dossiers";
		break;
}

foreach ($toColonne as $oColonne){
	$oColonne = explode("-", $oColonne);
	array_push($oDataTempCol, $oColonne[1]);
}

$oSmarty->assign('zParam',  $oDataUser['zParam']);
$oSmarty->assign('oDataTempCol',  $oDataTempCol);
$oSmarty->assign('zReturnUrl',  $zReturnUrl);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/footer.tpl" );


?>