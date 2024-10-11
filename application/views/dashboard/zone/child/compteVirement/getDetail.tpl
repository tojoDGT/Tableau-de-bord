 <div id="detail-{$iEcriNum}" class="card mb-0 detailTj" style="width:100%">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
									<div class="text-muted"><h3>INFORMATIONS SUR LE MANDAT</h3></div>
									<div class="text-muted"><b>TITRE :</b> {$oGetDetail->TITRENUMERO}</div>
									{if $oGetDetail->PCPAYEUR!=""}
									<div class="text-muted"><b>PAYEUR :</b> {$oGetDetail->PCPAYEUR}</div>
									{/if}
									<div class="text-muted"><b>Objet du mandat :</b> {$oGetDetail->DEPENSEOBJET}</div>
									<div class="text-muted"><b>Commune :</b> {$oGetDetail->COMMUNE}</div>
									<div class="text-muted"><b>Exercice :</b> {$oGetDetail->EXERCICE}</div>
									<div class="text-muted"><b>SOA :</b> {$oGetDetail->SOA}</div>
									<div class="text-muted"><b>Financement :</b> {$oGetDetail->FINANCEMENT}</div>
								</div>
								<div class="profile-info-left1">
									<div class="text-muted"><br><h3>INFORMATIONS SUR LE TRAITEMENT</h3></div>
									<br>
									<div class="timeline noPadding">
									  <div class="time-label">
										<span class="bg-green">Traitement et Visa</span>
									  </div>
									  
									  {assign var="zCreationString2" value=$oGetDetail->DATE_VISA}
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
									  {assign var="zCreationString1" value=$oGetDetail->DATERECUPDOSSIER}
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
									  
									</div>
								</div>

								<div class="profile-info-left1">
									<div class="text-muted"><h3>DELAI DE TRAITEMENT</h3></div>
									<ul class="todo-list ui-sortable" data-widget="todo-list">
									  <li>
										{assign var=num1 value=$oGetDetail->DATERECUPDOSSIER|mktimedate}
										{assign var=num2 value=$oGetDetail->DATE_VISA|mktimedate}
										{assign var=diff value=$num1-$num2}
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
						    
								
								<li class="text-muted"><h3>INFORMATIONS SUR LE VIREMENT</h3></li>	
								{if $oGetDetail->NOTEREF != ""}
									<li class="text-muted"><b>Titulaire :</b> {$oGetDetail->TITULAIRE}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oGetDetail->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Programme :</b> {$oGetDetail->PROGRAMME}</li>
									<li class="text-muted"><b>Réference :</b> {$oGetDetail->NOTEREF}</li>
									<li class="text-muted"><b>Code Tiers :</b> {$oGetDetail->TIER_CODE}</li>
									<li class="text-muted"><b>Date visa :</b> {$oGetDetail->DATE_VISA}</li>
									<br>
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
												<small class="badge bg-green">{if $final|round==0} le même jour {else}<i class="far fa-clock"></i> {$final|round} jour{if $final|round>1}s{/if}{/if}</small>
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

