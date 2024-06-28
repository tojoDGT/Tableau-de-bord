<?php 


global $oSmarty ; 
global $oDataUser ;

$zTitle = "";

$oSmarty->assign('zTitle', $zTitle); 
$oSmarty->assign('zClearCache', date("YmdHis")); 
$oSmarty->assign('zBasePath',  BASE_PATH);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/zCssJs.tpl" );


?>