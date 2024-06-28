<div class="chart">
	<p id="container32" style="height: 600px;width:100%;"></p>
</div>
{literal}
<script type="text/javascript">
// Set up the chart
const chart = new Highcharts.Chart({
    chart: {
        renderTo: 'container32',
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 15,
            beta: 15,
            depth: 50,
            viewDistance: 25
        }
    },
    xAxis: {
        categories: [{/literal}{$zCategorieAffiche}{literal}]
    },
    yAxis: {
        title: {
            enabled: false
        }
    },
    tooltip: {
        headerFormat: '<b>{point.key}</b><br>',
        pointFormat: '{/literal}{if $iMode==1}Nombre{else}Montant{/if}{literal}: {point.y}{/literal}{if $iMode==2} <b>Ar</b>{/if}{literal}'
    },
    title: {
        text: 'Situation de dossier : Diagramme en bâton',
        align: 'left'
    },
    subtitle: {
        text: ' ' ,
        align: 'left'
    },
    legend: {
        enabled: false
    },
    plotOptions: {
        column: {
            depth: 25
        }
    },
    series: [{
        data: [{/literal}{$zNombreAffiche}{literal}],
        colorByPoint: true
    }],
	exporting: {
		showTable: true
	}
});
{/literal}{if $iMode==2}
$(".eka").find("td.text").append(" Ar");
{/if}{literal}
$(".eka").find("thead th:first").next().html("{/literal}{if $iMode==1}Nombre{else}Montant{/if}{literal}");
</script>
{/literal}
