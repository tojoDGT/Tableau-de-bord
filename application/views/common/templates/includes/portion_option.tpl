{if $iType==1}
<option value="0">s&eacute;l&eacute;ctionner une région</option>
{/if}
{if $iType==2}
<option value="0">s&eacute;l&eacute;ctionner un district</option>
{/if}
{if $iType==3}
<option value="0">s&eacute;l&eacute;ctionner un departement</option>
{/if}
{if $iType==4}
<option value="0">s&eacute;l&eacute;ctionner une direction</option>
{/if}
{if $iType==5}
<option value="0">s&eacute;l&eacute;ctionner un service</option>
{/if}
{if $iType==6}
<option value="0">s&eacute;l&eacute;ctionner une division</option>
{/if}
{foreach from=$toListe item=oListe }
<option value="{$oListe.id}">{$oListe.libele}</option>
{/foreach}
