{include_php file=$zCssJs}
  {include_php file=$zHeader}
  <link rel="stylesheet" href="{$zBasePath}assets/common/plugins/summernote/summernote-bs4.min.css">
  <!-- CodeMirror -->
  <link rel="stylesheet" href="{$zBasePath}assets/common/plugins/codemirror/codemirror.css">
  <link rel="stylesheet" href="{$zBasePath}assets/common/plugins/codemirror/theme/monokai.css">
  <script src="{$zBasePath}assets/js/numeric.js"></script>
  <!-- SimpleMDE -->
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            &nbsp;
			<small>&nbsp;</small>
          </div>
        
		  <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
			  <li class="breadcrumb-item"><a href="#">Accueil</a></li>
			  <li class="breadcrumb-item"><a href="#">RNF</a></li>
			  <li class="breadcrumb-item"><a href="#">Dynamisation formulaire</a></li>
			  <li class="breadcrumb-item active">formule</li>
            </ol>
          </div>
        </div>
		
      </div>

			 <!-------------------------------------------- section content ---------------------------------------------------->
			  <section class="content">
			  <div class="container-fluid">
				<div class="row">
				  <div class="col-md-12">
					<div class="card card-primary">
					  <div class="card-header">
						<h3 class="card-title">Entité / Nature de recette </h3>
					  </div>
							  <form id="quickForm" novalidate="novalidate">
								<div class="card-body">
								  
								  <div class="form-group">
									<label for="exampleInputEntite1">Entité *: </label>
										<select class="input input-sm form-control" id="entite" style="width:10%" name="entite">
											<option value="MEF">MEF</option>
											<option value="MEN">MEN</option>
											<option value="CUA">CUA</option>
											<option value="MEH">MEH</option>
										</select>
								  </div>
								  <br/>
								  <div class="form-group">
										<label for="exampleInputNatureRecette1">Nature de recette * :</label>
										<select class="input input-sm form-control" id="entite" style="width:25%" name="entite">
											<option value="MEF">Recette du patrimoine</option>
											<option value="MEN">Recette des amandes</option>
											<option value="CUA">Don et legs</option>
										</select>
								  </div>

								  <br/>
								  
								  <div class="form-group mb-0">
									<label for="exampleInputNatureRecette1">Type * :</label>
									
										<div class="card card-secondary">
											  <div class="card-body">
													<div class="custom-control custom-radio">
														  <span class="marge"><input type="radio" name="iType" id="radioPrimary1" value="1" checked="checked" class="custom-control-input form-check">
															<label class="custom-control-label" for="radioPrimary1">Fixe</label>
														  </span>
														  <span class="marge"><input type="radio" name="iType" id="radioPrimary2" value="2"  class="custom-control-input form-check">
															<label class="custom-control-label" for="radioPrimary2">Forfaitaire</label>
														   </span>
														  <span class="marge"><input type="radio" name="iType" id="radioPrimary3" value="3"  class="custom-control-input form-check">
															<label class="custom-control-label" for="radioPrimary3">Formule</label>
														   </span>
													</div>
											  </div>
										</div>
								  
								  </div>

									   <div class="form-group mb-0">
												<!---- -->
												<div class="card card-secondary">
													<div class="card-body">
														<div id="change" class="panel panel-default1">	
															<div id="panelFixe" style="display:block">
																<div class="form-group" style="display:inline-flex">
																		<label for="exampleInputNatureRecette1">Montant * :&nbsp;&nbsp;</label>
																		<input type="text" name="montantFixe" id="montantFixe" style="width:50%" class="input input-sm form-control" value="" />
																 </div>
																
															</div>
															<div id="panelForfaitaire" style="display:none">
																<div class="form-group" style="display:inline-flex">
																	<label for="exampleInputPassword1"><b>&nbsp;Montant min* :&nbsp;&nbsp;</b></label>
																	<input type="text" name="montantForfaitaireMin" id="montantForfaitaireMin" style="width:25%" class="input input-sm form-control" value="" />
																	<label for="exampleInputPassword1"><b>&nbsp;Montant max * :&nbsp;&nbsp;</b></label>
																	<input type="text" name="montantForfaitaireMax" id="montantForfaitaireMax" style="width:25%" class="input input-sm form-control" value="" />
																</div>
															</div>
															<div id="panelFormule" style="display:none">
																<div class="custom-control custom-radio">
																	<span class="marge"><input type="radio" name="typeChamp" checked="checked" id="radioSecondary1" value="1" class="custom-control-input form-typeChamp">
																	<label class="custom-control-label" for="radioSecondary1">Radio</label>
																	</span>
																	<span class="marge"><input type="radio" name="typeChamp" value="2" id="radioSecondary2" class="custom-control-input form-typeChamp">
																	<label class="custom-control-label" for="radioSecondary2">&nbsp;&nbsp;Choix multiple</label>
																	</span>
																	<span class="marge"><input type="radio" name="typeChamp" value="3" id="radioSecondary3" class="custom-control-input form-typeChamp">
																	<label class="custom-control-label" for="radioSecondary3">&nbsp;&nbsp;Boucle</label>
																	</span>
																	<input style="width: 150px;" type="button" name="btnAddChamp" class="btn  bg-green form-btnChamp" value="Ajouter un champ" autocomplete="off">
																</div>
																<div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!---- -->	
									   </div>

									  
									   <div id="renderHtml" class="form-group mb-0" {if count($toSaveForm)>0}style="display:block"{else}style="display:none"{/if} >
												<!---- -->
												{$zRender}
												<!---- -->	
									   </div>

								</div>
								<div class="card-footer">
								  <button type="submit" class="btn btn-primary">Submit</button>
								</div>
							  </form>
					</div>
					</div>
				  <div class="col-md-6">

				  </div>
				</div>
			  </div>
			</section>

			 <!-------------------------------------------- fin section content ---------------------------------------------------->
	
	</section>

    <!-- Main content -->
			
    <!-- /.content -->
  </div>


