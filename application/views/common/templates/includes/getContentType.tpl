{foreach from=$toListe item=oListe }
{if $oListe.type_dureeMax != ""}
<u>Dur&eacute;e Maximale :</u><br/>
{$oListe.type_dureeMax|nl2br}<br/><br/>
{/if}
{if $oListe.type_modalite != ""}
<u>Modalit&eacute;s :</u><br/>
{$oListe.type_modalite|nl2br}<br/><br/>
{/if}
{if $oListe.type_pieceAFournir != ""}
<u>Pi&egrave;ces &agrave; fournir :</u><br/>
{$oListe.type_pieceAFournir|nl2br}<br/><br/>
{/if}
{if $oListe.type_dureeTraitement != ""}
<u>Dur&eacute;e de traitement :</u><br/>
{$oListe.type_dureeTraitement|nl2br}<br/>
{/if}
{/foreach}
