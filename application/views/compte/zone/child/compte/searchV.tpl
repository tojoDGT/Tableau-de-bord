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
										<td class="middle" width="10">Année Exercice:</td>
										<td class="noBottom">
											<select class="form-control" id="ECRI_EXERCICE" name="ECRI_EXERCICE">
													<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
													<option {if $iAnneeExercice=='2024'}selected="selected"{/if} value="2024">2024</option>
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
												{foreach from=$toGetListePc item=$oGetListePc}
												<option value="{$oGetListePc.PSTP_CODE}">{$oGetListePc.PSTP_LIBELLE}</option>
												{/foreach}
											</select>
										</td>
									</tr>
									<tr>
										<td class="middle" width="10">Compte num : </td>
										<td class="noBottom">
											<input style="font-size:13px" placeholder="Veuillez rechercher un compte" type="text" id="COMPTE_NUM" name="COMPTE_NUM">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-4" style="display:inline-flex">
							<table class="table tableRond table-top-countries">
								<tbody>
									<tr>
										<td class="middle" width="10">Sens : </td>
										<td class="noBottom">
											<select class="form-control" id="SENS" name="SENS">
												<option value="">Tous</option>
												<option value="D">DEBITEUR</option>
												<option value="C">CREDITEUR</option>	
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