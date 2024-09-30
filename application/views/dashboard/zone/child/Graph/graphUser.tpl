<div class="chart">
	<p id="containerUser" style="height: 600px;width:100%;"></p>
</div>
{literal}
<script type="text/javascript">
Highcharts.chart('containerUser', {
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
		text: ' ',
		align: 'left'
	},
	xAxis: {
		categories: ['', 'Jan', 'Fév', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Auût', 'Sept', 'Oct', 'Nov', 'Dec']
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
			'{series.name}: {point.y} / {point.stackTotal}'
	},

	plotOptions: {
		series: {
			pointStart: 1
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
