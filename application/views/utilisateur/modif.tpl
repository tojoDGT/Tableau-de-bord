{include_php file=$zCssJs}
  {include_php file=$zHeader}
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            {if $oData.iId==''}Ajout{else}Modification{/if} {$oData.zLibelle}
			<small>&nbsp;</small>
          </div>
        
		  <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
			  <li class="breadcrumb-item"><a href="#">Accueil</a></li>
			  <li class="breadcrumb-item"><a href="#">Tableau de bord</a></li>
			  <li class="breadcrumb-item"><a href="#">{$oData.zLibelle1|ucfirst}</a></li>
			  <li class="breadcrumb-item active">{if $oData.iId==''}Ajout{else}Modification{/if}</li>
            </ol>
          </div>
        </div>
		
      </div>
	  <div class="row">	
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title"></h3>

					<div class="card-tools">
					</div>
				</div>
			<!------------------------------------------------------------->
			<div class="row">
				<div class="col-xs-12">
						<div class="box box-primary">
								<div class="box-header with-border">
								  <h3 class="box-title">Formulaire</h3>
								</div>

								<form method="post" name="formulaireEdit" id="formulaireEdit" onSubmit="return valider();"  enctype="multipart/form-data" action="{$zBasePath}utilisateur/save">
								  <input type="hidden" id="iId" name="iId" value="{$oData.iId}"> 
										<div class="box-body">
											<div class=" form form-group input-group col-sm-12">
												<label for="exampleInputPassword1"><b>Photo </b></label>
												<input type="file" id="image" name="image" class="jfilestyle" data-placeholder="Image" data-buttonText="<span class='glyphicon glyphicon-picture'></span>">
												<br>
												<p class="zImgVignette" {if $oData.oUtilisateur.image != ''} style="display:block;" {else} style="display:none;" {/if}>
													<img class="ImgVgt" width="200" src="{$smarty.const.zURL_BO}assets/common/dist/img/{$oData.oUtilisateur.image}">
												</p>
												<p class="message">Veuillez remplir la dénomination</p>
											</div>
											<br/>
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Nom *</b></label>
												<input type="text" class="form-control"  name="nom"  class="input input-sm form-control" value="{$oData.oUtilisateur.nom}" required>
											</div>
											<br/>
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Prénom *</b></label>
												<input type="text" class="form-control" name="prenom"  class="input input-sm form-control" value="{$oData.oUtilisateur.prenom}" required>
											</div>
											<br/>
											{if $oData.oSession.id == $oData.oUtilisateur.id}
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Login *</b></label>
												<input type="text" class="form-control" name="login"  class="input input-sm form-control" value="{$oData.oUtilisateur.username}" required>
											</div>
											
											<div class="form-group">
												
												<label for="exampleInputPassword11"><b>Changer votre mot de passe</b></label>
												<input type="checkbox" name="isChangePass" id="isChangePass" style="width:20px;height:20px" value="1">
												</br>
												<div class="form-group" id="hideShow" style="display:none">
													<label for="exampleInputPassword1"><b>Mot de passe *</b></label>
													<input type="password" class="form-control"  id="password" name="password"  class="input input-sm form-control" value="">
												</div>
											</div>
											<br/>
											{else}
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Login *</b></label>
												<input type="text" class="form-control" name="login"  class="input input-sm form-control" value="{$oData.oUtilisateur.username}" required>
												</br>
											</div>
												{if $oData.oUtilisateur.id>0}
												<div class="form-group">
													<label for="exampleInputPassword1"><b>Mot de passe *</b></label>
													<input type="password" class="form-control"  id="password" name="password" class="input input-sm form-control" value="">
													</br>
												</div>
												<br/>
												{else}
												<div class="form-group">
													<label for="exampleInputPassword1"><b>Mot de passe *</b></label>
													<input type="password" class="form-control"  id="password" name="password" readonly="readonly"  class="input input-sm form-control" value="123456" required> (defaut : 123456)
													</br>
												</div>
												<br/>
												{/if}
											{/if}
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Email</b></label>
												<input type="text" class="form-control" name="email"  class="form-control" value="{$oData.oUtilisateur.email}" required>
											</div>
											<br/>
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Liste et détail</b></label>
												</br>
												<input type="checkbox" name="isChef" id="isChef" style="width:20px;height:20px" value="1" {if $oData.oUtilisateur.isChef==1}checked="checked"{/if}>
											</div>
											<br/>
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Exportation de donnée</b></label>
												</br>
												<input type="checkbox" name="isDeveloppeur" id="isDeveloppeur" style="width:20px;height:20px" value="1" {if $oData.oUtilisateur.isDeveloppeur==1}checked="checked"{/if}>
											</div>
											<br/>
											<div class="form-group">
												<label for="exampleInputPassword1"><b>Privilège</b></label>
												<br/>
												<select name="privilege" id="privilege" required>
													<option value="Admin" {if $oData.oUtilisateur.privilege=="Admin"}selected="selected"{/if}>Admin</simple>
													<option value="SuperAdmin" {if $oData.oUtilisateur.privilege=="SuperAdmin"}selected="selected"{/if}>SuperAdmin</simple>
												</select>
											</div>
											<br/>
										</div>
								  <div class="box-footer">
									<input style="width: 150px;" type="submit" name="btnSave" class="btn btn-primary" value="Enregistrer">
									<a style="width: 150px;" href="{$zBasePath}utilisateur/liste" class="btn btn-primary">Retour</a> 
									
								  </div>
								  <div>&nbsp;</div>
								</form>
							  </div>
				</div>
			</div>
	  <!------------------------------------------------------------->
	
	</div>
			<!-- /.content -->
			</div>
		</div>
	</div>
	
	</section>

    <!-- Main content -->
			
    <!-- /.content -->
  </div>
  {literal}
<style>
.row {
margin-left:15px;
margin-right:15px;
}
</style>
<script type="text/javascript">
  function valider(){
	 return true;
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