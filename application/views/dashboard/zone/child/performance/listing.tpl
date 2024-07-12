<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px">
	<thead>
		<tr>
			<th>CODE</th>
			<th>LIBELLE</th>
			<th>PERFORMANCE</th>
        </tr>
	</thead>
	<tbody>
			
	</tbody>
</table>
<div  id="div_list_pc_tab" style="display:none;" >
<div id="overlay"></div>
{literal}
<script>

function getTabPc(_this){

	var zPsCode = $(_this).attr("id");
	var zLibelle = $(_this).attr("libelle");
	$.ajax({
			url: zBasePath + "dashboard/getTabsPc",
			method: "POST",
			data: {
				zPsCode : zPsCode
			},
			success: function(data, textStatus, jqXHR) {
					
					$("#div_list_pc_tab").html(data);
					$("#overlay").show();
					$("#div_list_pc_tab").dialog({
						autoOpen: true,
						width: '80%',
						modal: true, 
						title: "Performance de Poste comptable : " + zLibelle,
						open: function(event, ui) {
							$(event.target).parent().css('top', '40px');
							$("#overlay").show();
						},
						close: function(event, ui) {
							$("#overlay").hide();
							$("#div_list_pc_tab").empty();
						},
						position: { my: 'top', at: "center top+75" }
					});
			},
			async: true

		});
}

$(document).ready(function() {

	var zListeEntite = $('#table_bd').DataTable( {
		"processing": true,
		"serverSide": true,
		"searching": true,
		"footer": true,
		"columnDefs": [
			{ className: "dt-center", "targets": [ 0,1,2 ] },
			{ className: "details-control", "targets": [ 2 ] },
			{ orderable: false, targets: [2] },
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
			url : zBasePath + "dashboard/getPostComptable", // json datasource
			data: function ( d ) {
				
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
    /*width: 15px!important;*/
}

.dataTable > thead > tr > th[class*="details-control"]:before,
.dataTable > thead > tr > th[class*="details-control"]:after {
    content: "" !important;
}
</style>
{/literal}