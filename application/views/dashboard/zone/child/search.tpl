{if $iTypeAfficheSearch==1}
<div class="col-md-12" style="padding:0px">
<div class="searchStatus">
		<div class="au-card au-card--bg-blue ">
			<div class="au-card-inner">
				<div class="table-responsive" style="padding:15px;">
					<form id="sendSearch" name="sendSearch" target="_blank" method="post" action="{$zBasePath}dashboard/stat/export-des-dossiers">
					<input type="hidden" id="iAjax" name="iAjax" value="1">
					<input type="hidden" id="iDepart" name="iDepart" value="1">
					<input type="hidden" id="zFileExport" name="zFileExport" value="">
					<input type="hidden" id="iNbrTotal" name="iNbrTotal" value="">
					<input type="hidden" id="iStart" name="iStart" value="0">
					<input type="hidden" id="iLength" name="iLength" value="50">
					<input type="hidden" id="iModeGraph" name="iModeGraph" value="1">
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
										<td class="middle" width="10">STATUT : </td>
										<td class="noBottom">
											<select class="form-control" id="STATUT" name="STATUT">
													<option selected="selected" value="">Tous</option>
													<option value="ADMIS EN DEPENSE">ADMIS EN DEPENSE</option>
													<option value="EN INSTANCE DE VISA COMPTA">EN INSTANCE DE VISA COMPTA</option>
													<option value="EN INSTANCE DE PRISE EN CHARGE">EN INSTANCE DE PRISE EN CHARGE</option>
													<option value="REJET">REJET</option>	
													<option value="COUVERTURE VALIDE">COUVERTURE VALIDE</option>	

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
									<td class="middle" width="10">Propriétaire :</td>
									<td class="noBottom">
										<table class="table tableRond table-top-countries">
											
											{assign var=iTest value=0}
											{foreach from=$toGetPropCode item=$oGetPropCode}
											{if $iTest%7==0 && $iTest==0}<tr>{/if}
											{if $iTest%7==0 || $iTest==0}<tr>{/if}
											<td><input type="checkbox" checked="checked" name="PROP_CODE[]" value="{$oGetPropCode.PROP_CODE}" class="form-controla">&nbsp;&nbsp;{$oGetPropCode.PROP_LIBELLE}</td>
											{assign var=iTest value=$iTest+1}
											{/foreach}
											</tr>
										</table>
									</td>
								</tr>
						    	<tr>
									<td class="middle" width="10">Mode de Paiement :</td>
									<td class="noBottom">
										<!--<input type="radio" class="MAND_MODE_PAIE" checked="checked" name="MAND_MODE_PAIE[]" value="">&nbsp;&nbsp;Tous-->
										<input type="radio" class="MAND_MODE_PAIE" checked="checked" name="MAND_MODE_PAIE" value="VB">&nbsp;&nbsp;Virement bancaire
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE" value="OO">&nbsp;&nbsp;Opération d'ordre
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE" value="BC">&nbsp;&nbsp;Bon de Caisse
										<input type="radio" class="MAND_MODE_PAIE" name="MAND_MODE_PAIE" value="OP">&nbsp;&nbsp;Ordre de paiement
									</td>
								</tr>
								<tr id="nombreMontant" style="display:none">
									<td class="middle" width="10">Mode d'affichage:</td>
									<td class="noBottom">
										<input type="radio" checked="checked" name="iMode" value="1">&nbsp;&nbsp;Nombre
										<input type="radio" name="iMode" value="2">&nbsp;&nbsp;Montant
									</td>
								</tr>
								<tr>							
									<td colspan="2">
											<div id="changeDate" style="display:inline-flex" class="col-sm-10">
												<div class="col-sm-6">
													<div class="form-group">
														<label>Date récupération</label>
														<div class="cal-icon"><input type="text" name="date_recup" id="date_recup" data-dd-opt-format="dd/mm/y" data-dd-opt-default-date="{$zDate}" data-dd-opt-double-view="true" autocomplete="off" value="" placeholder="du..." class="form-control datedropper-range-fiche" data-dd-opt-range-start="{$zDate}" data-dd-opt-range-end="{$zDateDemain}"></div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label>Date Visa</label>
														<div class="cal-icon"><input type="text" name="date_visa" id="date_visa" data-dd-opt-format="dd/mm/y" data-dd-opt-default-date="{$zDateDemain}" autocomplete="off" value="" placeholder="au..." class="form-control datedropper-range-fiche"  data-dd-opt-range-start="{$zDate}" data-dd-opt-range-end="{$zDateDemain}"></div>
													</div>
												</div>
											</div>
									</td>
								</tr>
								
							</tbody>
						</table>
						</div>
						<div style="text-align: center;"> 
							<input type="button" class="searchTb partielSearchHeader partielSearchHeader1" value="Rechercher" autocomplete="off">
							<input type="button" class="partielSearchHeader partielSearchHeader1 partielSearchHeader2" value="Exporter" onClick="valider()" autocomplete="off">
						</div>
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

