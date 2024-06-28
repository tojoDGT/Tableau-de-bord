<div class="chart">
	<p id="areaChart" style="height: 600px;width:100%;"></p>
</div>
{literal}
<script type="text/javascript">
Highcharts.chart('areaChart', {
    chart: {
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45
        }
    },
    tooltip: {
        headerFormat: '<b>{point.key}</b><br>',
        pointFormat: '{/literal}{if $iMode==1}Nombre{else}Montant{/if}{literal}: {point.y}{/literal}{if $iMode==2} <b>Ar</b>{/if}{literal}'
    },
    title: {
        text: 'Situation de dossier : Diagramme circulaire',
        align: 'left'
    },
    subtitle: {
        text: '',
        align: 'left'
    },
    plotOptions: {
        pie: {
            innerSize: 100,
            depth: 45
        }
    },
    series: [{
        name: ' {/literal}{if $iMode==1}Nombre{else}Montant{/if}{literal}',
        data: [
            {/literal}{$zAfficheSerieStat}{literal} 
        ]
    }],
	exporting: {
		showTable: true
	}
});
{/literal}{if $iMode==2}
$(".eka").find("td.text").append(" Ar");
{/if}{literal}
</script>
{/literal}
