
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
													<option selected="selected" value="">Tous</option>
													<option value="2023">2023</option>
													<option value="2023">2024</option>
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
											<select class="form-control" id="MIN_ABREV" name="MIN_ABREV">
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
											<select class="form-control" id="MIN_ABREV" name="MIN_ABREV">
													<option selected="selected" value="">Tous</option>
													<option value="SOLDE ANORMAL">SOLDE ANORMAL</option>
													<option value="COMPTE INEXISTANT">COMPTE INEXISTANT</option>
													<option value="COMPTE REDRESSE">COMPTE REDRESSE</option>
													<option value="SOLDE NORMAL">SOLDE NORMAL</option>	
											</select>
										</td>
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
	    
		
})
</script>
{/literal}