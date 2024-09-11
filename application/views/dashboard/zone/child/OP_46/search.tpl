<link rel="stylesheet" type="text/css" href="{$zBasePath}assets/css/select2.css">
<script type="text/javascript" src="{$zBasePath}assets/js/select2.js"></script>
{literal}
<style>
	.select2-container {
		width: 378px!important;
	}
	.select2-results li {
		font-size: 13px;
		padding: 10px;
	}
	.select2-container .select2-choice span {
		font-size:16px!important;
		padding:4px!important;
	}
	.select2-search input {
		font-size:16px!important;
	}
</style>
{/literal}
<div class="col-md-12" style="padding:0px">
<div class="searchStatus">
		<div class="au-card au-card--bg-blue ">
			<div class="au-card-inner">
				<div class="table-responsive" style="padding:15px;">
					<form id="sendSearch" name="sendSearch" action="post">
					<input type="hidden" id="iAjax" name="iAjax" value="1">
					<input type="hidden" id="iModeGraph" name="iModeGraph" value="1">
						<div class="col-md-3" style="display:inline-flex">
							<table class="table tableRond table-top-countries">
								<tbody>
									<tr>
										<td class="middle" width="10">Mois:</td>
										<td class="noBottom">
											<select class="form-control" id="PERI_MOIS" name="PERI_MOIS">
													<option selected="selected"value="">TOUS</option>
													<option value="01">Janvier</option>
													<option value="02">Février</option>
													<option value="03">Mars</option>
													<option value="04">Avril</option>
													<option value="05">Mai</option>
													<option value="06">Juin</option>
													<option value="07">Juillet</option>
													<option value="08">Août</option>
													<option value="09">Septembre</option>
													<option value="10">Octobre</option>
													<option value="11">Novembre</option>
													<option value="12">Décembre</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="middle" width="10">Année Exercice:</td>
										<td class="noBottom">
											<select class="form-control" id="PERI_EXERCICE" name="PERI_EXERCICE">
													<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
													<option {if $iAnneeExercice=='2024'}selected="selected"{else}selected="selected"{/if} value="2024">2024</option>
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
										<td class="middle" width="10">Poste Comptable : </td>
										<td class="noBottom">
											<select class="form-control" id="PSTP_CODE" name="PSTP_CODE">
												<option value="">Tous</option>
												{foreach from=$toGetListePstp item=$oGetListePstp}
												<option value="{$oGetListePstp.PSTP_CODE}">{$oGetListePstp.PSTP_LIBELLE}</option>
												{/foreach}
											</select>
										</td>
									</tr>
									<tr>
										<td class="middle" width="10">SIGLE : </td>
										<td class="noBottom">
											<select class="form-control" id="SIGLE" name="SIGLE">
												<option value="">Tous</option>
												{foreach from=$toGetListeSigle item=$oGetListeSigle}
												<option value="{$oGetListeSigle.SIGLE}">{$oGetListeSigle.SIGLE}</option>
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
										<td class="middle" width="10">CATEGORIE : </td>
										<td class="noBottom">
											<select class="form-control" id="CATEG_DEPENSE" name="CATEG_DEPENSE">
													<option selected="selected" value="">Tous</option>
													<option value="DEPENSE">EN DEPENSE</option>
													<option value="-1">EN COURS DE DEPENSE</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="text-align: center;"> <input type="button" class="searchTbNormalite partielSearchHeader partielSearchHeader1" value="Rechercher" autocomplete="off"></div>
						</form>	
				</div>
			</div>
		</div>
	</div>
</div>

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
	    
	$(".searchTbNormalite").on("click", function(){
		$('#table_bd').DataTable().ajax.reload();
	})

	$( ".datepicker" ).datepicker({
		dateFormat: "dd/mm/yy",
		showOtherMonths: true,
		selectOtherMonths: false,

	});

	$("#COMPTE_NUM").select2({
		initSelection: function (element, callback) {
			/*callback({id:'',text:''});*/
		},
		allowClear: true,
		placeholder:"Sélectionnez",
		minimumInputLength: 1,
		multiple:false,
		formatNoMatches: function () { return $("#AucunResultat").val(); },
		formatInputTooShort: function (input, min) { return "Veuillez saisir plus de " + (min - input.length) + " lettres"; },
		formatSelectionTooBig: function (limit) { return "Vous ne pouvez sélectionner que " + limit + " element" + (limit == 1 ? "" : "s"); },
		formatLoadMore: function (pageNumber) { return $("#chargement").val(); },
		formatSearching: function () { return "Recherche..."; },			
		ajax: { 
			url: "{/literal}{$zBasePath}{literal}compte/getCompteSelect2/",
			dataType: 'jsonp',
			data: function (term)
			{
				return {q: term, iFiltre:1};
			},
			results: function (data)
			{
				return {results: data};
			}
		},
		dropdownCssClass: "bigdrop"
	}).select2('val','') ;
})
</script>
{/literal}