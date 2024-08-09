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
													<option value="">Tous</option>
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
											<select class="form-control" id="COMPTE_NUM" name="COMPTE_NUM">
													<option selected="selected" value="">Tous</option>	
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
										<td class="middle" width="10">Conclusion : </td>
										<td class="noBottom">
											<select class="form-control" id="CONCLUSION" name="CONCLUSION">
													<option selected="selected" value="">Tous</option>
													<option value="SOLDE ANORMAL">SOLDE ANORMAL</option>
													<option value="COMPTE INEXISTANT">COMPTE INEXISTANT</option>
													<option value="COMPTE REDRESSE">COMPTE REDRESSE</option>
													<option value="SOLDE NORMAL">SOLDE NORMAL</option>	
											</select>
										</td>
									</tr>
									<tr>
										<td class="middle" width="10">Sens en cours : </td>
										<td class="noBottom">
											<select class="form-control" id="SENS" name="SENS">
													<option selected="selected" value="">Tous</option>
													<option value="NEUTRE">NEUTRE</option>
													<option value="DEBITEUR">DEBITEUR</option>
													<option value="CREDITEUR">CREDITEUR</option>	
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
})
</script>
{/literal}