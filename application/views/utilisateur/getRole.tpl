 <div id="detail" class="card mb-0 detailTj" style="width:100%">
    <div class="card-body1">
        <div class="row">
            <div class="col-md-12" style="padding-right:0px;">
                <div class="profile-basic">
                    <div class="row noPadding">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
													<div class="card card-primary card-outline">
															  <div class="card-body box-profile">
																<div class="text-center">
																  <img class="profile-user-img img-fluid img-circle" src="{$zBasePath}assets/common/dist/img/non-user.jpg" alt="User profile picture">
																</div>

																<h3 class="profile-username text-center">{$toGetInfoAgent.0.FULLNAME}</h3>

																<p class="text-muted"><strong>Fonction :</strong> {$toGetInfoAgent.0.ACTIVITYFUNCTION}</p>
																<p class="text-muted"><strong>Entité :</strong> {$toGetInfoAgent.0.ACTIVITYNAME}</p>
																<p class="text-muted"><strong>Adresse d'activité :</strong> {$toGetInfoAgent.0.ACTIVITYADRS}</p>
																

																<div class="text-muted"><h3>Rôle</h3></div>
																<ul class="list-group list-group-unbordered mb-3">
																  <li class="list-group-item">
																	<b>Nom de rôle :</b> <a class="float-right">{$toGetInfoAgent.0.ROLETYPENAME}</a>
																  </li>
																  <li class="list-group-item">
																	<b>Type de Rôle :</b> <a class="float-right">{$toGetInfoAgent.0.ROLETYPE}</a>
																  </li>
																  <li class="list-group-item">
																	<b>Libellé Rôle</b> <a class="float-right">{$toGetInfoAgent.0.ROLETYPELIB}</a>
																  </li>
																 
																</ul>
																
															  </div>
															  <!-- /.card-body -->
													</div>
								</div>
								<div class="profile-info-left1">
									
								</div>

								<div class="profile-info-left1">
									
									
								</div>
							</div>
							
                        </div>                          
                        <div class="profile-info-right">
											
									 <div class="card card-primary">
											<div class="card-header">
											  <h3 class="card-title text-center">Accessibilité sur les applications</h3>
											</div>
										<div class="card-body p-0">
											<div class="mailbox-read-message">
												<div class="col-md-6" style="float:left;">
													<table >
														{assign var=iIncrement value=0}
														{foreach from=$toGetAllApplication item=$oGetAllApplication}
														{if $iIncrement<12}
														<tr>
															<td><strong>{$oGetAllApplication.ROLEAPPLILIB} : </strong></td>
															<td>
																	<div class="form-group clearfix">
																		  <div class="icheck-success d-inline">
																			<input type="radio" name="radioDanger{$iIncrement}" {if $oGetAllApplication.ROLEAPPLIID|in_array:$toApplicationId} checked="checked" {/if} id="radioDanger{$iIncrement}">
																			<label for="radioDanger{$iIncrement}">
																			</label>
																		  </div>
																	</div>
															</td>
														</tr>
														{/if}
														{assign var=iIncrement value=$iIncrement+1}
														{/foreach}
													</table>
												</div>
												<div class="col-md-6" style="float:right;">
												<table>
													{assign var=iIncrement value=0}
													{foreach from=$toGetAllApplication item=$oGetAllApplication}
													{if $iIncrement>=12}
													<tr>
														<td><strong>{$oGetAllApplication.ROLEAPPLILIB} : </strong></td>
														<td>
																<div class="form-group clearfix">
																	  <div class="icheck-success d-inline">
																		<input type="radio" name="radioDanger{$iIncrement}" {if $oGetAllApplication.ROLEAPPLIID|in_array:$toApplicationId} checked="checked" {/if}  id="radioDanger{$iIncrement}">
																		<label for="radioDanger{$iIncrement}">
																		</label>
																	  </div>
																</div>
														</td>
													</tr>
													{/if}
													{assign var=iIncrement value=$iIncrement+1}
													{/foreach}
												</table>
												</div>
											</div>
										</div>
									 </div>
									
                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </div>
</div>
<style>
.card-body1 {
    padding-top: 1.25rem;
}
.profile-info-right {
	border-left: 2px dashed #ccc;
	padding-left:20px;
	width:50%;
}

table.table-bordered.dataTable th, 
table.table-bordered.dataTable td {
    border-left-width: 1px!important;
	border-bottom-width: 1px!important;
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
	margin-right:0px!important;
}

h3.card-title {
	text-align:center!important;
	color:#fff;
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

