<link rel="stylesheet" type="text/css" href="{$zBasePath}assets/css/select2.css">
<script type="text/javascript" src="{$zBasePath}assets/js/select2.js"></script>
<script src="{$zBasePath}assets/js/datedropper-javascript.js"></script>
<script src="{$zBasePath}assets/js/datedropper-javascript-lang-FR.js"></script>
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
						<input type="hidden" id="zDate" name="zDate" value="{$zDate}">
						<input type="hidden" id="zDateLast" name="zDateLast" value="{$zDateLast}">
						<div class="col-md-12" style="display:inline-flex">
							<div class="col-md-5" style="display:inline-flex">
							</div>
							<div class="col-md-3 OnProgress" style="display:none;color:white">
									<div class="texteProgress">Téléchargement, veuillez patienter.....</div>
									<div class="progress">
										
										<div class="progress-bar" id="progressBar"></div>
									</div>
							</div>			
						</div>
						<div class="col-md-4" style="display:inline-flex">
						<table class="table tableRond table-top-countries">
							<tbody>
								
						    	<tr>
									<td class="middle" width="10">PC Payeur : </td>
									<td class="noBottom">
										<select class="form-control" id="PCPAYEUR" name="PCPAYEUR">
										<option selected="selected" value="">Tous</option>
											{foreach from=$toGetListePcPayeur item=$oGetListePcPayeur}
											<option value="{$oGetListePcPayeur.PSTP_CODE}">{$oGetListePcPayeur.PSTP_LIBELLE}</option>
											{/foreach}
										</select>
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">PC Assignataire: </td>
									<td class="noBottom">
										<select class="form-control" id="PCASSIGNATAIRE" name="PCASSIGNATAIRE">
											<option selected="selected" value="">Tous</option>
											{foreach from=$toGetListePcAssignataire item=$oGetListePcAssignataire}
											<option value="{$oGetListePcAssignataire.PSTP_CODE}">{$oGetListePcAssignataire.PSTP_LIBELLE}</option>
											{/foreach}
										</select>
									</td>
								</tr>
								<tr>
										<td class="middle" width="10">DENOMINATION : </td>
										<td class="noBottom">
											<select class="form-control" id="SIGLE" name="SIGLE">
												<option value="">Tous</option>
												{foreach from=$toGetListeSigle item=$oGetListeSigle}
												<option value="{$oGetListeSigle.DENOMINATION}">{$oGetListeSigle.DENOMINATION}</option>
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
									<td class="middle" width="10">Catégorie dépense : </td>
									<td class="noBottom">
										<select class="form-control" id="CATEG_DEPENSE" name="CATEG_DEPENSE">
												<option selected="selected" value="">Tous</option>
												<option value="DEPENSE OBLIGATOIRE">DEPENSE OBLIGATOIRE</option>
												<option value="DEPENSE AUTORISEE">DEPENSE AUTORISEE</option>
												<option value="DEPENSE">DEPENSE</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">STATUT : </td>
									<td class="noBottom">
										<select class="form-control" id="STATUS" name="STATUS">
											<option selected="selected" value="">Tous</option>
											{foreach from=$toGetStatutVirement item=$oGetStatutVirement}
											<option value="{$oGetStatutVirement.NOTESTATUSLIBELLE}">{$oGetStatutVirement.NOTESTATUSLIBELLE}</option>
											{/foreach}
										</select>
									</td>
								</tr>
								<tr>	
									<td colspan="2" class="noBottom">
											<div id="changeDate" style="display:inline-flex" class="col-sm-10">
												<div class="col-sm-6">
													<div class="form-group">
														<label>Date demande de virement valide</label>
														<div class="cal-icon"><input type="text" name="date_debut" id="date_debut" data-dd-opt-format="dd/mm/y" data-dd-opt-default-date="{$zDate}" data-dd-opt-double-view="true" autocomplete="off" value="" placeholder="du..." class="form-control datedropper-range-fiche" data-dd-opt-range-start="{$zDate}" data-dd-opt-range-end="{$zDateDemain}"></div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label>&nbsp;</label>
														<div class="cal-icon"><input type="text" name="date_fin" id="date_fin" data-dd-opt-format="dd/mm/y" data-dd-opt-default-date="{$zDateDemain}" autocomplete="off" value="" placeholder="au..." class="form-control datedropper-range-fiche"  data-dd-opt-range-start="{$zDate}" data-dd-opt-range-end="{$zDateDemain}"></div>
													</div>
												</div>
												<input type="button" class="viderDate changerCol btn btn-info" style="height:40px;margin-top:28px;" value="vider les dates" autocomplete="off">
											</div>
											
									</td>
								</tr>
							</tbody>
						</table>
						</div>

						<div class="col-md-4" style="display:inline-flex;max-width:32%">
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
										<select class="form-control" id="PERI_EXERCICE" name="PERI_EXERCICE" onChange="changeDate(this.value);">
												<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
												<option {if $iAnneeExercice=='2024'}selected="selected"{else}selected="selected"{/if} value="2024">2024</option>
										</select>
									</td>
								</tr>
								
								
							</tbody>
						</table>
						</div>
						<div style="text-align: center;"> 
							<input type="button" class="searchTb partielSearchHeader partielSearchHeader1" value="Rechercher" autocomplete="off">
						</div>
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

function changeDate(_iAnnee){
	$('#date_debut').val('');
	$('#date_fin').val('');
	$("#date_debut").attr("data-dd-opt-default-date",_iAnnee+"/"+$("#zDateLast").val());
	$("#date_debut").attr("data-dd-opt-range-start",_iAnnee+"/"+$("#zDateLast").val());
	$("#date_debut").attr("data-dd-opt-range-end",_iAnnee+"/"+$("#zDateLast").val());

	$("#date_fin").attr("data-dd-opt-default-date",_iAnnee+"/"+$("#zDateLast").val());
	$("#date_fin").attr("data-dd-opt-range-start",_iAnnee+"/"+$("#zDateLast").val());
	$("#date_fin").attr("data-dd-opt-range-end",_iAnnee+"/"+$("#zDateLast").val());

	new dateDropper({ 
		selector: '.datedropper-range-fiche', 
		range: true, 
		format : 'dd/mm/y',
		lang : 'fr',
		defaultDate: true,
		doubleView: true
	})
}
$(document).ready(function() {
	    
	new dateDropper({ 
		selector: '.datedropper-range-fiche', 
		range: true, 
		format : 'dd/mm/y',
		lang : 'fr',
		defaultDate: true,
		doubleView: true
	})

	$(".searchTb").on("click", function(){
		$('#table_bd').DataTable().ajax.reload();
	})

	$(".viderDate").on("click", function(){
		$('#date_debut').val('');
		$('#date_fin').val('');
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