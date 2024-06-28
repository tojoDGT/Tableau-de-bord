<div class="cell">
	<div class="field">
		{if sizeof($toListe)>0}
		<span style="color:blue;width:90%;padding-top:10px;"  class="label">Num&eacute;ro(s) de " {$zLibelleType} " &agrave; d&eacute;biter :</span>
		<table style="width:90%">
			<thead>
				<tr>
					<th>D&eacute;cision Num&eacute;ro</th>
					<th>D&eacute;but</th>
					<th>Fin</th>
					<th>NOMBRE DE JOUR &agrave; d&eacute;biter</th>
				</tr>
			</thead>
			<tbody>
				{assign var=iIncrement value="0"}
				{foreach from=$toListe item=oListe }
				<tr {if $iIncrement%2 == 0} class="even" {/if}>
					<td>{if $oListe.decision_numero != 0}{$oListe.decision_numero}{/if}</td>
					<td>{$oListe.decision_dateDebut|date_format:"%d/%m/%Y"}</td>
					<td>{$oListe.decision_dateFin|date_format:"%d/%m/%Y"}</td>
					<td style="text-align:center;"><span style="color:red;"><b>{$oListe.reste}</b><span></td>
				</tr>
				{assign var=iIncrement value=$iIncrement+1}
				{/foreach}
			</tbody>
		</table>
		{else}
			<p style="color:red" class="label"><b>Il n'y a pas de " {$zLibelleType} " &agrave; d&eacute;biter</b></p>
		{/if}
	</div>
</div>




{literal}
<script language="text/javascript">

	var iEnvoyerActive = 0;
	$("#iDispo").val({/literal}{$iNombreTotalDispo}{literal});
</script>
{/literal}