.progress {
	margin: 20px 0 0 0;
	width: 300px;
	height:2rem!important;
	border: 1px solid #ddd;
	padding: 5px;
	border-radius: 5px;
}

.texteProgress {
	padding-left:28px;
}

.progress-bar {
	width: 0%;
	height: 20px;
	background-color: #4CAF50;
}

.middle{
	vertical-align:middle!important;
}
input[type=checkbox] {
	margin: 4px 3px 3px 30px;
}
input[type=radio] {
	margin: 4px 3px 3px 30px;
}

.partielSearchHeader2:hover{
	color:white;
}
</style>
</table>
{literal}
<script>

function valider(){

	$(".OnProgress").show();
	var form = document.forms[1];
	var formData = new FormData(form);

	var zUrl = form.action ; 

	var $form = $("#sendSearch");
	var formdata = (window.FormData) ? new FormData($form[0]) : null;
	var data = (formdata !== null) ? formdata : $form.serialize();
	$.ajax({
		url: $form.attr('action'),
		type: $form.attr('method'),
		dataType:'json',
		contentType: false, // obligatoire pour de l'upload
		processData: false, // obligatoire pour de l'upload
		data: data,
		success: function (data, textStatus, jqXHR) {

			$("#iDepart").val(0);
			$("#zFileExport").val(data.name);
			$("#iNbrTotal").val(data.iNombreTotal);
			$("#iStart").val(data.iStart);
			$("#iLength").val(10);

		}
	}).done(function(data){
		if(data.done==1 || data.iPercent==100){
			/*$("#iDepart").val(1);
			$("#zFileExport").val('');
			$("#iNbrTotal").val('');
			$("#iStart").val(0);
			$("#iLength").val(10);*/

			var $a = $("<a>");
			$a.attr("href",data.file);
			$("body").append($a);
			$a.attr("download",data.name);
			var progressBar = document.getElementById('progressBar');
			progressBar.style.width = '100%';
			progressBar.innerHTML = '100%';
			$a[0].click();
			$a.remove();
			$(".OnProgress").hide();
		} else {
			$("#iDepart").val(0);
			$("#zFileExport").val(data.name);
			$("#iNbrTotal").val(data.iNombreTotal);
			$("#iStart").val(data.iStart);
			$("#iLength").val(10);
			var progressBar = document.getElementById('progressBar');
			progressBar.style.width = data.iPercent + '%';
			progressBar.innerHTML = data.iPercent + '%';
			valider();
		}
	});
}

function __valider(){

	var form = document.forms[1];
	var formData = new FormData(form);

	var xhr = new XMLHttpRequest();

	xhr.upload.addEventListener('progress', function(event) {
		if (event.lengthComputable) {
			var percent = Math.round((event.loaded / event.total) * 100);
			var progressBar = document.getElementById('progressBar');
			progressBar.style.width = percent + '%';
			progressBar.innerHTML = percent + '%';
		}
	});

	xhr.addEventListener('load', function(event) {
		var uploadStatus = document.getElementById('uploadStatus');
		uploadStatus.innerHTML = event.target.responseText;
	});

	xhr.open('POST', form.action, true);
	xhr.send(formData);
}

$(document).ready(function() {
	   
		$("#getListing").on("click", function(){
			$("#nombreMontant").hide();
			$('#table_bd').DataTable().ajax.reload();
		})

		/*$(".partielSearchHeader2").on("submit", function(){
			alert("ok");
		})*/

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