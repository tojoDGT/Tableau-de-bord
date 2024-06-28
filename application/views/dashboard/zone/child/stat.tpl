<div class="row">
  <div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-info">
	  <div class="inner">
		<h3>{if empty($oResult->NB_SOA)}0{else}{$oResult->NB_SOA}{/if}</h3>
		<p>Nombres d'écriture validé</p>
	  </div>
	  <div class="icon">
		<i class="ion ion-bag"></i>
	  </div>
	  <a href="#" class="small-box-footer">Plus d'infos <i class="fas fa-arrow-circle-right"></i></a>
	</div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-success">
	  <div class="inner">
		<h3>
		{if $oResult->NBTOTAL>0}
		{($oResult->NBTOTAL/$oResult->TOTAL*100)|number_format:5:",":" "}
		{else}
		0
		{/if}
		<sup style="font-size: 20px">%</sup></h3>
		<p>Pourcetange budget Total</p>
	  </div>
	  <div class="icon">
		<i class="ion ion-stats-bars"></i>
	  </div>
	  <a href="#" class="small-box-footer">Plus d'infos <i class="fas fa-arrow-circle-right"></i></a>
	</div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-warning">
	  <div class="inner">
		<h3>{$oResult->NBTOTAL|number_format:0:",":" "} Ar</h3>

		<p>Montants</p>
	  </div>
	  <div class="icon">
		<i class="ion ion-person-add"></i>
	  </div>
	  <a href="#" class="small-box-footer">Plus d'infos <i class="fas fa-arrow-circle-right"></i></a>
	</div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-danger">
	  <div class="inner">
		<h3>
		{if $oResult->COMPTE == 0}
			{if $oResult->NB_SOA==0}
			0
			{else}
			100
			{/if}
		{else}
		{$oResult->COMPTE/$oResult->NB_SOA*100|number_format:2:",":" "}
		{/if}
		<sup style="font-size: 20px">%</sup></h3>

		<p>Pourcentage des dossiers validés</p>
	  </div>
	  <div class="icon">
		<i class="ion ion-pie-graph"></i>
	  </div>
	  <a href="#" class="small-box-footer">Plus d'infos <i class="fas fa-arrow-circle-right"></i></a>
	</div>
  </div>
  <!-- ./col -->
</div>

<div class="col-sm-6 col-lg-3">
	<div class="overview-item overview-item--c1 stattPlace stattPlace1" style="height:247px;">
		<div class="overview__inner">
			<div class="overview-box clearfix">
				<div class="icon">
				   <i class="fa fa-user"></i>
				</div>
				<div class="text">
					<h2>625</h2>
					<span>test 1</span>
				</div>
			</div>
			<div class="overview-chart"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
				<canvas id="widgetChart1" height="130" style="display: block; width: 358px; height: 130px;" width="358" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
	</div>
</div>
<!--<script src="{$zBasePath}assets/common/statistique/js/main.js"></script>-->