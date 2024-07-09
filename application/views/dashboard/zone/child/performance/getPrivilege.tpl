<div class="card-body" style="padding:0px">
<div class="col-md-12" style="padding:0px">
<div class="searchStatus">
		<div class="au-card au-card--bg-blue ">
			<div class="au-card-inner">
				<div class="table-responsive" style="padding:15px;">
						<div class="col-md-12" style="display:inline-flex">
						
						<table class="table tableRond table-top-countries">
							<tbody>
								<tr>
									<td class="middle" colspan="2" align="center" width="10"><div class="text-muted"><h3>GESTION PRIVILEGE</h3></div></td>
								</tr>
								<tr>
									<td class="middle" width="10">Accès Liste et détail</td>
									<td class="noBottom" align="left">
										<input type="checkbox" name="PROP_CODE[]" value="" class="form-controla">
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">Accès Graphe</td>
									<td class="noBottom" align="left">
										<input type="checkbox" name="PROP_CODE[]" value="" class="form-controla">
									</td>
								</tr>
								<tr>
									<td class="middle" width="10">Accès Export</td>
									<td class="noBottom" align="left">
										<input type="checkbox" name="PROP_CODE[]" value="" class="form-controla">
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						
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
.table-bordered td, .table-bordered th {
     border: none; 
}
</style>


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

							</div>