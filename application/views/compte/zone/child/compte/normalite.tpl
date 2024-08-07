<input type="hidden" name="iAnnee" id="iAnnee" value="{$iAnneeExercice}">
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px">
	<thead>
		<tr>
			<th>DETAIL</th>
			<th>IDENTIFIANT</th>
			<th>NOM</th>
			<th>PRENOM</th>
			<th>EMAIL</th>
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
					{ className: "dt-center", "targets": [ 1,3,4 ] },
					{ className: "details-control", "targets": [ 0 ] },
					{ orderable: false, targets: [0] },
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
th.dt-center, td.dt-center { text-align: center!important; }
.dt-width {width:20%!important}
#table_bd th{
    width: 15px!important;
}

</style>
{/literal}