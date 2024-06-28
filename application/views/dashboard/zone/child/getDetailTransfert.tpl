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
									<div class="text-muted"><b>Ministère :</b> {if $toGetDetail.0->MIN_LIBELLE!=""}{$toGetDetail.0->MIN_LIBELLE}{else}{$toGetDetail.0->MIN_ABREV}{/if}</div>
									{if $toGetDetail.0->INTITULE!=""}
									<div class="text-muted"><b>Commune :</b> {$toGetDetail.0->INTITULE}</div>
									{/if}
									{* <div class="text-muted"><b>Objet du mandat :</b> {$toGetDetail.0->MAND_OBJET}</div> *}
									<div class="text-muted"><b>Type mandat :</b> {$toGetDetail.0->TYPE_MAND}</div>
									<div class="text-muted"><b>Exercice :</b> {$toGetDetail.0->EXERCICE}</div>
									<div class="text-muted"><b>SOA :</b> {$toGetDetail.0->SOA}</div>
									<div class="text-muted"><b>Financement :</b> {$toGetDetail.0->FINANCEMENT}</div>
									<div class="text-muted"><b>Mode de paiement :</b> 
									{if $toGetDetail.0->MAND_MODE_PAIE=='VB'}
									Virement bancaire
									{else if $toGetDetail.0->MAND_MODE_PAIE=='OO'}
									Opération d'ordre
									{else if $toGetDetail.0->MAND_MODE_PAIE=='BC'}
									Bon de Caisse
									{else if $toGetDetail.0->MAND_MODE_PAIE=='OP'}
									Ordre de paiement
									{/if}
									</div>
								</div>
								<div class="profile-info-left1">
									<div class="text-muted"><h3>PERFORMANCE DES POSTES COMPTABLES</h3></div>
									<ul class="todo-list ui-sortable" data-widget="todo-list">
									  <li>
										
										<span class="text">Délai :</span>
										<small class="badge badge-info"><i class="far fa-clock"></i> 7 jours</small>
										<div class="tools">
										  <i class="fas fa-edit"></i>
										  <i class="fas fa-trash-o"></i>
										</div>
									  </li>
									</ul>
								</div>

								
							</div>
							
                        </div>                          
                        <div class="col-md-6 profile-info-right">
								<div class="text-muted"><h3>INFORMATIONS SUR LE TRAITEMENT</h3><br></div>
									<div class="timeline noPadding1">
									  <div class="time-label">
										<span class="bg-green">Traitement et Visa</span>
									  </div>
									  {assign var="zCreationString" value=$toGetDetail.0->MAND_DATE_RECUP}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
										<i class="fas fa-user bg-olive"></i>
										<div class="timeline-item">
										  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
										  <h3 class="timeline-header"><a href="#">Récuperation</a>&nbsp;</h3>
										  <div class="timeline-body">
											<b>Date :</b> {$zCreationSplit[0]}
										  </div>
										  
										</div>
									  </div>
									  {assign var="zCreationString" value=$toGetDetail.0->MAND_DATE_REEL_VISA}
									  {assign var="zCreationSplit" value=" "|explode:$zCreationString}
									  <div>
										<i class="fas fa-user bg-pink"></i>
										<div class="timeline-item">
										  <span class="time"><i class="fas fa-clock"></i> {$zCreationSplit[1]}</span>
										  <h3 class="timeline-header"><a href="#">date du visa</a>&nbsp;</h3>
										  <div class="timeline-body">
											<b>Date du visa :</b> {$zCreationSplit[0]}
										  </div>
										  
										</div>
									  </div>
									</div>

                        </div>

						<div class="col-md-12">
							<table>
								<tr class="table-warning">
									<th>Libellé</th>
									<th style="width:500px;">Objet</th>
									<th>Compte</th>
									<th>Montant</th>
									<th>Mode de paiement</th>
									<th>Date</th>
								</tr>
								 {foreach from=$toGetDetail item=$oGetDetail}
								 {assign var="zClass" value=""}
										{if $oGetDetail->MAND_MODE_PAIE=='OO'}
										{assign var="zClass" value="table-success"}
										{else}
										{assign var="zClass" value="table-primary"}
										{/if}
								<tr class="{$zClass}">
									<td>{$oGetDetail->MAND_LIBELLE}</td>
									<td>{$oGetDetail->MAND_OBJET}</td>
									<td>{$oGetDetail->COMPTE}</td>
									<td>{$oGetDetail->MAND_MONTANT|number_format:1:",":"."} Ar</td>
									<td>{if $oGetDetail->MAND_MODE_PAIE=='VB'}
									Virement bancaire
									{else if $oGetDetail->MAND_MODE_PAIE=='OO'}
									Opération d'ordre
									{else if $oGetDetail->MAND_MODE_PAIE=='BC'}
									Bon de Caisse
									{else if $oGetDetail->MAND_MODE_PAIE=='OP'}
									Ordre de paiement
									{/if}</td>
									<td>{$oGetDetail->MAND_DATE_VISA}</td>
								</tr>
								{/foreach}
							</table>
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

.table>thead {
    vertical-align: bottom;
}
.table-warning {
    --mdb-table-color: #000;
    --mdb-table-bg: #faecd1;
    --mdb-table-border-color: #c8bda7;
    --mdb-table-striped-bg: #eee0c7;
    --mdb-table-striped-color: #000;
    --mdb-table-active-bg: #e1d4bc;
    --mdb-table-active-color: #000;
    --mdb-table-hover-bg: #e7dac1;
    --mdb-table-hover-color: #000;
    color: var(--mdb-table-color);
    border-color: var(--mdb-table-border-color);
}

.OO {
    --mdb-table-color: #000;
    --mdb-table-bg: #d0eddb;
    --mdb-table-border-color: #a6beaf;
    --mdb-table-striped-bg: #c6e1d0;
    --mdb-table-striped-color: #000;
    --mdb-table-active-bg: #bbd5c5;
    --mdb-table-active-color: #000;
    --mdb-table-hover-bg: #c0dbcb;
    --mdb-table-hover-color: #000;
    color: var(--mdb-table-color);
    border-color: var(--mdb-table-border-color);
}

.VB {
	--mdb-table-color: #000;
    --mdb-table-bg: #ecedf0;
    --mdb-table-border-color: #bdbec0;
    --mdb-table-striped-bg: #e0e1e4;
    --mdb-table-striped-color: #000;
    --mdb-table-active-bg: #d4d5d8;
    --mdb-table-active-color: #000;
    --mdb-table-hover-bg: #dadbde;
    --mdb-table-hover-color: #000;
    color: var(--mdb-table-color);
    border-color: var(--mdb-table-border-color);
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

