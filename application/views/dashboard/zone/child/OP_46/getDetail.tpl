 <div id="detail-{$iEcriNum}" class="card mb-0 detailTj" style="width:100%">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
									<div class="text-muted"><h3>INFORMATIONS SUR LE TITRE</h3></div>
									
									{if $oGetDetail->CODE_TIERS !=""}
									<div class="text-muted"><b>Code tiers :</b> {$oGetDetail->CODE_TIERS}</div>
									{/if}
									{if $oGetDetail->NUMERO_TITRE !=""}
									<div class="text-muted"><b>Titre numéro :</b> {$oGetDetail->NUMERO_TITRE}</div>
									{/if}
									{if $oGetDetail->MONTANT !=""}
									<div class="text-muted"><b>Montant :</b> {$oGetDetail->MONTANT|number_format:1:",":"."} Ar</div>
									{/if}
									{if $oGetDetail->INTITULE !=""}
									<div class="text-muted"><b>Intitulé :</b> {$oGetDetail->INTITULE}</div>
									{/if}
									{if $oGetDetail->CREATED_AT !=""}
									<div class="text-muted"><b>Création :</b> {$oGetDetail->CREATED_AT}</div>
									{/if}
									{if $oGetDetail->COMPTE_TIERS !=""}
									<div class="text-muted"><b>Compte tiers :</b> {$oGetDetail->COMPTE_TIERS}</div>
									{/if}
									{if $oGetDetail->DOSSIER_ID !=""}
									<div class="text-muted"><b>Dossier :</b> {$oGetDetail->DOSSIER_ID}</div>
									{/if}
									{if $oGetDetail->STATUT !=""}
									<div class="text-muted"><b>Statut :</b> {$oGetDetail->STATUT}</div>
									{/if}
								</div>
								<div class="profile-info-left1">
									<div class="text-muted"><br><h3>INFORMATIONS SUR LE DOSSIER</h3></div>
									<br>
									{if $oGetDetail->OBJET !=""}
									<div class="text-muted"><b>Objet :</b> {$oGetDetail->OBJET}</div>
									{/if}
									{if $oGetDetail->DATE_DOSSIER !=""}
									<div class="text-muted"><b>Dossier :</b> {$oGetDetail->DATE_DOSSIER}</div>
									{/if}
									{if $oGetDetail->PERI_MOIS !=""}
									<div class="text-muted"><b>Mois :</b> {$oGetDetail->PERI_MOIS}</div>
									{/if}
									{if $oGetDetail->PERI_EXERCICE !=""}
									<div class="text-muted"><b>Année :</b> {$oGetDetail->PERI_EXERCICE}</div>
									{/if}
									{if $oGetDetail->VALIDATED_AT !=""}
									<div class="text-muted"><b>Validé le :</b> {$oGetDetail->VALIDATED_AT}</div>
									{/if}
								</div>

								<div class="profile-info-left1">
									<div class="text-muted"><br><h3>INFORMATIONS SUR LE TIERS</h3></div>
									<br>
									{if $oGetDetail->DENOMINATION !=""}
									<div class="text-muted"><b>Dénomination :</b> {$oGetDetail->DENOMINATION}</div>
									{/if}
									{if $oGetDetail->PSTP_LIBELLE !=""}
									<div class="text-muted"><b>Comptable gestionnaire :</b> {$oGetDetail->PSTP_LIBELLE}</div>
									{/if}
									{if $oGetDetail->SIGLE !=""}
									<div class="text-muted"><b>Sigle :</b> {$oGetDetail->SIGLE}</div>
									{/if}
									{if $oGetDetail->VILLE !=""}
									<div class="text-muted"><b>Ville :</b> {$oGetDetail->VILLE}</div>
									{/if}
									{if $oGetDetail->TITRE !=""}
									<div class="text-muted"><b>Responsable :</b> {$oGetDetail->TITRE}</div>
									{/if}
								</div>
							</div>
							
                        </div>                          
                        <div class="col-md-6 profile-info-right">
							<ul>
								<li class="text-muted"><h3>INFORMATIONS SUR LE VIREMENT</h3></li>	
								
									{if $oGetDetail->TITULAIRE !=""}
									<li class="text-muted"><b>Titulaire :</b> {$oGetDetail->TITULAIRE}</li>
									{/if}
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oGetDetail->MONTANT|number_format:1:",":"."} Ar</span></li>
									<br>
									{if $oGetDetail->NOTEDATEVALID !=""}
									<div class="timeline">
										  <!-- timeline time label -->
										  <div class="time-label">
											<span class="bg-red">Parcours sur le dossier</span>
										  </div>
										  <!-- /.timeline-label -->
										  <!-- timeline item -->
										  <div>
											<i class="fas fa-clock bg-gray"></i>
											<div class="timeline-item">
											  {if $oGetDetail->NOTEREF != ""}
											  {assign var="zCreationString" value=$oGetDetail->NOTEDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Note</a>&nbsp;</h3>

											  <div class="timeline-body">
												<b>Réference :</b> {$oGetDetail->NOTEREF}<br>
												<b>Statut :</b> <span class="badge badge-warning">{$oGetDetail->STATUTNOTE}</span><br>
												<b>Validation :</b> {$zCreationSplit[0]}
											  </div>
											  {/if}
											</div>
										  </div>
										  <!-- END timeline item -->
										  <!-- timeline item -->
										  <div>
											<i class="fas fa-clock bg-green"></i>
											<div class="timeline-item">
											  {if $oGetDetail->DMDVIRREF != ""}
											  {assign var="zCreationString" value=$oGetDetail->DMDVIRDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header no-border"><a href="#">Demande</a>&nbsp;</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oGetDetail->DMDVIRREF}<br>
												  <b>Statut :</b> <span>
												  {if $oGetDetail->DMDVIRSTATUS==1}
												  Validé
												  {else}
												  En cours de validation
												  {/if}
												  </span><br>
												  <b>Validation :</b> {$zCreationSplit[0]}
											  </div>
											  {/if}
											</div>
										  </div>
										  <!-- END timeline item -->
										  <!-- timeline item -->
										  <div>
											<i class="fas fa-clock bg-purple"></i>
											{if $oGetDetail->OVREF != ""}
											{assign var="teststring" value=$oGetDetail->DATEEXECUTIONOV}
											{assign var="testsplit" value=" "|explode:$teststring}
											<div class="timeline-item">
											  <span class="time"><i class="fas fa-clock"></i> {$testsplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Ordre de virement</a> (OV)</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oGetDetail->OVREF}<br>
												  <b>Payeur :</b> {$oGetDetail->PCPAYEUR}<br>
												  <b>Statut :</b> <span class="badge badge-warning">{$oGetDetail->STATUS}</span><br>
												  <b>Validation :</b> {$testsplit[0]}
											  </div>
											 {/if}
											</div>
										  </div>
										 
										</div>

										<div class="profile-info-left1">
											<div class="text-muted"><h3>DELAI D'EXECUTION</h3></div>
											<ul class="todo-list ui-sortable" data-widget="todo-list">
											  <li>
												{assign var=num1 value=$oGetDetail->NOTEDATEVALID|mktimedate}
												{assign var=num2 value=$oGetDetail->DATEEXECUTIONOV|mktimedate}
												{assign var=diff value=$num2-$num1}
												{assign var=final value=$diff/86400}
												
												<span class="text">Délai :</span>
												<small class="badge bg-green"><i class="far fa-clock"></i> {$final|round} jour{if $final|round>1}s{/if}</small>
											  </li>
											</ul>
										</div>
									{else}
									<li class="text-muted"><b>Statut :</b> En cours de virement .......</li>
									{/if}
							</ul>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </div>
</div>
<style>
.profile-info-right {
	border-left: 2px dashed #ccc;
}

.profile-info-right li,.alert{
	padding-left:40px!important;
}

.profile-info-right .alert{
	margin-left:40px!important;
}

.timeline-header {
	text-align:left;
}

.timeline>div>.timeline-item>.time {
    font-size: 16px;
}

.timeline {
	margin-left:40px!important;
}

.noPadding {
	margin-left:0px!important;
}

h3 {
	text-align:center;
}
.detailTj a.bleu {
    color: #337ab7!important;
    text-decoration: none;
}
.profile-info-left, ul {
    list-style-type: none;
    padding: 0;
}
.profile-info-left {
    border-right: 2px dashed #ccc;
}
.text-overflow {
    overflow-wrap: break-word;
    word-break: break-word;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    max-width: 300px; /* Adjust based on your layout */
    display: inline-block;
}
.blink {
  animation: blink 1s infinite;
  /*color:red;*/
  font-size:27px;
  font-weight:bold;
}
.todo-list>li .badge {
    font-size: 1rem;
    margin-left: 10px;
}
@keyframes blink { 
  0% { opacity:0; }
  50% { opacity:1; } 
  100% { opacity:0; }
}
</style>
{literal}
<script type="text/javascript">

	var scrollDiv = document.getElementById("detail-{/literal}{$iEcriNum}{literal}").offsetTop+{/literal}{$iOffset}{literal};
	window.scrollTo({ top: scrollDiv, behavior: 'smooth'});
</script>
{/literal}

