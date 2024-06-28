<?php

define('EMAIL_FOR_REPORTS', '');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://');
define('FINISH_ACTION', 'message');
define('FINISH_MESSAGE', 'Thanks for filling out my form!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-solid-blue.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-solid-blue.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:90%;min-width:150px" method="post"><div class="title"><h2>1	Questionnaire de recueil d’informations</h2></div>
	<div class="element-separator"><hr><h3 class="section-break-title">1.1	Présentation du répondant</h3></div>
	<div class="element-radio<?php frmd_add_class("radio"); ?>"><label class="title">1.1.1 Dans quel Département travaillez-vous :</label>		<div class="column column5"><label><input type="radio" name="radio" value="Cabinet" /><span>Cabinet</span></label><label><input type="radio" name="radio" value="DGD" /><span>DGD</span></label><label><input type="radio" name="radio" value="CCPREAS" /><span>CCPREAS</span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio" value="SG" /><span>SG</span></label><label><input type="radio" name="radio" value="DGI" /><span>DGI</span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio" value="DGAI" /><span>DGAI</span></label><label><input type="radio" name="radio" value="DGGFPE" /><span>DGGFPE</span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio" value="DGB" /><span>DGB</span></label><label><input type="radio" name="radio" value="DGCF" /><span>DGCF</span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio" value="DGT" /><span>DGT</span></label><label><input type="radio" name="radio" value="DRARMP" /><span>DRARMP</span></label></div><span class="clearfix"></span>
</div>
	<div class="element-input<?php frmd_add_class("input"); ?>" title="1.1.2	Dans quelle Direction  travaillez-vous ?"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input" placeholder="1.1.2	Dans quelle Direction  travaillez-vous ?"/><span class="icon-place"></span></div></div>
	<div class="element-input<?php frmd_add_class("input3"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input3" placeholder="1.1.3	Dans quel Service  travaillez-vous ?"/><span class="icon-place"></span></div></div>
	<div class="element-input<?php frmd_add_class("input4"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input4" placeholder="1.1.4	Quelle est votre fonction ?	"/><span class="icon-place"></span></div></div>
	<div class="element-radio<?php frmd_add_class("radio1"); ?>"><label class="title">1.1.5	Ancienneté dans le Ministère : </label>		<div class="column column5"><label><input type="radio" name="radio1" value="Moins de 6 ans" /><span>Moins de 6 ans</span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio1" value="De] 6 à 10 ans] " /><span>De] 6 à 10 ans] </span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio1" value="De ]10 à 15 ans] " /><span>De ]10 à 15 ans] </span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio1" value="de ]15 à 20 ans] " /><span>de ]15 à 20 ans] </span></label></div><span class="clearfix"></span>
		<div class="column column5"><label><input type="radio" name="radio1" value="Plus de 20 ans " /><span>Plus de 20 ans </span></label></div><span class="clearfix"></span>
</div>
	<div class="element-radio<?php frmd_add_class("radio2"); ?>"><label class="title">1.1.6	Ancienneté dans la structure  :</label>		<div class="column column4"><label><input type="radio" name="radio2" value="Moins de 3 ans" /><span>Moins de 3 ans</span></label></div><span class="clearfix"></span>
		<div class="column column4"><label><input type="radio" name="radio2" value="De 3 à 6 ans" /><span>De 3 à 6 ans</span></label></div><span class="clearfix"></span>
		<div class="column column4"><label><input type="radio" name="radio2" value="De 6 à 9 ans" /><span>De 6 à 9 ans</span></label></div><span class="clearfix"></span>
		<div class="column column4"><label><input type="radio" name="radio2" value="Plus de 9 ans" /><span>Plus de 9 ans</span></label></div><span class="clearfix"></span>
</div>
<div class="submit"><input type="submit" value="Submit"/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-solid-blue.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>