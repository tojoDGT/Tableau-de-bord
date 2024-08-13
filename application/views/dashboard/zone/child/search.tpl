{if $iTypeAfficheSearch==1}
<div class="col-md-12" style="padding:0px">
<div class="searchStatus">
		<div class="au-card au-card--bg-blue ">
			<div class="au-card-inner">
				<div class="table-responsive" style="padding:15px;">
					<form id="sendSearch" name="sendSearch" action="post">
					<input type="hidden" id="iAjax" name="iAjax" value="1">
					<input type="hidden" id="iModeGraph" name="iModeGraph" value="1">
						<div class="col-md-4" style="display:inline-flex">
						<table class="table tableRond table-top-countries">
							<tbody>
								<tr>
									<td class="middle" width="10">Année Exercice:</td>
									<td class="noBottom">
										<select class="form-control" id="ECRI_EXERCICE" name="ECRI_EXERCICE">
												<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
												<option {if $iAnneeExercice=='2024'}selected="selected"{else}selected="selected"{/if} value="2024">2024</option>
										</select>
									</td>
								</tr>
						    	<tr>
									<td class="middle" width="10">Titulaire : </td>
									<td class="noBottom">
										<select class="form-control" id="MIN_ABREV" name="MIN_ABREV">
												<option selected="selected" value="">Tous</option>
														{foreach from=$toMinAbrev item=$oMinAbrev}
														<option {if $oMinAbrev.MIN_ABREV=='MEF'}selected="selected"{/if} value="{$oMinAbrev.MIN_ABREV}">{$oMinAbrev.MIN_ABREV}</option>
														{/foreach}
												</select>
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">Type de mandat : </td>
									<td class="noBottom">
										<select class="form-control" id="TYPE_MAND" name="TYPE_MAND">
												<option selected="selected" value="">Tous</option>
														{foreach from=$toTypeMandat item=oTypeMandat}
														<option value="{$oTypeMandat.TYPE_MAND}">{$oTypeMandat.TYPE_MAND}</option>
														{/foreach}
												</select>
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">SOA : </td>
									<td class="noBottom">
										<input type="text" id="SOA" name="SOA" class="form-control">
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="col-md-4" style="display:inline-flex">
							<table class="table tableRond table-top-countries">
							<tbody>
								<tr>
									<td class="middle" width="10">Propriétaire :</td>
									<td class="noBottom">
										<table class="table tableRond table-top-countries">
											
											{assign var=iTest value=0}
											{foreach from=$toGetPropCode item=$oGetPropCode}
											{if $iTest%7==0 && $iTest==0}<tr>{/if}
											{if $iTest%7==0 || $iTest==0}<tr>{/if}
											<td><input type="checkbox" checked="checked" name="PROP_CODE[]" value="{$oGetPropCode.PROP_CODE}" class="form-controla">&nbsp;&nbsp;{$oGetPropCode.PROP_CODE}</td>
											{assign var=iTest value=$iTest+1}
											{/foreach}
											</tr>
										</table>
									</td>
								</tr>
						    	<tr>
									<td class="middle" width="10">Mode de Paiement :</td>
									<td class="noBottom">
										<input type="radio" class="MAND_MODE_PAIE" checked="checked" name="MAND_MODE_PAIE[]" value="">&nbsp;&nbsp;Tous
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE[]" value="VB">&nbsp;&nbsp;Virement bancaire
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE[]" value="OO">&nbsp;&nbsp;Opération d'ordre
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE[]" value="BC">&nbsp;&nbsp;Bon de Caisse
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE[]" value="OP">&nbsp;&nbsp;Ordre de paiement
									</td>
								</tr>
								<tr id="nombreMontant" style="display:none">
									<td class="middle" width="10">Mode d'affichage:</td>
									<td class="noBottom">
										<input type="radio" checked="checked" name="iMode" value="1">&nbsp;&nbsp;Nombre
										<input type="radio" name="iMode" value="2">&nbsp;&nbsp;Montant
									</td>
								</tr>
							</tr>
							</tbody>
						</table>
						</div>
						<div style="text-align: center;"> <input type="button" class="searchTb partielSearchHeader partielSearchHeader1" value="Rechercher" autocomplete="off"></div>
						</form>	
				</div>
			</div>
		</div>
	</div>
