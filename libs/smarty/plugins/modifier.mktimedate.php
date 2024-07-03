<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty plugin
 *
 * Type:     modifier<br>
 * Name:     nl2br<br>
 * Date:     Feb 26, 2003
 * Purpose:  convert \r\n, \r or \n to <<br>>
 * Input:<br>
 *         - contents = contents to replace
 *         - preceed_test = if true, includes preceeding break tags
 *           in replacement
 * Example:  {$text|nl2br}
 * @link http://smarty.php.net/manual/en/language.modifier.nl2br.php
 *          nl2br (Smarty online manual)
 * @version  1.0
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @return string
 */
function smarty_modifier_mktimedate($_zDate)
{
	$iJour = substr($_zDate,0,2); // on récupère le jour 
	$iMois = substr($_zDate,3,2); // puis le mois 
	$iAnnee = substr($_zDate,6,4); // et l'annee 
	
	
	$zHeure = substr($_zDate,11,2); // et l'HEURE 
	$iMinute = substr($_zDate,14,2); // et MINUTES 
	$iSeconde = substr($_zDate,17,2); // et MINUTES 

	//echo $iJour . "/" . $iMois . "/" . $iAnnee . "  $zHeure : $iMinute :  $iSeconde";
	$iTimestamp = mktime($zHeure,$iMinute,$iSeconde,$iMois,$iJour,$iAnnee); 

	return $iTimestamp;
}

/* vim: set expandtab: */

?>
