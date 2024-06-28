<table id="table_bd" class="table  table-bordered table-hover">
	<thead>
		<tr>
			<th>Nom</th>
			<th>Prénom</th>
			<th class="dt-center">Organisme de rattachement</th>
			<th class="dt-center">Email</th>
			<th class="dt-center">Telephone</th>
			<th class="dt-center">Action</th>
        </tr>
	</thead>
	<tbody>
			
	</tbody>
</table>
{literal}
<script>
		
		
		$(document).ready(function() {

			var zListeEntite = $('#table_bd').DataTable( {
				"processing": true,
				"serverSide": true,
				"searching": true,
				"footer": true,
				"columnDefs": [
					{ className: "dt-center", "targets": [ 0,3,4,5 ] },
					{ className: "dt-width", "targets": [ 0 ] },
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
					url : zBasePath + zController + "/getAjax", // json datasource
					data: function ( d ) {
						
					},
					type: "post",  // method  , by default get
					error: function(){  // error handling

					}
				}
			}); 

			$("#table_bd").on("click", ".checkActive", function(){
				var iValue = jQuery(this).is(':checked');
				var iId = jQuery(this).attr("iId");
				
				jQuery(this).attr("");
				var iActif = 0;
				var zMessage = "";
				switch (iValue) {
					case true:
						iActif = 1;
						zMessage = " activer";
						break;

					case false:
						iActif = 0;
						zMessage = " désactiver";
						break;
				}
	
				var s = confirm("Voulez-vous "+zMessage+"?");
				if(s == true){
					jQuery.ajax({
							url: zBasePath + zController + "/setActif/menu",
							type: 'post',
							data: {
								iActif: iActif,
								iId: iId
							},
							success: function(data, textStatus, jqXHR) {
								
							},
							async: false
						})
				} else {

					if(iActif ==1){
						jQuery(this).prop('checked', false);
					} else {
						jQuery(this).prop('checked', true);
					}
					
				}
			});

			$("#table_bd").on("click", ".supprFormation", function(){
				var iElement = $(this).attr("dataSuppr");
				if (confirm ("Voulez-vous supprimer cet enregistrement?"))
				{
					$.ajax({
					url : zBasePath + zController + "/supprimer",
					type : "POST",
					data : {supprId :  iElement},
						success : function(data){
								zListeEntite.ajax.reload();  
						}
					});
				}
					
			});

		});

		function getOrdre(_iMode,_iOrdre,_iId){
			
				jQuery.ajax({
					url: zBasePath + zController + "/getOrdreAffichage",
					type: 'post',
					data: {
						iMode: _iMode,
						iOrdre: _iOrdre,
						iId: _iId
					},
					success: function(data, textStatus, jqXHR) {
						jQuery("#setHtmlInfo1").html(data);
						
					},
					async: false
				}).done(function() {
					$.getScript( zBasePath + "assets/js/loading-content.js" )
				});
			
		}

		
</script>
<style>
th.dt-center, td.dt-center { text-align: center!important; }
.dt-width {width:20%!important}
#table_bd th{
    width: 75px!important;
}
#table_bd td img {
    width: 75px;
    height: 75px;
    border-radius: 50%;
    min-width: 40px;
}
</style>
{/literal}