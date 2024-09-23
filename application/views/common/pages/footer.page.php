<?php 

global $oSmarty ; 
global $oDataUser ;

$oDataTempCol = array();

switch ($oDataUser['zParam']){

	case 'op_46':
		$toColonne = unserialize($_SESSION["colonneAfficheOP46"]);
		break;

	case 'compte-virement':
		$toColonne = unserialize($_SESSION["colonneAfficheVirement"]);
		break;

	default:
		$toColonne = unserialize($_SESSION["colonneAffiche"]);
		break;
}

foreach ($toColonne as $oColonne){
	$oColonne = explode("-", $oColonne);
	array_push($oDataTempCol, $oColonne[1]);
}

$oSmarty->assign('zParam',  $oDataUser['zParam']);
$oSmarty->assign('oDataTempCol',  $oDataTempCol);
$oSmarty->assign('zReturnUrl',  $_SERVER['PHP_SELF']);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/footer.tpl" );


?>