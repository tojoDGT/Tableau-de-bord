{include_php file=$zCssJs}

  {include_php file=$zHeader}
  
  <div class="content-wrapper">
    
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{$oData.zLibelle1}</h1>
          </div>
        
		  <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
			  <li class="breadcrumb-item"><a href="#">Accueil</a></li>
			  <li class="breadcrumb-item"><a href="#">Tableau de bord</a></li>
			  <li class="breadcrumb-item active">{$oData.zLibelle|ucfirst}</li>
            </ol>
          </div>
        </div>
		
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
	<div>&nbsp;</div>
	<div class="row">	
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
					  <i class="fas fa-chart-pie mr-1"></i>
					  Resultats
					</h3>
					<br>
				</div>
										<form method="post" name="formulaireEdit" id="formulaireEdit" onsubmit="return valider();" enctype="multipart/form-data" action="http://localhost/CNFI_BACKOFFICE/slide/save/">
											  <input type="hidden" id="iId" name="iId" value="4" autocomplete="off"> 
											  <div class="box-body">
														<div class="form-group">
														  <label for="exampleInputPassword1"><b>ENTITE</b></label>
														  <select id="entite" name="entite">
																<option value="MEF">MEF</option>
																<option value="MEN">MEN</option>
																<option value="CUA">CUA</option>
																<option value="MEH">MEH</option>
														  </select>
														</div>
														<div class="form-group">
														  <label for="exampleInputPassword1"><b>Nature de recette</b></label>
														   <select id="natureRecette" name="entite">
																<option value="MEF">Recette du patrimoine</option>
																<option value="MEN">Recette des amandes</option>
																<option value="CUA">Don et legs</option>
														  </select>
														</div>
														<div class="form-group">
														  <label for="exampleInputPassword1"><b>Type</b></label>
															<span class="marge"><input type="radio" name="iType" value="1" checked="checked" class="form-check">&nbsp;&nbsp;Fixe</span>
															<span class="marge"><input type="radio" name="iType" value="2" class="form-check">&nbsp;&nbsp;forfaitaire</span>
															<span class="marge"><input type="radio" name="iType" value="3" class="form-check">&nbsp;&nbsp;Formule</span>
														</div>
														<!---- -->
														<div id="change" class="panel panel-default1">	
															<div id="panelFixe" style="display:block">
																<div class="row"> 
																	<label for="exampleInputPassword1"><b>Montant * :</b></label>
																	<input type="text" name="montantFixe" id="montantFixe" value="" />
																</div>
															</div>
															<div id="panelForfaitaire" style="display:none">
																<div class="row"> 
																	<label for="exampleInputPassword1"><b>Montant min* :</b></label>
																	<input type="text" name="montantForfaitaireMin" id="montantForfaitaireMin" value="" />
																	<label for="exampleInputPassword1"><b>Montant max * :</b></label>
																	<input type="text" name="montantForfaitaireMax" id="montantForfaitaireMax" value="" />
																</div>
															</div>
															<div id="panelFormule" style="display:none">
																<div class="row"> 
																	<span class="marge2"><input type="radio" name="typeChamp" checked="checked" value="1" class="form-typeChamp">&nbsp;&nbsp;Radio</span>
																	<span class="marge2"><input type="radio" name="typeChamp" value="2" class="form-typeChamp">&nbsp;&nbsp;Choix multiple</span>
																	<span class="marge2"><input type="radio" name="typeChamp" value="3" class="form-typeChamp">&nbsp;&nbsp;Boucle</span>
																	<input style="width: 150px;" type="button" name="btnAddChamp" data-toggle="modal" data-target="#modal-xl" class="btn  bg-green form-btnChamp" value="Ajouter un champ" autocomplete="off">
																</div>
																<div>
																</div>
															</div>
														</div>
														<!---- -->
											  </div>
											  <div class="box-footer">
												<input style="width: 150px;" type="submit" name="btnSave" class="btn btn-primary text-blue" value="Enregistrer" autocomplete="off">
												<a style="width: 150px;" href="http://localhost/CNFI_BACKOFFICE/slide/liste" class="btn btn-primary">Retour</a> 
											  </div>
										</form>
				</div>
			<!-- /.content -->
			</div>
		</div>
	</div>
{literal}
<style>
.row {
margin-left:15px;
margin-right:15px;
}
</style>
<script type="text/javascript">
  $(document).ready(function() {

		$(".form-check").on("click", function(){
			var iValue = $(this).val();
			switch (iValue)
			{
				case '1' :
					$("#panelFixe").show();
					$("#panelForfaitaire").hide();
					$("#panelFormule").hide();
					break;

				case '2' :
					$("#panelFixe").hide();
					$("#panelForfaitaire").show();
					$("#panelFormule").hide();
					break;

				case '3' :
					$("#panelFixe").hide();
					$("#panelForfaitaire").hide();
					$("#panelFormule").show();
					break;
			
			}
		})

		$(".form-btnChamp").on("click", function(){
			var iValue =  $('input[name=typeChamp]:checked').val()
			$('#myModal').modal('show');
			switch (iValue)
			{
				case '1' :
					
					break;

				case '2' :
					
					break;

				case '3' :
					
					break;
			
			}
		})
	})

 </script>
{/literal}
{include_php file=$zFooter}