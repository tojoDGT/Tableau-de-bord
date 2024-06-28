<form class="form-horizontal form_inscription form-signup hide" role="form" name="create_form"  id="create_form" action="{$zBasePath}user/create" method="POST">
	<input type="hidden" name="url_base" id="url_base" value="{$zBasePath}">
	<div class="panel panel-danger">
		<div class="panel-body">
			<div class="text-center">
				<img src="{$zBasePath}assets/common/img/logo.png" alt="" class="img-responsive"/>
				<h2>Inscrivez-vous</h2>
			</div>
			<div>
				<label for="Statut" class="sr-only">Statut</label>
				<select class="form-control StatutObligatoire1" placeholder="Status" name="statut" onChange="changeStatut(this.value,'111');" data-placement="top" data-toggle="tooltip" data-original-title="Hamarino ny momba anao na Fonctionnaire, na HEE, na EFA, na ECD, na ELD, na EMO, na ES" id="statut" autofocus>
					{foreach from=$oData.list_statut item=oListeStatut }
							<option {if $zStatutEdit == $oListeStatut.id} selected="selected" {/if}  value="{$oListeStatut.id}">{$oListeStatut.libele}</option>
					{/foreach}
				</select>
				<span class="brInscr"><br></span>
				<p class="message">Veuillez sélectionner votre statut</p>
			</div>

			<div>
			<label for="matricule" class="sr-only">Matricule</label>
			<input type="text" id="matricule111" class="form-control obligatoireInscr" placeholder="Matricule" name="matricule" data-original-title="Ampidiro ny «matricule»-nao. Tsy asiana teboka na elanelana. Raha tsy manana «matricule» ianao dia soraty mazava na ECD, na EMO, na ES  ny sokajy misy anao "value="{$zMatricule}" autofocus>
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre matricule</p>
			</div>

			<div>
				<label for="Nom" class="sr-only">Nom</label>
				<input type="text" id="nom" class="form-control obligatoireInscr" placeholder="Saisissez votre nom" name="nom" data-original-title="Ampidiro ny anaranao" value="{$zNomEdit}">
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre nom</p>
			</div>

			<div>
			<label for="Prenom" class="sr-only">Prenom</label>
			<input type="text"  onfocus="clickPrenom()" id="prenom" class="form-control obligatoireInscr" placeholder="Saisissez vos pr&eacute;noms" name="prenom" data-original-title="Rehefa tsindrinao ito «champ» ito dia mivoaka ny fanampin’anarana feno. Raha tsy mivoaka dia mila mameno" value="{$zPrenomEdit}">
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre prénom</p>
			</div>

			<label for="Genre" class="sr-only">Genre</label>
			<select id="Genre" class="form-control" placeholder="Genre" required autofocus>
				<option value="0" selected>Genre</option>
				<option {if $zSexeEdit==1}selected="selected"{/if} value="1">Masculin</option>
				<option {if $zSexeEdit==2}selected="selected"{/if} value="2">Feminin</option>
			</select>
			<br>
			<div>
				<label for="CIN" class="sr-only">CIN</label>
				<input type="text" id="cin11" name="cin" value="{$zCinEdit}" data-original-title="Ampidiro ny laharan&acute;ny karampanodronao" class="form-control obligatoireInscr" placeholder="Numéro CIN" autofocus>
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre cin</p>
			</div>


			<div>
				<label for="Pseudo" class="sr-only">Pseudo</label>
				<input type="Pseudo" id="login" value="{$zLoginEdit}" class="form-control obligatoireInscr" name="login" data-original-title="Ampidiro ny «pseudo» vaovao izay nosafidinao" class="form-control" placeholder="Pseudo" autofocus>
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre pseudo</p>
			</div>
			
			<div>
				<label for="Password" class="sr-only">Mot de passe</label>
				<input type="password" id="password" class="form-control obligatoireInscr" name="password" data-original-title="Ampidiro ny teny miafina na «mot de passe» izay nosafidinao " class="form-control" placeholder="Mot de passe">
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre pseudo</p>
			</div>

			<div>
				<label for="PasswordConfirm" class="sr-only">Confimer mot de passe</label>
				<input type="password" id="confirm_password" class="form-control obligatoireInscr" placeHolder="Confimer mot de passe" name="confirm_password" data-original-title="Hamarino ilay teny miafina na «mot de passe» nosafidianao tery ambony">
				<span class="brInscr"><br></span>
				<p class="message">Veuillez insérer votre pseudo</p>
			</div>

			<button class="btn btn-lg btn-danger btn-block" id="validationInscription" type="button" data-placement="bottom" data-toggle="tooltip" data-original-title="Tsindrio rehefa tafiditra ny « pseudo » sy ny « mot de passe »">Enregister</button>
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

	$("#matricule111").mask("999 999"); 
	$("#cin11").mask("999 999 999 999");

</script>
{/literal}