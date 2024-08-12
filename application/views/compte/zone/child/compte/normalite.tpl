{$zSearchTpl}
<br><br>
<input type="hidden" name="iAnnee" id="iAnnee" value="{$iAnneeExercice}">
<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px;min-height: 300px;">
	<thead>
		<tr>
			<th colspan="3"></th>
			<th colspan="2" class="dt-center solde">BALANCE ENTREE</th>
			<th colspan="2" class="dt-center total">OPERATION DE GESTION</th>
			<th colspan="2" class="dt-center sens">OPERATION FIN DE GESTION</th>
			<th colspan="2" class="dt-center oper">TOTAL</th>
			<th colspan="2"></th>
        </tr>
		<tr>
			<th class="dt-center">POSTE COMPTABLE</th>
			<th class="dt-center">ANNEE EXERCICE</th>
			<th class="dt-center">COMPTE NUMERO</th>
			<th class="dt-center solde">DEBIT</th>
			<th class="dt-center solde">CREDIT</th>
			<th class="dt-center total">DEBIT</th>
			<th class="dt-center total">CREDIT</th>
			<th class="dt-center sens">DEBIT</th>
			<th class="dt-center sens">CREDIT</th>
			<th class="dt-center oper">DEBIT</th>
			<th class="dt-center oper">CREDIT</th>
			<th class="dt-center">SENS EN COURS</th>
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
					{ className: "dt-center", "targets": [ 1,11 ] },
					{ className: "solde1", "targets": [ 3,4 ] },
					{ className: "total1", "targets": [ 5,6 ] },
					{ className: "sens1", "targets": [ 7,8 ] },
					{ className: "oper1", "targets": [ 9,10 ] },
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
						d.iSwitch = 1,
						d.iAnnee = $("#ECRI_EXERCICE").val(),
						d.CONCLUSION = $("#CONCLUSION").val(),
						d.SENS = $("#SENS").val(),
						d.COMPTE_NUM = $("#COMPTE_NUM").val(),
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


/*.overlay {
  opacity:0.5;
  height: 0;
  width: 0;
  position: fixed; 
  z-index: 999; 
  left: 0;
  top: 0;
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0, 0.9); 
  overflow-x: hidden; 
  transition: 0.5s; 
}
*/

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

.oper {
	background-color: #ffc107!important;
    border: 1px solid #ffc107 !important;
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