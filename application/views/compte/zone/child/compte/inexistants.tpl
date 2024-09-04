{$zSearchTpl}
<br><br>
<input type="hidden" name="iAnnee" id="iAnnee" value="{$iAnneeExercice}">
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px;min-height: 300px;">
	<thead>
		<tr>
			<th colspan="3"></th>
			<th colspan="3" class="dt-center solde oper">ECRITURE</th>
			<th colspan="6" class="dt-center total"></th>
        </tr>
		<tr>
			<th class="dt-center">POSTE COMPTABLE</th>
			<th class="dt-center">ANNEE EXERCICE</th>
			<th class="dt-center">COMPTE NUMERO</th>
			<th class="dt-center oper">REFERENCE</th>
			<th class="dt-center oper">LIBELLE</th>
			<th class="dt-center oper">DATE</th>
			<th class="dt-center">TYPE ECRITURE</th>
			<th class="dt-center">PROPRIETAIRE</th>
			<th class="dt-center">LIBELLE LIGNE</th>
			<th class="dt-center">MONTANT OPERATION</th>
			<th class="dt-center">SENS</th>
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
					{ className: "dt-center", "targets": [ 1,10 ] },
					{ className: "oper1", "targets": [ 3,4,5 ] },
					{ className: "details-control", "targets": [ 0 ] },
					{ orderable: false, targets: [0] },
				 ],
				"language": {
					"sProcessing":    "<div id='overlay111'>Chargement...<br/><div style=\";text-align: center;vertical-align: middle;padding-top: 10px;\"><img class=\"imageAloha\" src=\""+zBasePath+"assets/images/loading.gif\" width=\"100\"></div>",
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
						d.iSwitch = 4,
						d.iAnnee = $("#ECRI_EXERCICE").val(),
						d.SENS = $("#SENS").val(),
						d.COMPTE_NUM = $("#COMPTE_NUM").val(),
						d.PROP_CODE = $("#PROP_CODE").val(),
						d.PSTP_CODE = $("#PSTP_CODE").val()
					},
					beforeSend: function() {
						$(".content").addClass('overlay');
					},
					type: "post",  // method  , by default get
					error: function(){  // error handling

					}
				}
			}); 

			

		});
		
</script>
<style>

.oper {
	background-color: #ffc107!important;
    border: 1px solid #ffc107 !important;
    color: white;
}

.oper1 {
	background-color: #fbdd84 !important;
    border: 1px solid #ffc107 !important;
    color: #6a6565;
	width: 90px !important;
}
th.dt-center, td.dt-center { text-align: center!important; }
.dt-width {width:20%!important}
#table_bd th{
    width: 15px!important;
}

</style>
{/literal}