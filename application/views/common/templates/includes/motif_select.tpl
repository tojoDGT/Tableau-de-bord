<option value="">S&eacute;l&eacute;ctionner le motif</option>
{foreach from=$toListe item=oListe }
<option {if $oListe.motif_id == $iActif} selected="selected" {/if} value="{$oListe.motif_id}">{$oListe.motif_libelle}</option>
{/foreach}