<div class="modal fade" id="modal-xl">
	<div class="modal-dialog modal-xl">
	  <div class="modal-content">
		<div class="modal-header">
		  <h4 class="modal-title">Ajout de champ de type : </h4>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		</div>
		<div class="modal-footer justify-content-between">
		  <button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">Fermer</button>
		  <button type="button" id="validerChamp" class="btn btn-primary">Valider les champs</button>
		</div>
	  </div>
	</div>
</div>
<!-- /.modal -->

 {literal}
<style>
.row {
margin-left:15px;
margin-right:15px;
}

.marge {
	margin-right:50px;
}
</style>
<script type="text/javascript">
  $(document).ready(function() {

		$("#renderHtml").hide();
		$(".prix").numeric({ decimal : ".",  negative : false, scale: 2 });
		$( "#tablePrincipale tr" ).draggable();
		$("#modal-xl #validerChamp").on("click", function(){

			var iRet = 1 ; 
			$(".obligatoire").each (function ()
			{
				$(this).parent().removeClass("error");
				if($(this).val()=="")
				{
					 $(this).parent().addClass("error");
					 iRet = 0 ;
				}
			}) ;

		    
			if (iRet == 1){	
				var $form = $("#setRnfFormulaire");
				var formdata = (window.FormData) ? new FormData($form[0]) : null;
				var data = (formdata !== null) ? formdata : $form.serialize();
				$.ajax({
					url: $form.attr('action'),
					type: $form.attr('method'),
					contentType: false, // obligatoire pour de l'upload
					processData: false, // obligatoire pour de l'upload
					data: data,
					success: function (zReturn, textStatus, jqXHR) {
						$("#renderHtml").html(zReturn);
						$("#renderHtml").show();
						$('#closeModal').click();
					}
				});
			}

		})
		
		$(".form-check").on("click", function(){
			var iValue = $(this).val();
			switch (iValue)
			{
				case '1' :
					$("#panelFixe").show();
					$("#panelForfaitaire").hide();
					$("#panelFormule").hide();
					$("#renderHtml").hide();
					break;

				case '2' :
					$("#panelFixe").hide();
					$("#panelForfaitaire").show();
					$("#panelFormule").hide();
					$("#renderHtml").hide();
					break;

				case '3' :
					$("#panelFixe").hide();
					$("#panelForfaitaire").hide();
					$("#panelFormule").show();
					$("#renderHtml").show();
					break;
			
			}
		})

		$(".form-btnChamp").on("click", function(){
			var zTtileAdd = '';
			var iValue =  $('input[name=typeChamp]:checked').val()
			switch (iValue)
			{
				case '1' :
					zTtileAdd = " Radio";
					break;

				case '2' :
					zTtileAdd = " Choix multiple";
					
					break;

				case '3' :
					zTtileAdd = " Boucle";
					break;
			
			}

			$("#modal-xl .modal-title").html('Ajout de champ de type : ' + zTtileAdd);

			$.ajax({
				url: zBasePath + "rnf/setHtml",
				type: 'post',
				data: {
					iType: iValue,
				},
				success: function(data, textStatus, jqXHR) {
					$("#modal-xl .modal-body").html(data);
					$("#modal-xl").modal();	
				},
				async: true
			})
		})
	})

 </script>
{/literal}
{include_php file=$zFooter}
<script src="{$zBasePath}assets/common/plugins/summernote/summernote-bs4.min.js"></script>
<script src="{$zBasePath}assets/common/plugins/codemirror/codemirror.js"></script>
<script src="{$zBasePath}assets/common/plugins/codemirror/mode/css/css.js"></script>
<script src="{$zBasePath}assets/common/plugins/codemirror/mode/xml/xml.js"></script>
<script src="{$zBasePath}assets/common/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script type="text/javascript" src="{$zBasePath}assets/common/js/vendor/jquery-ui.js"></script>
