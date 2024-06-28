{include_php file=$zCssJs}
	<div class="wrapper">
		<!-- ace styles -->
		<link rel="stylesheet" href="{$zBasePath}assets/common/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		 <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/vendor/jquery-ui.css?20180723161023?sdsds" >

		{include_php file=$zHeader}

		<div class="content-wrapper">
			<section class="content-header">
			  <h1>
				{if $oData.iId==''}Ajout{else}Modification{/if} {$oData.zLibelle}
				<small>&nbsp;</small>
			  </h1>
			  <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Accueil</a></li>
				<li><a href="#"><i class="fa fa-th"></i> Gestion des contenus</a></li>
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

												<form method="post" name="formulaireEdit" id="formulaireEdit" onSubmit="return valider();"  enctype="multipart/form-data" action="{$zBasePath}mission/save/{$oData.zHashModule}">
												  <input type="hidden" id="iId" name="iId" value="{$oData.iId}"> 
												  <div class="box-body">
													
													
													<div class="form-group">
													  <label for="exampleInputPassword1"><b>Titre</b></label>
													  <input type="text" class="form-control" style="width:40%" name="mission_titre"  class="input input-sm form-control" value="{$oData.oMission.mission_titre}" required>
													</div>
													<br/>
													<div class="form-group">
													  <label for="exampleInputPassword1"><b>Description courte</b></label>
													  <br/>
													  {$oData.zContentCourt}
													</div>
													<br/>
													<div class="form-group">
													  <label for="exampleInputPassword1"><b>Description longue</b></label>
													  <br/>
													  {$oData.zContentLong}
													</div>
													<br/>
												  </div>
												  <div class="box-footer">
													<input style="width: 150px;" type="submit" name="btnSave" class="btn btn-primary text-blue" value="Enregistrer">
													<a style="width: 150px;" href="{$zBasePath}mission/liste" class="btn btn-primary">Retour</a> 
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
		<script type="text/javascript">
		  function valider(){
			 return true;
		  }

		  jQuery(document).ready(function() {
			 
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