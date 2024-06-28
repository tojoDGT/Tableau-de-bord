<!------------------------------------------------------------->
<div class="row">
	<div class="col-xs-12">
			<div class="box box-primary">
					<div class="box-header with-border">
					  <h3 class="box-title">Formulaire 1 </h3>
					</div>
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
			  </div>
	</div>
</div>
<!------------------------------------------------------------->
