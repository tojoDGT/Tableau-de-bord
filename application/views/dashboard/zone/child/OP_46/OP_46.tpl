<link rel="stylesheet" href="{$zBasePath}assets/css/formoid1/formoid-solid-blue-chart.css" type="text/css" />
<script src="{$zBasePath}assets/code/highcharts.js"></script>
<script src="{$zBasePath}assets/code/highcharts-3d.js"></script>
<script src="{$zBasePath}assets/code/modules/exporting.js"></script>
<script src="{$zBasePath}assets/code/modules/export-data.js"></script>
<section class="content">
	<div class="container-fluid">
			<div class="row">	
					<div class="col-md-12">
							<div class="card">
							<div class="card-header">
								<h3 class="card-title"><i class="fas fa-search mr-1"></i>
								  Recherche</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool" data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body" style="padding:0px">
								{$zSearchTpl}
							</div>
					</div>	
				</div>
					
					<div class="col-md-12">
							<!------------------ Manaraka ------------------------------->	
							<section class="connectedSortable ui-sortable">
							<!-- Custom tabs (Charts with tabs)-->
							<div class="card" style="position: relative; left: 0px; top: 0px;min-height:400px;">
							  <div class="card-header ui-sortable-handle" style="cursor: move;">
								<h3 class="card-title">
								  <i class="fas fa-chart-pie mr-1"></i>
								  Resultats
								</h3>
								<!-- <div class="card-tools">
								  <ul class="nav nav-pills ml-auto">
									<li class="nav-item">
									  <a class="nav-link active" id="getListing" href="#listing-search" data-toggle="tab">Liste et détail</a>
									</li>
									<li class="nav-item">
									  <a class="nav-link" id="getGraph" href="#graph-search" data-toggle="tab">Graphe</a>
									</li>
									<li class="nav-item">
									  <a class="nav-link" id="getStatGLobal" href="#stat-global" data-toggle="tab">Statistique Global</a>
									</li>
								  </ul>
								</div> -->
							  </div><!-- /.card-header -->
							  <div class="card-body">
								<div class="tab-content p-0">
								  <!-- Morris chart - Sales -->
								  <div class="chart tab-pane stattPlaceListing active" id="listing-search">
									  {$zListingTpl}
								   </div>
								  <div class="chart tab-pane stattPlace" id="graph-search">
									  {*$zFirstTpl*}
								  </div>
								   <div class="chart tab-pane stattGlobal" id="stat-global">
									  {*$zStatGLobal*}
								  </div>
								</div>
							  </div><!-- /.card-body -->
							</div>
							<!-- /.card -->
							</section>
							<!------------------ fin Manaraka --------------------------->	
					</div>
			<!-- /.row -->
			</div>
	</div><!-- /.container-fluid -->
</section>
{literal}
<script>
	
$(document).ready(function() {

	$('#getGraph').on('click', function () {

		$("#nombreMontant").show();
		$(".stattPlace").html("");
		$(".stattPlace").html('<div style=";text-align: center;vertical-align: middle;padding-top: 10px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="100">');
		
		$.ajax({
			url : zBasePath + "dashboard/getGraphAjax", // json datasource
			type: "post",
			data: $("#sendSearch").serialize(),
			success: function (zReturn, textStatus, jqXHR) {
				$(".stattPlace").html("");
				$(".stattPlace").html(zReturn);
				$("html, body").animate({ scrollTop: document.body.scrollHeight }, "slow");
			},
			async: true
		});
    });

	$('#getStatGLobal').on('click', function () {

		$("#nombreMontant").hide();
		$(".stattGlobal").html("");
		$(".stattGlobal").html('<div style=";text-align: center;vertical-align: middle;padding-top: 10px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="100">');
		
		$.ajax({
			url : zBasePath + "dashboard/getStatGLobal", // json datasource
			type: "post",
			data: $("#sendSearch").serialize(),
			success: function (zReturn, textStatus, jqXHR) {
				$(".stattGlobal").html("");
				$(".stattGlobal").html(zReturn);
			},
			async: true
		});
    });

});	
</script>
{/literal}
<script src="{$zBasePath}assets/common/plugins/chart.js/Chart.min.js"></script>