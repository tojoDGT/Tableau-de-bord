<section class="content">
      <div class="container-fluid">
        <div class="row">
		  <!----- debut bloc de recherche -->
		   <div class="col-md-12">
		   <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">RECHERCHE</h3>
              </div>
              <div class="card-body">
					<form method="Post" action="">
					  <div class="row">
								<div class="col-sm-6">
									  <!-- select -->
									  <div class="form-group">
										<label>Année :</label>
										<select id="iAnneeExercice" name="iAnneeExercice" class="custom-select">
											<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
											<option {if $iAnneeExercice=='2024'}selected="selected"{/if} value="2024">2024</option>
										</select>
									  </div>
								</div>
								<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-2">
									  <!-- checkbox -->
									  <div class="form-group">
									  <label>Affichage :</label>
										<div class="custom-control custom-radio">
										  <input class="custom-control-input" type="radio" id="customRadio1" name="iModeAffichage" value="1" {if $iModeAffichage==1}checked="checked"{/if}>
										  <label for="customRadio1" class="custom-control-label">Nombre</label>
										</div>
									  </div>
									</div>
									<div class="col-sm-3">
									  <!-- radio -->
									  <div class="form-group">
										<label>&nbsp;</label>
										<div class="custom-control custom-radio">
										  <input class="custom-control-input" type="radio" id="customRadio2" name="iModeAffichage" value="2"  {if $iModeAffichage==2}checked="checked"{/if}>
										  <label for="customRadio2" class="custom-control-label">Montant</label>
										</div>
									  </div>
									  
									</div>
									<div class="form-group" style="padding-top: 25px;">
										<label>&nbsp;</label>
										<button type="submit" class="searchTb partielSearchHeader partielSearchHeader1">Rechercher</button>
									</div>
								  </div>
							</div>
					  </div>
					  
					  <div class="form-group">
					  </div>
					</form>
              </div>
              <!-- /.card-body -->
            </div>
		  </div>
		  <!----- fin bloc de recherche -->
          <div class="col-md-6">
            <!-- AREA CHART -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Propriétaire code : Graphique en ligne</h3>

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
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Type de mandat : diagramme à bandes</h3>

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
                <canvas id="barChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- PIE CHART -->
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">Mode de paiement : diagramme circulaire</h3>

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
                <canvas id="pieChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">
            <!-- LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Type de mandat : graphique à barres empilées</h3>

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
                  <canvas id="stackedBarChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Mode de paiement : Diagramme de surface</h3>

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
                  <canvas id="lineChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- STACKED BAR CHART -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Propriétaire code : graphique Donut</h3>

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
                  <canvas id="donutChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

			

          </div>
          <!-- /.col (RIGHT) -->
		  <!--
		  <div class="col-md-12">

					<div class="card card-primary">
					  <div class="card-header">
						<h3 class="card-title">Entité : graphique Donut</h3>

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
						  <canvas id="EntiteChart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%;"></canvas>
						</div>
					  </div>
					  
				    </div>
					
			</div>
			-->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
<script src="{$zBasePath}assets/common/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{$zBasePath}assets/common/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="{$zBasePath}assets/common/plugins/chart.js/Chart.min.js"></script>
<style>
h1, h2, h3, h4, h5, h6 {
    color: #ffff; 
}
</style>
<script>
 $(function () {

	var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
	var areaChartData = {
		  labels  : ['Janv', 'Févr', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil','Août', 'Sept', 'Oct', 'Nov', 'Déc'],
		  datasets: [{$zReturn}]
		}

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

	var areaChartData1 = {
		  labels  : ['Janv', 'Févr', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil','Août', 'Sept', 'Oct', 'Nov', 'Déc'],
		  datasets: [{$zReturnModePaiement}]
		}

	var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
    var lineChartOptions = $.extend(true, {}, areaChartOptions)
    var lineChartData = $.extend(true, {}, areaChartData1)
    lineChartData.datasets[0].fill = false;
    lineChartData.datasets[1].fill = false;
    lineChartOptions.datasetFill = false

    var lineChart = new Chart(lineChartCanvas, {
      type: 'line',
      data: lineChartData,
      options: lineChartOptions
    })

	 //-------------
    //- BAR CHART -
    //-------------

	var barChartData = {
		  labels  : ['Janv', 'Févr', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil','Août', 'Sept', 'Oct', 'Nov', 'Déc'],
		  datasets: [{$zReturnTypeMand}]
		}
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = $.extend(true, {}, barChartData)
    var temp0 = barChartData.datasets[0]
    var temp1 = barChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    new Chart(barChartCanvas, {
      type: 'bar',
      data: barChartData,
      options: barChartOptions
    })


	//-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
		{$zReturnDonut}
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    })

	var pieData        = {
		{$zReturnPie}
    }

	//-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
    var pieData        = pieData;
    var pieOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    new Chart(pieChartCanvas, {
      type: 'pie',
      data: pieData,
      options: pieOptions
    })

	//---------------------
    //- STACKED BAR CHART -
    //---------------------
    var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
    var stackedBarChartData = $.extend(true, {}, barChartData)

    var stackedBarChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      scales: {
        xAxes: [{
          stacked: true,
        }],
        yAxes: [{
          stacked: true
        }]
      }
    }

    new Chart(stackedBarChartCanvas, {
      type: 'bar',
      data: stackedBarChartData,
      options: stackedBarChartOptions
    })
  })
</script>

<script src="{$zBasePath}assets/common/js/app/main.js"></script>