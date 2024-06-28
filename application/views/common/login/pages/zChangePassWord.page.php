<?php 


global $oSmarty ; 
global $oData;

$version = '?2017V3';

$zMatricule = "";
$zNomEdit = "";
$zPrenomEdit = "";
$zLoginEdit = "";
$zCinEdit = "";
$zSexeEdit = "";
$zStatutEdit = "";
$bNew = false;
$bOld = false;
$zPassWordEdit = "";
$zConfirmPassWordEdit = "";
if(isset($oData['type'])){
	if($oData['type'] == 1)
		$bNew = true;
	if($oData['type'] == 2)
		$bOld = true;
}
if(isset($oData['im']))
	$zMatricule = $oData['im'];
if(isset($oData['nom']))
	$zNomEdit = $oData['nom'];
if(isset($oData['prenom']))
	$zPrenomEdit = $oData['prenom'];
if(isset($oData['phone']))
	$zPhoneEdit = $oData['phone'];
if(isset($oData['cin']))
	$zCinEdit = $oData['cin'];
if(isset($oData['sexe']))
	$zSexeEdit = $oData['sexe'];
if(isset($oData['statut_user']))
	$zStatutEdit = $oData['statut_user'];

$oSmarty->assign("zMatricule",$zMatricule);
$oSmarty->assign("zNomEdit",$zNomEdit);
$oSmarty->assign("zPrenomEdit",$zPrenomEdit);
$oSmarty->assign("zCinEdit",$zCinEdit);
$oSmarty->assign("zPhoneEdit",$zPhoneEdit);
$oSmarty->assign("zSexeEdit",$zSexeEdit);
$oSmarty->assign("zStatutEdit",$zStatutEdit);
$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/login/templates/includes/zChangePassWord.tpl" );


?>