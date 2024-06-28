Array
(
    [0] => stdClass Object
        (
            [FOUND_ROWS] => 10
            [ID_REAL] => 8
            [EXERCICE] => 2023
            [ACTIVITE] => 000
            [INDICATEUR] => 117
            [SOA] => 06-21-0-230-00000
            [COMMUNE] => 220
            [INTITULE] => DIRECTION DE LA DETTE PUBLIQUE /OPERATION DE FINANCEMENT
            [ASSIGNATAIRE] => 10101.000
            [GESTIONNAIRE_ACT] => 06-21-0-233-00000
            [ID_LGCRED] => 11
            [CATEGORIE] => 7
            [COMPTE] => 16111
            [FINANCEMENT] => 10-001-001-A
            [MIN_CODE] => 21
            [MIN_ABREV] => MEF
            [CREDIT_MOD] => 1852723990000
            [ORDRE_PAIEMENT] => 0
            [ORDONNANCEMENT] => 0
            [MANDATEMENT] => 0
            [DORDRE_PAIEMENT] => 0
            [DORDONNANCEMENT] => 0
            [DMANDATEMENT] => 0
            [MVT_ORDONNANCEMENT] => 0
            [MVT_MANDATEMENT] => 0
            [ID_MAND] => 294
            [MAND_NUM_INFO] => 230000000477
            [MAND_UTR_VISA] => 101242119945
            [TYPE_MAND] => MANDAT DE PAIEMENT
            [MAND_NUMERO_LIQ] => 000477
            [MAND_NUMERO_MAND] => 230000000477
            [MAND_NUMERO_BMAND] => 000000000373
            [MAND_DATE_LIQ] => 12/01/23
            [MAND_DATE_ORD] => 12/01/23
            [MAND_DATE_TEF] => 11/01/23
            [MAND_GEST_ACT] => 06-21-0-233-00000
            [MAND_CODE_TIERS] => T10101200
            [MAND_ORDONNATEUR] => 06-220-Z-00000
            [MAND_DATE_RECUP] => 13/01/23
            [MAND_NUMERO_BE] => 000000000373
            [MAND_MODE_PAIE] => OO
            [MAND_CDE] => 10101.220
            [MAND_REJET] => 0
            [MAND_DATE_VISA] => 13/01/23
            [MAND_DATE_REEL_VISA] => 13/01/23
            [MAND_COMPTE_DEBIT] => 16111
            [MAND_COMPTE_CREDIT] => 1838
            [MAND_MONTANT] => 5000000000
            [MAND_TAXE] => 0
            [MAND_LIBELLE] => Emprunts en Ariary a long et moyen terme : part a plus d'un an - Bons
            [MAND_OBJET] => Renouvellement des BTF au nom de CNAPS (Caisse Nationale de Prévoyance Sociale) au titre du mois de janvier 2023

            [MAND_VISA_TEF] => 230000000310
            [TYPE_ENG] => Engagement global
            [MAND_VISA_VALIDE] => 1
            [REF_CONVENTION] => 
            [REJET_OBJET] => 
            [REJET_REF] => 
            [REJET_NOTE] => 
            [MAND_CPTAUX_DEBIT] => 06-21
            [MAND_CPTAUX_CREDIT] => 
            [ECRI_NUM] => 128601
            [MAND_DATE_TRAIT] => 13/01/23
            [TYPE_DEP] => 
            [CODE_ACT] => 220
            [MAND_UTR_RECUP] => 101252084415
            [MAND_LOCKED] => 
            [RJT_NUMERO] => 
            [MAND_UTR_RJT] => 
            [MAND_DT_RJT] => 
            [MAND_VISA_COMPTA] => 
            [CODE_UTILISATEUR] => 101252084415
            [FLAG] => 1
            [OP_REGUL] => 
            [MAND_REGUL] => 
            [MAND_MONTANT_DEVISE] => 
            [DEVISE] => 
            [TAUX_DEVISE] => 
            [MAND_SITE] => 00
            [ENGNUMERO] => 
            [ENTITE] => 10101.000
            [MIN_LIBELLE] => MINISTERE DE L'ECONOMIE ET DES FINANCES
            [ID_MDTVISA] => 88
            [MANDATAIRE] => 10101.200
            [transfert] => Array
                (
                )

            [virement] => Array
                (
                )

        )


<ul>
						    {if sizeof($oGetDetail->transfert)>0}
								
								<li class="text-muted"><h3>INFORMATIONS SUR LE BORDEREAU DE TRANSFERT</h3></li>		
								
									<li class="text-muted"><b>Numéro mandat :</b> {$oGetDetail->transfert->NUMERO_MANDAT}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oGetDetail->transfert->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Assignataire :</b> {$oGetDetail->transfert->ENVOYEUR}</li>
									<li class="text-muted"><b>Mandataire :</b> {$oGetDetail->transfert->DESTINATAIRE}</li>
									<li class="text-muted"><b>Compte :</b> {$oGetDetail->transfert->COMPTE}</li>
									<li class="text-muted"><b>Statut :</b><span class="badge badge-warning">{$oGetDetail->transfert->STATUT}</span></li>
									{if $oGetDetail->transfert->BT_REF!=''}
									<li class="text-muted"><b>Réference ecriture :</b> {$oGetDetail->transfert->DET_ECRI_REF}</li>
									<li class="text-muted"><b>Référence transfert :</b> {$oGetDetail->transfert->BT_REF}</li>
									{/if}
									<br>
									{if $oGetDetail->transfert->BT_ENV_ANNUL_DATE != ""}
									<div class="timeline">
									  <div class="time-label">
										<span class="bg-red">Date de parcours transfert</span>
									  </div>
									 <!-- -->
                                      {assign var="zCreationString" value=$oGetDetail->transfert->BT_ENV_ANNUL_DATE}
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
                                      {assign var="zCreationString" value=$oGetDetail->transfert->BT_ENV_VALID_DATE}
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
                                      {assign var="zCreationString" value=$oGetDetail->transfert->BT_REC_DATE}
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
                                      {assign var="zCreationString" value=$oGetDetail->transfert->BT_REC_VALID_DATE}
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
                                      {assign var="zCreationString" value=$oGetDetail->transfert->BT_REC_VALID_DATE}
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
								{if sizeof($oGetDetail->virement)>0}
								<li class="text-muted"><h3>INFORMATIONS SUR LE VIREMENT</h3></li>	
									<li class="text-muted"><b>Titulaire :</b> {$oGetDetail->virement->TITULAIRE}</li>
									<li class="text-muted"><b>Montant :</b><span class="badge badge-success" style="font-size: 15px;"> {$oGetDetail->virement->MONTANT|number_format:1:",":"."} Ar</span></li>
									<li class="text-muted"><b>Programme :</b> {$oGetDetail->virement->PROGRAMME}</li>
									<li class="text-muted"><b>Réference :</b> {$oGetDetail->virement->REFERENCE}</li>
									<li class="text-muted"><b>Code Tiers :</b> {$oGetDetail->virement->CODE_TIERS}</li>
									<li class="text-muted"><b>Date visa :</b> {$oGetDetail->virement->DATE_VISA}</li>
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
											  {if $oGetDetail->virement->NOTEREF != ""}
											  {assign var="zCreationString" value=$oGetDetail->virement->NOTEDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Note</a>&nbsp;</h3>

											  <div class="timeline-body">
												<b>Réference :</b> {$oGetDetail->virement->NOTEREF}<br>
												<b>Statut :</b> <span class="badge badge-warning">{$oGetDetail->virement->STATUTNOTE}</span><br>
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
											  {if $oGetDetail->virement->DMDVIRREF != ""}
											  {assign var="zCreationString" value=$oGetDetail->virement->DMDVIRDATEVALID}
											  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
											  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
											  <h3 class="timeline-header no-border"><a href="#">Demande</a>&nbsp;</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oGetDetail->virement->DMDVIRREF}<br>
												  <b>Statut :</b> <span>
												  {if $oGetDetail->virement->DMDVIRSTATUS==1}
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
											{if $oGetDetail->virement->OVREF != ""}
											{assign var="teststring" value=$oGetDetail->virement->OVDATEVALID}
											{assign var="testsplit" value=" "|explode:$teststring}
											<div class="timeline-item">
											  <span class="time"><i class="fas fa-clock"></i> {$testsplit[1]}</span>
											  <h3 class="timeline-header"><a href="#">Ordre de virement</a> (OV)</h3>
											  <div class="timeline-body">
												  <b>Réference :</b> {$oGetDetail->virement->OVREF}<br>
												  <b>Payeur :</b> {$oGetDetail->virement->PAYEUR}<br>
												  <b>Statut :</b> <span class="badge badge-warning">{$oGetDetail->virement->STATUT}</span><br>
												  <b>Validation :</b> {$testsplit[0]}
											  </div>
											 {/if}
											</div>
										  </div>
										 
										</div>
									{/if}
							{/if}
							</ul>