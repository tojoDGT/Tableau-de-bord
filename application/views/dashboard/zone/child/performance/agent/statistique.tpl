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
                                <div class="col-lg-10 col-sm-10 col-md-6 col-xl-6" style="float:left;margin-top:10px;">
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
                                                    <br>Nombre de dossier validé : <a href="#" onclick="$('#tab3').click()"><strong style="color:#28a745!important">{$oGetInfo->VALIDE}</strong></a>
                                                </div>
                                                <div class="sub-title">Nombre de dossier rejetés : <a onclick="$('#tab4').click()" href="#"><strong style="color:#dc3545!important">{$oGetInfo->REJET}</strong></a></div>
                                            </div>

                                            <p>
												{assign var=sum value=$oGetInfo->VALIDE+$oGetInfo->REJET}
												{assign var=num1 value=$oGetInfo->VALIDE*100/$sum}
                                                <span class="text-success float-end">{$num1|number_format:2:",":"."}%</span>
                                                de dossier validés 
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-success" role="progressbar" data-bs-toggle="tooltip" title='{$num1}%' style='width: {$num1}%'></div>
                                            </div>
											
                                            <p>
                                                {assign var=num2 value=$oGetInfo->REJET*100/$sum}
												<span class="text-danger float-end">{$num2|number_format:2:",":"."}%</span>
                                                de dossier rejetés 
                                            </p>
                                            <div class="progress progress-xs mb-0">
                                                <div class="progress-bar bg-danger" role="progressbar" data-bs-toggle="tooltip" title='{$num2}%' style='width: {$num2}%'></div>
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
									<!-- début Stat ----->
									 <div class="card card-primary">
										  <div class="card-header">
											<h3 class="card-title" style="color:white">Statut de dossier par mois</h3>

											<div class="card-tools">
											  <button type="button" class="btn btn-tool" data-card-widget="collapse">
												<i class="fas fa-minus"></i>
											  </button>
											  <button type="button" class="btn btn-tool" data-card-widget="remove">
												<i class="fas fa-times"></i>
											  </button>
											</div>
										  </div>
										  <div class="card-body">
											<div class="chart">
											  <canvas id="areaChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
											</div>
										  </div>
										  <div class="card">
												<table class="eka" style="text-align:center" id="highcharts-data-table-0"><caption class="highcharts-table-caption"> Situation de dossier : Diagramme en baton</caption><thead><tr><th scope="col" class="text">Catégorie</th><th scope="col" class="text">EPN</th><th scope="col" class="text">ETAT</th><th scope="col" class="text">COMMUNE</th><th scope="col" class="text">REGION</th></tr></thead><tbody><tr><th scope="row" class="text">2 024</th><td class="text">0</td><td class="text">9 775</td><td class="text">0</td><td class="text">0</td></tr></tbody></table>
										  </div>
										  <!-- /.card-body -->
										</div>
									<!-- fin stat ----->
                                </div>
                                <div class="col-lg-6" style="float:left;margin-top:10px;">
									<div class="card">
										<div class="card-body" style="align-center;">
											 <canvas id="structurePyramidChart"></canvas>
											<br>
											<br>
											<canvas id="mefPyramidChart"></canvas>
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
   <script type="text/javascript">
        const ctx = document.getElementById("structurePyramidChart").getContext('2d');

		const data = [{
            {$zAfficheValide}
           
        }, {
            {$zAfficheRefus}
        }];

		
        const structure_title = 'ACCTDP';

        const Refuses = Object.values(data[1]);
        const Valides = Object.values(data[0]); 

        const barChartData = {
            labels: Refuses.map(val=>val.Mois).reverse(),
            datasets: [{
                label: "Validé",
                backgroundColor: "#3765b0",
                data: Valides.map(val=>-Number(val.Nombre)).reverse(),
            }, {
                label: "Refusé",
                backgroundColor: "#d41111",
                data: Refuses.map(val=>Number(val.Nombre)).reverse(),
            }],
        };

        const commonXAxesOptions = {
            ticks: {
                beginAtZero: true,
                callback: function(value) {
                    return Math.abs(value);
                    // Retourne la valeur absolue
                }
            }
        };

        new Chart(ctx,{
            type: "horizontalBar",
            data: barChartData,
            options: {
                scales: {
                    xAxes: [commonXAxesOptions],
                    yAxes: [{
                        ticks: {
                            reverse: true,
                            callback: function(value, index, values) {
                                return index % 4 === 0 ? Math.abs(value) : null;
                            }
                        },
                        barPercentage: 2.5,
                        categoryPercentage: 0.35
                    }]
                },
                legend: {
                    labels: {
                        usePointStyle: true // Utiliser des icônes personnalisées
                    }
                }
            }
        });

        
		

		const ctx1 = 
            document.getElementById('mefPyramidChart').getContext('2d');
        new Chart(ctx1, {
            type: 'radar',
            data: {
                labels:
                    ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre,','Octobre','Novembre','Décembre'],
                datasets: [{
                    label: 'Validés',
                    {$zAfficheRadarValide}
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                },
                {
                    label: 'Refusés',
                    {$zAfficheRadarRefus}
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 2,
                }]
            },
            options: {
                scale: {
                    pointLabels: {
                        fontSize: 14,
                    }
                }
            }
        });
    </script>
    <script>
 $(function () {

		var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
		var areaChartData = {
			  labels  : ['Janv', 'Févr', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil','Août', 'Sept', 'Oct', 'Nov', 'Déc'],
			  datasets: [{$zReturnStatut}]
			}

		var lineChartOptions = $.extend(true, {}, areaChartOptions)
		var lineChartData = $.extend(true, {}, areaChartData)
		lineChartData.datasets[0].fill = false;
		lineChartData.datasets[1].fill = false;
		lineChartData.datasets[2].fill = false;
		lineChartData.datasets[3].fill = false;
		//lineChartData.datasets[4].fill = false;
		lineChartOptions.datasetFill = false


		 // This will get the first returned node in the jQuery collection.
		new Chart(areaChartCanvas, {
		  type: 'line',
		  data: lineChartData,
		  options: lineChartOptions
		})

		var areaChartOptions = {
			  maintainAspectRatio : true,
			  responsive : true,
			  legend: {
				display: true
			  },
			  scales: {
				xAxes: [{
				  gridLines : {
					display : true,
				  }
				}],
				yAxes: [{
				  gridLines : {
					display : true,
				  }
				}]
			  }
		}
 })
</script>
</div>
</div>
