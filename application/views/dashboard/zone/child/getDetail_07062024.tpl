  <div class="card mb-0 detailTj" style="width:100%">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
									<div class="text-muted"><h3>INFORMATIONS SUR LE MANDAT</h3></div>
									<div class="text-muted"><b>Ministère :</b> {$oGetDetail->MIN_LIBELLE}</div>
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
									<div class="text-muted"><b>Date traitement :</b> {$oGetDetail->MAND_DATE_TRAIT}</div>
									<div class="text-muted"><b>Date du visa :</b> {$oGetDetail->MAND_DATE_VISA}</div>
								</div>
							</div>
                        </div>                          
                        <div class="col-md-6 profile-info-right">
							<ul>
						    {if $iTransfert==1}
								<li class="text-muted"><h3>INFORMATIONS SUR LE BORDEREAU DE TRANSFERT</h3></li>		
								{if sizeof($oTransfert)>0}
									<li class="text-muted"><b>Réference ecriture :</b> {$oTransfert->DET_ECRI_REF}</li>
									<li class="text-muted"><b>Numéro mandat :</b> {$oTransfert->DET_BT_MANDAT}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oTransfert->DET_BT_ENV_MT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Envoyeur :</b> {$oTransfert->ENVOYEUR}</li>
									<li class="text-muted"><b>Destinataire :</b> {$oTransfert->DESTINATAIRE}</li>
									<li class="text-muted"><b>Compte :</b> {$oTransfert->BT_COMPTE}</li>
									<li class="text-muted"><b>Statut :</b><span class="badge badge-warning">{$oTransfert->STATUT}</span></li>
									<li class="text-muted"><b>Référence transfert :</b> {$oTransfert->BT_REF}</li>
									<br>
									{if $oTransfert->BT_ENV_ANNUL_DATE != ""}
									<div class="alert alert-success alert-dismissible">
									  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
									  <h5><i class="icon fas fa-check"></i> Date</h5>
									  <b>Création :</b> {$oTransfert->BT_ENV_ANNUL_DATE}<br>
									  <b>Date d'envoi :</b> {$oTransfert->BT_ENV_VALID_DATE}<br>
									  <b>Date de couverture :</b> {$oTransfert->BT_REC_DATE}<br>
									  <b>Date de la validation du couverture :</b> {$oTransfert->BT_REC_VALID_DATE}<br>
									  <b>Validation transfert :</b> {$oTransfert->BT_REC_VALID_DATE}<br>
									</div>
									{/if}
									
								{else}
									<li class="text-muted"><b>Libellé :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Numéro mandat :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success"> .... Ar</span></li>
									<li class="text-muted"><b>Réference ecriture :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Référence transfert :</b> &nbsp;&nbsp;&nbsp;</li>
									<li class="text-muted"><b>Validation transfert :</b> &nbsp;&nbsp;&nbsp;</li>
								
								{/if}
							{else}
								<li class="text-muted"><h3>INFORMATIONS SUR LE VIREMENT</h3></li>	
								{if sizeof($oVirement)>0}
									<li class="text-muted"><b>Titulaire :</b> {$oVirement->TITULAIRE}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oVirement->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Programme :</b> {$oVirement->PROGRAMME}</li>
									<li class="text-muted"><b>Date visa :</b> {$oVirement->DATE_VISA}</li>
									<br>
									<div class="card-body1">
										{if $oVirement->NOTEREF != ""}
										<div class="alert alert-info alert-dismissible">
										  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
										  <h5><i class="icon fas fa-info"></i> NOTE</h5>
										  <b>Réference :</b> {$oVirement->NOTEREF}<br>
										  <b>Statut :</b> <span class="badge badge-warning">{$oVirement->STATUTNOTE}</span><br>
										  <b>Validation :</b> {$oVirement->NOTEDATEVALID}
										</div>
										{/if}
										{if $oVirement->DMDVIRREF != ""}
										<div class="alert alert-warning alert-dismissible">
										  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
										  <h5><i class="icon fas fa-file"></i> Demande</h5>
										  <b>Réference :</b> {$oVirement->DMDVIRREF}<br>
										  <b>Statut :</b> <span class="badge badge-warning">
										  {if $oVirement->DMDVIRSTATUS==1}
										  Validé
										  {else}
										  En cours de validation
										  {/if}
										  </span><br>
										  <b>Validation :</b> {$oVirement->DMDVIRDATEVALID}
										</div>
										{/if}
										{if $oVirement->OVREF != ""}
										<div class="alert alert-success alert-dismissible">
										  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
										  <h5><i class="icon fas fa-check"></i> Ordre de virement (OV)</h5>
										  <b>Réference :</b> {$oVirement->OVREF}<br>
										  <b>Payeur :</b> {$oVirement->PAYEUR}<br>
										  <b>Statut :</b> 
										  <span>
										  {if $oVirement->OVSTATUS == 2}
										  Executé
										  {else if $oVirement->OVSTATUS == 1}
										  En attente d'execution
										  {/if}
										  </span><br>
										  <b>Validation :</b> {$oVirement->OVDATEVALID}
										</div>
										{/if}
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
</style>
