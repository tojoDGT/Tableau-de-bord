<form class="form-signin show" id="div_form_login" action="{$zBasePath}user/connect" onsubmit="return validerForm()" method="post">
	<div class="panel panel-danger">
		<div class="panel-body">
			<div class="text-center">
				<img src="{$zBasePath}assets/common/img/logo.png" alt="" class="img-responsive"/>
				<h2>Acceder à mon compte</h2>
			</div>
			<div>
				<input type="Pseudo" id="Pseudo" class="form-control obligatoireLogin" placeholder="Pseudo" name="login" autofocus data-placement="bottom" data-toggle="tooltip" data-original-title="Raha efa manana « compte » ianao dia ampidiro ny « pseudo » anao">
				<span class="br"><br></span>
				<p class="message">Veuillez remplir le pseudo</p>
			</div>
			<div>
				<input type="password" id="Password" class="form-control obligatoireLogin" name="password" placeholder="Mot de passe" data-placement="bottom" data-toggle="tooltip" data-original-title="Ampidiro ny « mot de passe »-nao">
				<span class="br"><br></span>
				<p class="message">Veuillez remplir le mot de passe</p>
			</div>
			<!--<div class="checkbox text-center" >
				<label class="text-center">
					<input type="checkbox" value="remember-me"> Se souvenus demoi
				</label>
			</div>-->
			<button class="btn btn-lg btn-danger btn-block" id="validFormLogin" type="submit" data-placement="bottom" data-toggle="tooltip" data-original-title="Tsindrio rehefa tafiditra ny « pseudo » sy ny « mot de passe »" autofocus>Se connecter</button>
			<div class="checkbox">
				<label class="text-center">
					<small>Changement de pseudo et mot de passe <a href="#" class="resetPass"> Cliquez-ici</a></small>
				</label>
			</div>
			<div class="checkbox">
				<label class="text-center">
					<small>Vous n'avez pas de compte <a href="#" class="signUp">Cliquez-ici</a></small>
				</label>
			</div>
		</div>
		<div class="panel-footer">
			<div>
				<a href="{$zBasePath}assets/pdf/MANUEL_D_UTILISATION.pdf" target="_blank"><span class="fa fa-file-pdf-o text-danger"></span> <small>Télécharger ici le manuel d'utilisation ROHI</small></a>
			</div>
			<div>
				<a href="{$zBasePath}assets/pdf/DECRET.pdf" target="_blank"><span class="fa fa-file-code-o text-danger"></span> <small>Code de Déontologie de l'Administration et de bonne Conduite des agents de l'état</small></a>
			</div>
		</div>
	</div>
</form>