<?php 


global $oSmarty ; 
global $oDataUser ;

$oSmarty->assign("oSession",$_SESSION);
$oSmarty->assign("zBasePath",base_url());
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/header.tpl" );


?>