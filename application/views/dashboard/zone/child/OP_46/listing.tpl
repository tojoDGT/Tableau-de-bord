<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
  <i class="fas fa-th-large"></i>
</a>
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px;width:100%;min-height: 300px;">
	<thead>
		<tr>
		    <th>&nbsp;</th>
			{foreach from=$toColonne item=$oColonne}
			{assign var="zAfficheSplit" value="-"|explode:$oColonne}
			<th>{$zAfficheSplit[0]}</th>
			{/foreach}
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

	function format ( d, ) {
						
		var zData = "";
		var form = $("#sendSearch");

		var iModePaiement = 
		$.ajax({
			url: zBasePath + "virement/getDetail", // json datasource
			type: 'POST',
			data: {
				iTitreId: d[1],
				iExo: $('#ECRI_EXERCICE').val(),
				iTypeAfficheSearch:2
			},
			beforeSend: function() {
				
				$(".shown").html('<div style=";text-align: center;vertical-align: middle;padding-top: 10px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="100">');
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
			{ className: "dt-Visible", "targets": [ 1 ] },
			{ className: "details-control", "targets": [ 0 ] }
		 ],
		"language": {
			"sProcessing":     "<div id='overlay111'>Chargement...<br/><div style=\";text-align: center;vertical-align: middle;padding-top: 10px;\"><img class=\"imageAloha\" src=\""+zBasePath+"assets/images/loading.gif\" width=\"100\"></div>",
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
			url : zBasePath + "virement/getAjax", 
			data: function ( d ) {
				d.PERI_EXERCICE			= $('#PERI_EXERCICE').val();
				d.PERI_MOIS				= $('#PERI_MOIS').val();
				d.PCASSIGNATAIRE		= $('#PCASSIGNATAIRE').val();
				d.PCPAYEUR				= $('#PCPAYEUR').val();
				d.STATUS				= $('#STATUS').val();
				d.CATEG_DEPENSE			= $('#CATEG_DEPENSE').val();
				d.iTypeAfficheSearch	= 2;
				d.data					= $("#sendSearch").serializeArray();
				d.DATE_DEB				= $('#date_debut').val();
				d.DATE_FIN				= $('#date_fin').val();
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
            row.child( format(row.data())).show();
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

.badge {
    padding: .50em .9em;
	font-size: 80%;
    font-weight: 900;
}
.dt-width {
	width:150px;
}
.dt-Visible {
	display:none!important;
}
.dataTable > thead > tr > th[class*="details-control"]:before,
.dataTable > thead > tr > th[class*="details-control"]:after {
    content: "" !important;
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