 <div id="detail" class="card mb-0 detailTj" style="width:100%">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <div class="profile-basic">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile-info-left1">
								<div class="profile-info-left1">
													<div class="card card-primary card-outline">
															  <div class="card-body box-profile">
																<div class="text-center">
																  <img class="profile-user-img img-fluid img-circle" src="{$zBasePath}assets/common/dist/img/non-user.jpg" alt="User profile picture">
																</div>

																<h3 class="profile-username">{$toGetInfoAgent.0.FULLNAME}</h3>

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
                        <div class="col-md-6 profile-info-right">
																	<div class="card card-success">
												  <div class="card-header">
													<h3 class="card-title txt-center">Accessibilité sur les applications</h3>
												  </div>
												  <div class="card-body">
													<!-- Minimal style -->
													<div class="row">
													 
													</div>
													<!-- Minimal red style -->
													<div class="row">
													  
													  <div class="col-sm-8">
														<!-- radio -->

														{foreach from=$toGetAllApplication item=$oGetAllApplication}
														<div class="form-group clearfix">
														  <div class="icheck-danger d-inline">
															 <label for="radioDanger1">
																{$oGetAllApplication.ROLEAPPLILIB}
															</label>
															<input type="radio" name="r2" checked="" id="radioDanger1">
															
														  </div>
														</div>
														{/foreach}

													  </div>
													</div>
													<!-- Minimal red style -->
													
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

