<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty lower modifier plugin
 *
 * Type:     modifier<br>
 * Name:     lower<br>
 * Purpose:  convert string to lowercase
 * @link http://smarty.php.net/manual/en/language.modifier.lower.php
 *          lower (Smarty online manual)
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @return string
 */
function smarty_modifier_datecourt($string)
{
    
	$iDate = (int)$string;

	$zDateReturn = "";
	switch ($iDate){

		case 1:
			$zDateReturn = "Janv";
			break;

		case 2:
			$zDateReturn = "Fév";
			break;

		case 3:
			$zDateReturn = "Mars";
			break;

		case 4:
			$zDateReturn = "Avril";
			break;

		case 5:
			$zDateReturn = "Mai";
			break;

		case 6:
			$zDateReturn = "Juin";
			break;

		case 7:
			$zDateReturn = "Juil";
			break;

		case 8:
			$zDateReturn = "Août";
			break;

		case 9:
			$zDateReturn = "Sept";
			break;

		case 10:
			$zDateReturn = "Oct";
			break;

		case 10:
			$zDateReturn = "Nov";
			break;

		case 12:
			$zDateReturn = "Déc";
			break;
	}
	
	return $zDateReturn;
}

?>
