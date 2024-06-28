<?php 

global $oSmarty ; 
global $oDataUser ;

$iNotification = $oDataUser['iNotification'];
$iNotificationDecision = $oDataUser['iNotificationDecision'];
$iNotificationConge = $oDataUser['iNotificationConge'];
$iNotificationAbscence = $oDataUser['iNotificationAbscence'];
$iNotificationPermission = $oDataUser['iNotificationPermission'];
$iNotificationAffiche = $oDataUser['iNotificationAffiche'];

$toReclassement = $oDataUser['toReclassement'];

$iNotificationCarte = "";
if (isset($oDataUser['iNotificationCarte'])){
	$iNotificationCarte = $oDataUser['iNotificationCarte'];
}

$iNotificationReposMedical = "";
if (isset($oDataUser['iNotificationReposMedical'])){
	$iNotificationReposMedical = $oDataUser['iNotificationReposMedical'];
}

$iSessionCompte = $oDataUser['iSessionCompte'] ; 

$oSmarty->assign('iNotification', $iNotification);
$oSmarty->assign('iNotificationCarte', $iNotificationCarte);
$oSmarty->assign('iNotificationDecision', $iNotificationDecision);
$oSmarty->assign('iNotificationConge', $iNotificationConge);
$oSmarty->assign('iNotificationAbscence', $iNotificationAbscence);
$oSmarty->assign('iNotificationPermission', $iNotificationPermission);
$oSmarty->assign('iNotificationAffiche', $iNotificationAffiche);
$oSmarty->assign('iNotificationReposMedical', $iNotificationReposMedical);
$oSmarty->assign('toReclassement', $toReclassement);
$oSmarty->assign('iSessionCompte', $iSessionCompte);

$oSmarty->display( ADMIN_TEMPLATE_PATH . "common/templates/includes/footer.tpl" );


?>