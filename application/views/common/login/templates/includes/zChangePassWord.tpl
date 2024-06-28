<script src="{$zBasePath}assets/js/jquery.maskedinput.js?V2"></script>
<form class="form-pass hide" name="changeMotDePasse"  id="changeMotDePasse" action="{$zBasePath}user/change_mot_passe"  method="post">
<input type="hidden" name="isCheckCarte" id="isCheckCarte" value="0">
	<div class="panel panel-danger">
		<div class="panel-body">
			<div class="text-center">
				<img src="{$zBasePath}assets/common/img/logo.png" alt="" class="img-responsive"/>
				<h2>Modifier vos parametres</h2>
			</div>
			<div>
				<label for="CIN" class="sr-only">CIN</label>
				<input type="text" id="cin22" class="form-control obligatoire" name="cin" value="{$zCinEdit}" data-original-title="Ampidiro ny laharan&acute;ny karampanodronao" class="form-control" placeholder="Numéro CIN">
				<span class="brPass"><br></span>
				<p class="message">Veuillez remplir le numéro de votre cin</p>
			</div>
			<div>
				<label for="Telephone" class="sr-only">Telephone</label>
				<input type="text" class="form-control obligatoire" value="{$zPhoneEdit}" placeholder="Téléphone" autofocus id="phone" class="form-control" name="phone" data-original-title="Ampidiro ny laharan&acute;ny finday izay ao anatin&acute;ny CV anao ">
				<span class="brPass"><br></span>
				<p class="message">Veuillez insérez votre numéro de téléphone inscrit dans votre CV sur ROHI</p>
			</div>

			<div>
				<label for="Statut" class="sr-only">Statut</label>
				<select class="form-control StatutObligatoire" placeholder="Status" name="statut" onChange="changeStatut(this.value,'222');" data-placement="top" data-toggle="tooltip" data-original-title="Hamarino ny momba anao na Fonctionnaire, na HEE, na EFA, na ECD, na ELD, na EMO, na ES" id="statut" autofocus>
					{foreach from=$oData.list_statut item=oListeStatut}
						<option {if $zStatutEdit == $oListeStatut.id} selected="selected" {/if}  value="{$oListeStatut.id}">{$oListeStatut.libele}</option>
					{/foreach}
				</select>
				<span class="brPass"><br></span>
				<p class="message">Veuillez sélectionner votre statut</p>
			</div>
			<div>
				<label for="matricule" class="sr-only">Matricule</label>
				<input type="text" id="matricule222" value="{$zMatricule}" class="form-control obligatoire" name="matricule" data-original-title="Ampidiro ny «matricule-nao».Tsy asiana teboka na elanelana" class="form-control" placeholder="Matricule" autofocus>
				<span class="brPass"><br></span>
				<p class="message">Veuillez insérez votre numéro de matricule</p>
			</div>
			<label>Avez-vous une carte RoHI</label>
			<div class="checkbox text-left" >
				<label class="text-center">
					<input type="radio" class="radioCarte" id="iCarteRohi" name="iCarteRohi" value="1"> Oui
				</label>
				<label class="text-center">
					<input type="radio" class="radioCarte" id="iCarteRohi" name="iCarteRohi" checked="checked" value="0"> Non
				</label>
			</div>
			<div id="iCarteRohiAffiche" style="display:none;">
				<label for="Pseudo" class="sr-only">N° Carte ROHI</label>
				<input type="text" id="carte" class="form-control" name="carte" placeHolder="N° Carte ROHI" data-original-title="Ampidiro ny laharana 10 voalohany eo amin'ny Karatra ROHI eo ampelatananao" value="">
				<br/>
			</div>
			<div>
				<label for="Pseudo" class="sr-only">Pseudo</label>
				<input type="Pseudo" id="login" value="{$zLoginEdit}" class="form-control obligatoire" name="login" data-original-title="Ampidiro ny «pseudo» vaovao izay nosafidinao" class="form-control" placeholder="Pseudo" autofocus>
				<span class="brPass"><br></span>
				<p class="message">Veuillez insérez votre nouveau Pseudo</p>
			</div>
			<div>
				<label for="Password" class="sr-only">Mot de passe</label>
				<input type="password" id="password" class="form-control obligatoire" name="password" data-original-title="Ampidiro ny teny miafina na «mot de passe» izay nosafidinao " class="form-control" placeholder="Mot de passe">
				<span class="brPass"><br></span>
				<p class="message">Veuillez insérez votre nouveau mot de passe</p>
			</div>
			<div>
				<label for="PasswordConfirm" class="sr-only">Confimer mot de passe</label>
				<input type="password" id="confirm_password" class="form-control" placeHolder="Confimer mot de passe" name="confirm_password" data-original-title="Hamarino ilay teny miafina na «mot de passe» nosafidianao tery ambony">
			</div>
			<br/>
			<button class="btn btn-lg btn-danger btn-block" id="validationChangePseudo" type="button" data-placement="bottom" data-toggle="tooltip" data-original-title="Tsindrio rehefa tafiditra ny « pseudo » sy ny « mot de passe »">Enregister</button>
		</div>
		<div class="panel-footer">
			<div class=" text-center">
				<a href="#" class="showSignIn"><span class="fa fa-sign-in"></span>Déja inscrit, Se connecter</a>
			</div>
		</div>
	</div>
</form>
{literal}
<script>

	$("#matricule222").mask("999 999"); 
	$("#phone").mask("999 99 999 99"); 
	$("#cin22").mask("999 999 999 999");

	$('.radioCarte').click(function(){
		
		var iValue = $(this).val();  

		switch (iValue) {
			case '1':
				$("#iCarteRohiAffiche").show();
				$("#isCheckCarte").val(1);
				break;

			case '0':
				$("#iCarteRohiAffiche").hide();
				$("#isCheckCarte").val(0);
				break;
		}

		
	});  
</script>
{/literal}