</div>
{else}
<div class="col-md-12" style="padding:0px">
<div class="searchStatus">
		<div class="au-card au-card--bg-blue ">
			<div class="au-card-inner">
				<div class="table-responsive" style="padding:15px;">
					<form id="sendSearch" name="sendSearch" action="post">
					<input type="hidden" id="iAjax" name="iAjax" value="1">
					<input type="hidden" id="TYPE_MAND" name="TYPE_MAND" value="REGULARISATION">
					<input type="hidden" id="iModeGraph" name="iModeGraph" value="1">
					<input type="hidden" name="MAND_MODE_PAIE[]" value="OO">
					{foreach from=$toGetPropCode item=$oGetPropCode}
					<input type="hidden" name="PROP_CODE[]" value="{$oGetPropCode.PROP_CODE}">
					{/foreach}
						<div class="col-md-4" style="display:inline-flex">
						<table class="table tableRond table-top-countries">
							<tbody>
								<tr>
									<td class="middle" width="10">Année Exercice:</td>
									<td class="noBottom">
										<select class="form-control" id="ECRI_EXERCICE" name="ECRI_EXERCICE">
												<option selected="selected" value="">Tous</option>
													{foreach from=$toGetAllExercice item=$oGetAllExercice}
													<option value="{$oGetAllExercice.ECRI_EXERCICE}">{$oGetAllExercice.ECRI_EXERCICE}</option>
													{/foreach}
												</select>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="col-md-4" style="display:inline-flex">
							<table class="table tableRond table-top-countries">
							<tbody>
								<tr>
									<td class="middle" width="10">Titulaire : </td>
									<td class="noBottom">
										<select class="form-control" id="MIN_ABREV" name="MIN_ABREV">
												<option selected="selected" value="">Tous</option>
														{foreach from=$toMinAbrev item=$oMinAbrev}
														<option {if $oMinAbrev.MIN_ABREV=='MEF'}selected="selected"{/if} value="{$oMinAbrev.MIN_ABREV}">{$oMinAbrev.MIN_ABREV}</option>
														{/foreach}
												</select>
									</td>
								</tr>
								<tr id="nombreMontant" style="display:none">
									<td class="middle" width="10">Mode d'affichage:</td>
									<td class="noBottom">
										<input type="radio" checked="checked" name="iMode" value="1">&nbsp;&nbsp;Nombre
										<input type="radio" name="iMode" value="2">&nbsp;&nbsp;Montant
									</td>
								</tr>
							</tr>
							</tbody>
						</table>
						</div>
						<div style="text-align: center;"> <input type="button" class="searchTb partielSearchHeader partielSearchHeader1" value="Rechercher" autocomplete="off"></div>
						</form>	
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.table-top-countries tbody td {
    border-bottom: none;
}
</style>
{/if}
<style>
.middle{
	vertical-align:middle!important;
}
input[type=checkbox] {
	margin: 4px 3px 3px 30px;
}
input[type=radio] {
	margin: 4px 3px 3px 30px;
}
</style>
</table>
{literal}
<script>
$(document).ready(function() {
	    
		$("#getListing").on("click", function(){
			$("#nombreMontant").hide();
			$('#table_bd').DataTable().ajax.reload();
		})

		$(".searchTb").on("click", function(){
			
			if($("#getGraph").hasClass( "active" )){
				$("#nombreMontant").hide();
				$("#getGraph").click();
			}else if($("#getStatGLobal").hasClass( "active" )){
				$("#nombreMontant").show();
				$("#getStatGLobal").click();
			}else {
				$("#nombreMontant").hide();
				$('#table_bd').DataTable().ajax.reload();
			}
		})
})
</script>
{/literal}