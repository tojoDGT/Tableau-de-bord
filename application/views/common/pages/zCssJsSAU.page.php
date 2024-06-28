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
$oSmarty->assign('zBasePath',  base_url());
$oSmarty->assign('zClearCache',  date("YmdHis"));
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/zCssJsSAU.tpl" );


?>