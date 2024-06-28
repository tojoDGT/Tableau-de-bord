<?php 

global $oSmarty ; 
global $oDataUser ;
global $toParametre;
global $toExportOta ;

$toInstitution = array(1);
$toProduit = array(2);
$toCommune = array(3);
$toInfos = array(4);
$toMenuCommuneInfos = array(6);
$toMenuParaInfos = array(5);
$toMenuZone = array(7);
$toMenuContenu = array(8);
$toStat = array(9);
$toMenuOta = array(10);

$oSmarty->assign("toInstitution", $toInstitution);
$oSmarty->assign("toProduit", $toProduit);
$oSmarty->assign("toCommune", $toCommune);
$oSmarty->assign("toInfos", $toInfos);
$oSmarty->assign("toParametre", $toParametre);
$oSmarty->assign("toExportOta", $toExportOta);
$oSmarty->assign("toMenuCommuneInfos", $toMenuCommuneInfos);
$oSmarty->assign("toMenuOta", $toMenuOta);
$oSmarty->assign("toMenuZone", $toMenuZone);
$oSmarty->assign("toMenuParaInfos", $toMenuParaInfos);
$oSmarty->assign("toMenuContenu", $toMenuContenu);
$oSmarty->assign("toStat", $toStat);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/colonne_gauche.tpl" );


?>