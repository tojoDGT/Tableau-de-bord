<input type="hidden" name="iAnnee" id="iAnnee" value="{$iAnneeExercice}">
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px">
	<thead>
		<tr>
			<th colspan="3"></th>
			<th colspan="2" class="dt-center solde">SOLDE</th>
			<th colspan="2" class="dt-center total">TOTAL</th>
			<th colspan="2" class="dt-center sens">SENS</th>
			<th colspan="1"></th>
        </tr>
		<tr>
			<th class="dt-center">POSTE COMPTABLE</th>
			<th class="dt-center">CODE POSTE</th>
			<th class="dt-center">COMPTE NUMERO</th>
			<th class="dt-center solde">DEBIT</th>
			<th class="dt-center solde">CREDIT</th>
			<th class="dt-center total">DEBIT</th>
			<th class="dt-center total">CREDIT</th>
			<th class="dt-center sens">FIN</th>
			<th class="dt-center sens">OG</th>
			<th class="dt-center">CONCLUSION</th>
        </tr>
	</thead>
	<tbody>
			
	</tbody>
</table>
{literal}
<script>
		
		
		$(document).ready(function() {
			var zListeCompte = $('#table_bd').DataTable( {
				"processing": true,
				"serverSide": true,
				"searching": true,
				"footer": true,
				"columnDefs": [
					{ className: "dt-center", "targets": [ 1,9 ] },
					{ className: "solde1", "targets": [ 3,4 ] },
					{ className: "total1", "targets": [ 5,6 ] },
					{ className: "sens1", "targets": [ 7,8 ] },
					{ className: "details-control", "targets": [ 0 ] },
					{ orderable: false, targets: [0] },
				 ],
				"language": {
					"sProcessing":    "<div style=\";text-align: center;vertical-align: middle;padding-top: 10px;\"><img class=\"imageAloha\" src=\""+zBasePath+"assets/images/loading.gif\" width=\"100\">",
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
					url : zBasePath + "compte/getAjax", // json datasource
					data: function ( d ) {
						d.iSwitch = 1,
						d.iAnnee = $("#iAnnee").val()

					},
					type: "post",  // method  , by default get
					error: function(){  // error handling

					}
				}
			}); 

			

		});
		
</script>
<style>

.solde {
	background-color: #007bff;
    border: 1px solid #1371d5 !important;
    color: white;
}

.total {
	background-color: #28a745;
    border: 1px solid #339349 !important;
    color: white;
}

.sens {
	background-color: #fd7e14!important;
    border: 1px solid #d7721d !important;
    color: white;
}


.solde1 {
	background-color: #90b1d5;
    border: 1px solid #1371d5 !important;
    color: white;
	width: 125px !important;
}

.total1 {
	background-color: #6bb17b;
    border: 1px solid #339349 !important;
    color: white;
	width: 125px !important;
}

.sens1 {
	background-color: #d9a57a!important;
    border: 1px solid #d7721d !important;
    color: white;
	width: 90px !important;
}
th.dt-center, td.dt-center { text-align: center!important; }
.dt-width {width:20%!important}
#table_bd th{
    width: 15px!important;
}

</style>
{/literal}