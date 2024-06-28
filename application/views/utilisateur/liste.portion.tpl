<table id="table_bd" class="table  table-bordered table-hover" style="margin-left:10px">
	<thead>
		<tr>
			<th>Privilège</th>
			<th>Identifiant</th>
			<th>Photo</th>
			<th>Nom</th>
			<th>Prénom</th>
			<th class="dt-center">Email</th>
			<!--<th class="dt-center">Privilège</th>
			<th class="dt-center">Liste et détail</th>
			<th class="dt-center">Exportation Excel</th>-->
			<th class="dt-center">Actions</th>
        </tr>
	</thead>
	<tbody>
			
	</tbody>
</table>
{literal}
<script>
		
		
		$(document).ready(function() {

			
			function format ( d ) {
						
				var zData = "";
				$.ajax({
					url: zBasePath + "demande/getPrivilege", // json datasource
					type: 'POST',
					data: {
						iEcriNum: d[1]
					},
					success: function(data, textStatus, jqXHR) {
						zData = data;
					},
					async: !1
				})

				return zData;
			}
			
			var zListeEntite = $('#table_bd').DataTable( {
				"processing": true,
				"serverSide": true,
				"searching": true,
				"footer": true,
				"columnDefs": [
					{ className: "dt-center", "targets": [ 1,3,4,5,6 ] },
					{ className: "details-control", "targets": [ 0 ] },
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
					url : zBasePath + "utilisateur/getAjax", // json datasource
					data: function ( d ) {
						
					},
					type: "post",  // method  , by default get
					error: function(){  // error handling

					}
				}
			}); 

			// Add event listener for opening and closing details
			$('#table_bd tbody').on('click', 'td.details-control', function () {
				var tr = $(this).parents('tr');
				var row = zListeEntite.row( tr );
		 
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
							url: zBasePath + "utilisateur/setActif/menu",
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
					url : zBasePath + "utilisateur/supprimer",
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
					url: zBasePath + "utilisateur/getOrdreAffichage",
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
td.details-control {
    background: url('{/literal}{$zBasePath}{literal}assets/images/flch_or.png') no-repeat center center;
    cursor: pointer;
	background-size: 10%;
}
tr.shown td.details-control {
    background: url('{/literal}{$zBasePath}{literal}assets/images/flch_or_bas.png') no-repeat center center;
	background-size: 15%;
}
</style>
{/literal}