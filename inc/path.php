<?php

define ('APPLICATION_PATH', dirname (__FILE__) . DIRECTORY_SEPARATOR . '../') ;
define ('ADMIN_SMARTY_PATH', dirname (__FILE__) . DIRECTORY_SEPARATOR . '../libs/') ;

$zSmartyConcat = @file_get_contents(APPLICATION_PATH ."assets/common/concat.libs.php"); 
$zSmartySplit = @file_get_contents(APPLICATION_PATH ."assets/common/smartySplit.libs.php"); 

define ('ADMIN_TEMPLATE_PATH', APPLICATION_PATH . 'application/views/') ;

define ('USERNAME_SENDMAIL', 'rohi.drha@gmail.com') ;
define ('PASSWORD_SENDMAIL', 'rohidrha2k18') ;

?>