﻿ <div id="detail-{$iEcriNum}" class="card mb-0 detailTj" style="width:100%">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
									<div class="text-muted"><h3>INFORMATIONS SUR LE MANDAT</h3></div>
									<div class="text-muted"><b>Ministère :</b> {if $oGetDetail->MIN_LIBELLE!=""}{$oGetDetail->MIN_LIBELLE}{else}{$oGetDetail->MIN_ABREV}{/if}</div>
									{if $oGetDetail->INTITULE!=""}
									<div class="text-muted"><b>Commune :</b> {$oGetDetail->INTITULE}</div>
									{/if}
									<div class="text-muted"><b>Objet du mandat :</b> {$oGetDetail->MAND_OBJET}</div>
									<div class="text-muted"><b>Type mandat :</b> {$oGetDetail->TYPE_MAND}</div>
									<div class="text-muted"><b>Exercice :</b> {$oGetDetail->EXERCICE}</div>
									<div class="text-muted"><b>SOA :</b> {$oGetDetail->SOA}</div>
									<div class="text-muted"><b>Financement :</b> {$oGetDetail->FINANCEMENT}</div>
									<div class="text-muted"><b>Mode de paiement :</b> 
									{if $oGetDetail->MAND_MODE_PAIE=='VB'}
									Virement bancaire
									{else if $oGetDetail->MAND_MODE_PAIE=='OO'}
									Opération d'ordre
									{else if $oGetDetail->MAND_MODE_PAIE=='BC'}
									Bon de Caisse
									{else if $oGetDetail->MAND_MODE_PAIE=='OP'}
									Ordre de paiement
									{/if}
									</div>
								</div>
								<div class="profile-info-left1">
									<div class="text-muted"><br><h3>INFORMATIONS SUR LE TRAITEMENT</h3></div>
									<br>
									<div class="timeline noPadding">
									  <div class="time-label">
										<span class="bg-green">Traitement et Visa</span>
									  </div>
									  {assign var="zCreationString1" value=$oGetDetail->MAND_DATE_RECUP}
									  {assign var="zCreationSplit1" value=" "|explode:$zCreationString1}
									  <div>
										<i class="fas fa-user bg-olive"></i>
										<div class="timeline-item">
										  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit1[1]}</span>
										  <h3 class="timeline-header"><a href="#">Récuperation</a>&nbsp;</h3>
										  <div class="timeline-body">
											<b>Date :</b> {$zCreationSplit1[0]}
										  </div>
										  
										</div>
									  </div>
									  {assign var="zCreationString2" value=$oGetDetail->MAND_DATE_REEL_VISA}
									  {assign var="zCreationSplit2" value=" "|explode:$zCreationString2}
									  <div>
										<i class="fas fa-user bg-pink"></i>
										<div class="timeline-item">
										  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit2[1]}</span>
										  <h3 class="timeline-header"><a href="#">date du visa</a>&nbsp;</h3>
										  <div class="timeline-body">
											<b>Date du visa :</b> {$zCreationSplit2[0]}
										  </div>
										  
										</div>
									  </div>
									 
									  
									</div>
								</div>

								<div class="profile-info-left1">
									<div class="text-muted"><h3>DELAI DE TRAITEMENT</h3></div>
									<ul class="todo-list ui-sortable" data-widget="todo-list">
									  <li>
										{assign var=num1 value=$oGetDetail->MAND_DATE_RECUP|mktimedate}
										{assign var=num2 value=$oGetDetail->MAND_DATE_REEL_VISA|mktimedate}
										{assign var=diff value=$num2-$num1}
										{assign var=final value=$diff/86400}
										
										<span class="text">Délai :</span>
										<small class="badge badge-info"><i class="far fa-clock"></i> {if $final|round ==0}le même jour{else}{$final|round} jour{if $final|round>1}s{/if}{/if}</small>
									  </li>
									</ul>
								</div>
							</div>
							
                        </div>                          
                        <div class="col-md-6 profile-info-right">
							<ul>
						    {if sizeof($oTransfert)>0}
								
								<li class="text-muted"><h3>INFORMATIONS SUR LE BORDEREAU DE TRANSFERT</h3></li>		
								
									<li class="text-muted"><b>Numéro mandat :</b> {$oTransfert->NUMERO_MANDAT}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oTransfert->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Assignataire :</b> {$oTransfert->ENVOYEUR}</li>
									<li class="text-muted"><b>Mandataire :</b> {$oTransfert->DESTINATAIRE}</li>
									<li class="text-muted"><b>Compte :</b> {$oTransfert->COMPTE}</li>
									<li class="text-muted"><b>Statut :</b><span class="badge badge-warning">{$oTransfert->STATUT}</span></li>
									{if $oTransfert->BT_REF!=''}
									<li class="text-muted"><b>Réference ecriture :</b> {$oTransfert->DET_ECRI_REF}</li>
									<li class="text-muted"><b>Référence transfert :</b> {$oTransfert->BT_REF}</li>
									{/if}
									<br>
									{if $oTransfert->BT_ENV_ANNUL_DATE != ""}
									<div class="timeline">
									  <div class="time-label">
										<span class="bg-red">Date de parcours transfert</span>
									  </div>
									 <!-- -->
                                      {assign var="zCreationString" value=$oTransfert->BT_ENV_ANNUL_DATE}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
											<i class="fas fa-clock bg-blue"></i>
											<div class="timeline-item">
												<span class="time"><i class="fas fa-clock"></i>&nbsp;{$zCreationSplit[1]} </span>
												<h3 class="timeline-header"><a href="#">Création</a>&nbsp;</h3>
												<div class="timeline-body">
													<b>Date :</b>{$zCreationSplit[0]}<br>
												</div>
											</div>
									   </div> 
									  <!-- -->
									  <!-- -->
                                      {assign var="zCreationString" value=$oTransfert->BT_ENV_VALID_DATE}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
											<i class="fas fa-clock bg-purple"></i>
											<div class="timeline-item">
												<span class="time"><i class="fas fa-clock"></i>&nbsp;{$zCreationSplit[1]} </span>
												<h3 class="timeline-header"><a href="#">Envoi </a>&nbsp;</h3>
												<div class="timeline-body">
													<b>Date :</b>{$zCreationSplit[0]}<br>
												</div>
											</div>
									   </div> 
									  <!-- -->
									  <!-- -->
                                      {assign var="zCreationString" value=$oTransfert->BT_REC_DATE}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
											<i class="fas fa-clock bg-green"></i>
											<div class="timeline-item">
												<span class="time"><i class="fas fa-clock"></i>&nbsp;{$zCreationSplit[1]} </span>
												<h3 class="timeline-header"><a href="#">Date de couverture </a>&nbsp;</h3>
												<div class="timeline-body">
													<b>Date :</b>{$zCreationSplit[0]}<br>
												</div>
											</div>
									   </div> 
									  <!-- -->
									  <!-- -->
                                      {assign var="zCreationString" value=$oTransfert->BT_REC_VALID_DATE}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
											<i class="fas fa-clock bg-fuchsia"></i>
											<div class="timeline-item">
												<span class="time"><i class="fas fa-clock"></i>&nbsp;{$zCreationSplit[1]} </span>
												<h3 class="timeline-header"><a href="#">Date de la validation du couverture</a>&nbsp;</h3>
												<div class="timeline-body">
													<b>Date :</b>{$zCreationSplit[0]}<br>
												</div>
											</div>
									   </div> 
									  <!-- -->
									  <!-- -->
                                      {assign var="zCreationString" value=$oTransfert->BT_REC_VALID_DATE}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
											<i class="fas fa-clock bg-red"></i>
											<div class="timeline-item">
												<span class="time"><i class="fas fa-clock"></i>&nbsp;{$zCreationSplit[1]} </span>
												<h3 class="timeline-header"><a href="#">Validation transfert</a>&nbsp;</h3>
												<div class="timeline-body">
													<b>Date :</b>{$zCreationSplit[0]}<br>
												</div>
											</div>
									   </div> 
									  <!-- -->
									</div>
									{/if}
							{else}
								
								<li class="text-muted"><h3>INFORMATIONS SUR LE VIREMENT</h3></li>	
								{if sizeof($oVirement)>0}
									<li class="text-muted"><b>Titulaire :</b> {$oVirement->TITULAIRE}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oVirement->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Programme :</b> {$oVirement->PROGRAMME}</li>
									<li class="text-muted"><b>Réference :</b> {$oVirement->REFERENCE}</li>
									<li class="text-muted"><b>Code Tiers :</b> {$oVirement->CODE_TIERS}</li>
									<li class="text-muted"><b>Date visa :</b> {$oVirement->DATE_VISA}</li>
									<br>
									<div class="timeline">
										  <!-- timeline time label -->
										  <div class="time-label">
											<span class="bg-red">Parcous sur le dossier</span>
										  </div>
										  <!-- /.timeline-label -->
										  <!-- timeline item -->
										  <div>
											<i class="fas fa-clock bg-gray"></i>
											<div class="timeline-item">
											  {if $oVirement->NOTEREF != ""}
											  {assign var="zCreationString" value=$oVirement->NOTEDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Note</a>&nbsp;</h3>

											  <div class="timeline-body">
												<b>Réference :</b> {$oVirement->NOTEREF}<br>
												<b>Statut :</b> <span class="badge badge-warning">{$oVirement->STATUTNOTE}</span><br>
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
											  {if $oVirement->DMDVIRREF != ""}
											  {assign var="zCreationString" value=$oVirement->DMDVIRDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header no-border"><a href="#">Demande</a>&nbsp;</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oVirement->DMDVIRREF}<br>
												  <b>Statut :</b> <span>
												  {if $oVirement->DMDVIRSTATUS==1}
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
											{if $oVirement->OVREF != ""}
											{assign var="teststring" value=$oVirement->OVDATEVALID}
											{assign var="testsplit" value=" "|explode:$teststring}
											<div class="timeline-item">
											  <span class="time"><i class="fas fa-clock"></i> {$testsplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Ordre de virement</a> (OV)</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oVirement->OVREF}<br>
												  <b>Payeur :</b> {$oVirement->PAYEUR}<br>
												  <b>Statut :</b> <span class="badge badge-warning">{$oVirement->STATUT}</span><br>
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
												{assign var=num1 value=$oVirement->NOTEDATEVALID|mktimedate}
												{assign var=num2 value=$oVirement->OVDATEVALID|mktimedate}
												{assign var=diff value=$num2-$num1}
												{assign var=final value=$diff/86400}
												
												<span class="text">Délai :</span>
												<small class="badge bg-green"><i class="far fa-clock"></i> {$final|round} jour{if $final|round>1}s{/if}</small>
											  </li>
											</ul>
										</div>
									{else}
									<li class="text-muted"><b>Libellé :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Numéro mandat :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Montant :</b><span class="bg-success"> .... Ar</span></li>
									<li class="text-muted"><b>Titulaire :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Programme :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Date visa :</b> &nbsp;&nbsp;&nbsp;</li>
									{/if}
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

	var scrollDiv = document.getElementById("detail-{/literal}{$iEcriNum}{literal}").offsetTop+600;
	window.scrollTo({ top: scrollDiv, behavior: 'smooth'});
</script>
{/literal}

