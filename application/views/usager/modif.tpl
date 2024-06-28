{include_php file=$zCssJs}
	<div class="wrapper">
		<!-- ace styles -->
		<link rel="stylesheet" href="{$zBasePath}assets/common/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		 <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/vendor/jquery-ui.css?20180723161023?sdsds" >

		{include_php file=$zHeader}
		<script src="{$zBasePath}assets/js/jquery.maskedinput.js?V2"></script>

		<div class="content-wrapper">
			<section class="content-header">
			  <h1>
				{if $oData.iId==''}Ajout{else}Modification{/if} {$oData.zLibelle}
				<small>&nbsp;</small>
			  </h1>
			  <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Accueil</a></li>
				<li><a href="#"><i class="fa fa-th"></i> Gestion des usagers</a></li>
				<li><a href="#"><i class="fa fa-th"></i> {$oData.zLibelle1|ucfirst} </a></li>
				<li class="active">{if $oData.iId==''}Ajout{else}Modification{/if}</li>
			  </ol>
			</section>
			<!------------------------------>
			<!-- Main content -->
			<section class="content">
			  <div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-body">
					  <!------------------------------------------------------------->
							<div class="row">
								<div class="col-xs-12">
										<div class="box box-primary">
												<div class="box-header with-border">
												  <h3 class="box-title">Formulaire</h3>
												</div>

												<form method="post" name="formulaireEdit" id="formulaireEdit" onSubmit="return valider();"  enctype="multipart/form-data" action="{$zBasePath}usager/save">
												  <input type="hidden" id="iId" name="iId" value="{$oData.iId}"> 
														<div class="box-body">
															<div class="form-group">
																<label for="exampleInputPassword1"><b>Nom *</b></label>
																<input type="text" class="form-control" style="width:40%" name="usager_nom"  class="input input-sm form-control" value="{$oData.oUsager.usager_nom}" required>
																<br/>
															</div>
															<div class="form-group">
																<label for="exampleInputPassword1"><b>Prénom *</b></label>
																<input type="text" class="form-control" style="width:40%" name="usager_prenom"  class="input input-sm form-control" value="{$oData.oUsager.usager_prenom}" required>
																<br/>
															</div>
															<div class="form-group">
																<label for="exampleInputPassword1"><b>Organisme de rattachement</b></label>
																<input type="text" class="form-control" style="width:40%" name="usager_orgrattachement"  class="form-control" value="{$oData.oUsager.usager_orgrattachement}" required>
																<br/>
															</div>
															<div class="form-group">
																<label for="exampleInputPassword1"><b>Email *</b></label>
																<input type="text" style="width:40%" id="usager_email" name="usager_email"  class="input input-sm email form-control" value="{$oData.oUsager.usager_email}" required>
																<p class="otherError">Adresse E-mail invalide</p>
																<br/>
															</div>
															<div class="form-group">
																<label for="exampleInputPassword1"><b>Telephone</b></label>
																<input type="text" class="form-control" style="width:40%" id="usager_telephone" name="usager_telephone"  value="{$oData.oUsager.usager_telephone}" required>
																<br/>
															</div>
															
														</div>
												  <div class="box-footer">
													<input style="width: 150px;" type="submit" name="btnSave" onsubmit="return valider();ss" class="btn btn-primary text-blue" value="Enregistrer">
													<a style="width: 150px;" href="{$zBasePath}usager/liste" class="btn btn-primary">Retour</a> 
												  </div>
												</form>
											  </div>
								</div>
							</div>
					  <!------------------------------------------------------------->
					</div>
				  </div>
				</div>
			  </div>
			</section>
		</div> 
		
		{literal}
		<style>
		form .otherError {
			color: #ed1b24;
			font-size: 12px;
			font-style: italic;
			padding: 5px 0 5px 10px !important;
			display: none;
		}
		form .error .otherError {
			display: block;
		}
		</style>
		<script type="text/javascript">
		  function valider(){
				var bValid = true;
				$(".email").each (function ()
				{
					email = $(this).val();
					if($(this).val()!=""){
						$(this).parent().removeClass("error");
						if(!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
						{
							$(this).parent().addClass("error");
							bValid = false;
						} 
					}
				}) ;
				return bValid;
		  }

			$("#isChangePass").click(function(){
			   if($('#isChangePass').is(':checked')) {
					$("#hideShow").show();
					$("#password").attr("required","required");
				} else {
					$("#password").removeAttr("required");
					$("#hideShow").hide();
				}
			});

		  jQuery(document).ready(function() {
			  
			  jQuery("#usager_telephone").mask("999 99 999 99"); 
			  jQuery( "#datepicker1" ).datepicker({
					dateFormat: "yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
			  });
			
			  jQuery('input').attr("autocomplete","off");

		  });

		  function showPreview(){
				$('#formulaireEdit').find('input.jfilestyle').on('change', function (e) {
					var files = $(this)[0].files; 

					if (files.length > 0) {
						$(this).siblings('p.zImgVignette').children().removeAttr('src');
						$('.zImgVignette').show();
						var file = files[0],
						$image_preview = $(this).siblings('p.zImgVignette');
						$image_preview.show();
						$(this).siblings('p.zImgVignette').children().show();
						$(this).siblings('p.zImgVignette').children().attr('src', window.URL.createObjectURL(file));
					}
				});
			}
		
		 </script>
		{/literal}
		{include_php file=$zFooter}
		 <script type="text/javascript" src="{$zBasePath}assets/common/js/vendor/jquery-ui.js"></script>

	</div>
	</body>
</html>