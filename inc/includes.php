<?php

include ('path.php') ;
$zSmarty = @file_get_contents(APPLICATION_PATH ."assets/common/smarty.libs.php"); 
// Utilisation de Smarty
require_once( ADMIN_SMARTY_PATH . "smarty.init.php" );

// Appel de la classe smarty
$oSmarty = new SmartyBC();
$zFilePath = $zSmartySplit . $zSmartyConcat ; 
// Définition du répertoire de cache
$oSmarty->compile_dir		=	"compiled";
define ($zSmarty, $zFilePath) ;


?>