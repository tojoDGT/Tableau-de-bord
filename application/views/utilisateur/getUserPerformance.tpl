﻿<div id="detail-{$iUserId}" class="mb-0 detailTj" style="font-size:14px;">
		<div class="card-body1">
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
												<br>- Nombre de dossier validés : <strong style="color:#28a745!important">{$oGetInfo->VALIDE}</strong>
											</div>
											<div class="sub-title">- Nombre de dossier rejetés : <strong style="color:#dc3545!important">{$oGetInfo->REJET}</strong></div>
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

										<!--<div class="pro-deadline m-b-15">
											<div class="sub-title">
												<br>- Durée minimale de traitement de dossier : <strong style="color:#28a745!important">3 Jours</strong>
											</div>
											<div class="sub-title">- Durée maximale de traitement de dossier : <strong style="color:#dc3545!important">21 jours</strong></div>
											<div class="sub-title">- Temps moyen de traitement de dossier : <strong style="color:#28a745!important">5 jours</strong></div>
										</div>-->
										
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
	.sub-title {
		font-size:17px!important;
	}
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

	var scrollDiv = document.getElementById("detail-{$iUserId}").offsetTop+275;
	window.scrollTo({ top: scrollDiv, behavior: 'smooth'});
</script>

