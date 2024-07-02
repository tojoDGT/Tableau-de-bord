<?php 

global $oSmarty ; 
global $oDataUser ;

$oDataTempCol = array();;
if(isset($_SESSION["colonneAffiche"])){
	$toColonne = unserialize($_SESSION["colonneAffiche"]);
	
	foreach ($toColonne as $oColonne){
		$oColonne = explode(".", $oColonne);
		array_push($oDataTempCol, $oColonne[1]);
	}
}

$oSmarty->assign('oDataTempCol',  $oDataTempCol);
$oSmarty->assign('zReturnUrl',  $_SERVER['PHP_SELF']);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/footer.tpl" );


?>