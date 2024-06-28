<div class="chart">
	<p id="container111" style="height: 600px;width:100%;"></p>
</div>
{literal}
<script type="text/javascript">
Highcharts.chart('container111', {
	chart: {
		type: 'column',
		options3d: {
			enabled: true,
			alpha: 15,
			beta: 15,
			viewDistance: 25,
			depth: 40
		}
	},
	title: {
		text: ' Situation de dossier : Diagramme en baton',
		align: 'left'
	},

	xAxis: {
		labels: {
			skew3d: true,
			style: {
				fontSize: '16px'
			}
		}
	},

	yAxis: {
		allowDecimals: false,
		min: 0,
		title: {
			text: 'TWh',
			skew3d: true,
			style: {
				fontSize: '16px'
			}
		}
	},

	tooltip: {
		headerFormat: '<b>{point.key}</b><br>',
		pointFormat: '<span style="color:{series.color}">\u25CF</span> ' +
			'{series.name}: {point.y} {/literal}{if $iMode==2} <b>Ar</b>{/if}{literal} / {point.stackTotal} {/literal}{if $iMode==2} <b>Ar</b>{/if}{literal}'
	},

	plotOptions: {
		series: {
			pointStart: {/literal}{$iPointStart}{literal}
		},
		column: {
			stacking: 'normal',
			depth: 40
		}
	},

	series: [{/literal}{$zAfficheSerieStat}{literal}] ,
	exporting: {
		showTable: true
	}
});
{/literal}{if $iMode==2}
$(".eka").find("td.text").append(" Ar");
{/if}{literal}
</script>
{/literal}
