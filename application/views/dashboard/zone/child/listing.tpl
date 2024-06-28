<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
  <i class="fas fa-th-large"></i>
</a>
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px;width:100%">
	<thead>
		<tr>
			<th></th>
			{foreach from=$toColonne item=$oColonne}
			{assign var="zAfficheSplit" value="-"|explode:$oColonne}
			<th>{$zAfficheSplit[0]}</th>
			{/foreach}
			<!--<th>Réf</th>
			<th class="dt-center">Libellé</th>
			<th class="dt-center">Date</th>
			<th class="dt-center">Propriété</th>
			<th class="dt-center">LIbellé ecriture</th>
			<th class="dt-center">Mode</th>
			<th class="dt-center">Montant</th>-->
        </tr>
	</thead>
	<tbody>
			
	</tbody>
</table>

{literal}
<script>
	
$(document).ready(function() {

	$('.nav-link').on('click', function () {
		$("html, body").animate({ scrollTop: 0 }, "slow");
    });

	function format ( d ) {
						
		var zData = "";
		var form = $("#sendSearch");

		var iModePaiement = 
		$.ajax({
			url: zBasePath + "demande/getDetail", // json datasource
			type: 'POST',
			data: {
				iEcriNum: d[1],
				iNumMandat: d[2],
				iModePaiement: $("#sendSearch").find("input[name='MAND_MODE_PAIE[]']:checked").val()
			},
			success: function(data, textStatus, jqXHR) {
				zData = data;
			},
			async: !1
		})

		return zData;
	}

	var zListeEcriture = $('#table_bd').DataTable( {
		"processing": true,
		"serverSide": true,
		"searching": true,
		"footer": true, 
		"columnDefs": [
			{ className: "dt-Visible", "targets": [ 1,2 ] },
			{ className: "details-control", "targets": [ 0 ] }
		 ],
		"language": {
			"sProcessing":     "Traitement en cours...",
			"sSearch":         "Rechercher&nbsp;:",
			"sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
			"sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
			"sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
			"sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
			"sInfoPostFix":    "",
			"sLoadingRecords": "Chargement en cours...",
			"sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
			"sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
			"oPaginate": {
				"sFirst":      "Premier",
				"sPrevious":   "Pr&eacute;c&eacute;dent",
				"sNext":       "Suivant",
				"sLast":       "Dernier"
			},
			"oAria": {
				"sSortAscending":  ": activer pour trier la colonne par ordre croissant",
				"sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
			},
			"select": {
					"rows": {
						_: "%d lignes séléctionnées",
						0: "Aucune ligne séléctionnée",
						1: "1 ligne séléctionnée"
					}  
			}
		},
		"ajax":{
			url : zBasePath + "demande/getAjax", 
			data: function ( d ) {
				d.ECRI_EXERCICE  = $('#ECRI_EXERCICE').val();
				d.MIN_ABREV		 = $('#MIN_ABREV').val();
				d.TYPE_MAND		 = $('#TYPE_MAND').val();
				d.data			 = $("#sendSearch").serializeArray();
			},
			type: "post", 
			error: function (request, error) {
				console.log(error);
			},
			timeout: 10000,
			async: true
		}
	}); 

	if($("#getStatGLobal").hasClass( "active" )){
		$("#nombreMontant").show();
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
	}

	// Add event listener for opening and closing details
    $('#table_bd tbody').on('click', 'td.details-control', function () {
        var tr = $(this).parents('tr');
        var row = zListeEcriture.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );

});	
</script>
{/literal}
<style>
hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgb(255 255 255 / 20%);
}
.dt-right {
	text-align:right;
}
.dt-width {
	width:150px;
}
.dt-Visible {
	display:none;
}
td.details-control {
    background: url('{$zBasePath}assets/images/flch_or.png') no-repeat center center;
    cursor: pointer;
	background-size: 15px;
}
tr.shown td.details-control {
    background: url('{$zBasePath}assets/images/flch_or_bas.png') no-repeat center center;
	background-size: 25px;;
}
</style>