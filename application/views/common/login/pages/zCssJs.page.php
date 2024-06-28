<?php 


global $oSmarty ; 
global $oDataUser ;

$zTitle = "";

if (isset($oDataUser['zTitle'])){
	$zTitle = $oDataUser['zTitle'];
}

$oRowUserTheme = $oDataUser['oRowUserTheme'];
$oSmarty->assign('zTitle', $zTitle); 
$oSmarty->assign('oRowUserTheme', $oRowUserTheme); 



$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/login/templates/includes/zCssJs.tpl" );


?>