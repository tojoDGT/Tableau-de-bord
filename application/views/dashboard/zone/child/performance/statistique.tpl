<div class="info" id="changeColor">
    <div class="tab-content tab-content-info typography">
        <h5>Information</h5>
        <link href="http://rohi.mef.gov.mg:8088/ROHI/assets/light/assets/css/charts.min.css" rel="stylesheet">
        <div class="mb-0 detailTj" style="font-size:14px;">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-view">
                            <div class="profile-basic1">
                                <div class="row">
                                    <h6>&nbsp;</h6>
                                </div>
                                <div class="col-lg-5 col-sm-7 col-md-5 col-xl-4" style="float:left;margin-top:10px;">
                                    <div class="card">
                                        <br>
                                        <!-- Placez l'image ici pour qu'elle ne soit pas affectée par le scroll -->
                                        <div style="text-align: center; margin-bottom: 20px;">
                                            <img width="50px" height="50px" src="http://rohi.mef.gov.mg:8088/ROHI//assets/img/fpdf/ss/dgt.png">
                                        </div>
                                        <!-- Zone de contenu avec scroll -->
                                        <div class="card-body" style="align-center;">
                                            <div class="pro-deadline m-b-15">
                                                <div class="sub-title">
                                                    <br>Nombre de dossier validé : <strong>{$oGetInfo->VALIDE}</strong>
                                                </div>
                                                <div class="sub-title">Nombre de dossier rejeté : <strong>{$oGetInfo->REJET}</strong></div>
                                            </div>

                                            <p>
												{assign var=num1 value=$oGetInfo->VALIDE/$oGetInfo->VALIDEAUTRE}
                                                <span class="text-success float-end">{$num1|number_format:2:",":"."}%</span>
                                                validés par rapport au autre poste comptable
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-success" role="progressbar" data-bs-toggle="tooltip" title="0.74955908289242%" style="width: 0.74955908289242%"></div>
                                            </div>
											
                                            <p>
                                                {assign var=num2 value=$oGetInfo->REJET/$oGetInfo->REJETAUTRE}
												<span class="text-danger float-end">{$num2|number_format:2:",":"."}%</span>
                                                rejetés par rapport au autre poste comptable
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-danger" role="progressbar" data-bs-toggle="tooltip" title="0.14069353637342%" style="width: 0.14069353637342%"></div>
                                            </div>
											
											<!--
                                            <div class="pro-deadline m-b-15">
                                                <div>
                                                    <br>
                                                    <b>Liste des structures :</b>
                                                </div>
                                                <div class="sub-title">
                                                    <br>
                                                    ACCTDP <br>
                                                    <u>Région</u>
                                                    : Analamanga<br>
                                                    <u>District</u>
                                                    : Antananarivo Renivohitra
                                                </div>
                                                
                                            </div>
											-->
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" style="margin-top:10px;">
									<div class="card">
										<div class="card-body" style="align-center;">
											<div class="pro-deadline m-b-15">
                                                <div class="sub-title">
                                                    <br>Effectif : 17
                                                </div>
                                                <div class="sub-title">Effectif rattaché : 15</div>
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
        .detailTj a.bleu {
            color: #337ab7!important;
            text-decoration: none;
        }
    </style>
   
    
</div>
</div>
