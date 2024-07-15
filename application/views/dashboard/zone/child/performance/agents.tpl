<div class="parametre" id="changeColor">
		<div class="tab-content tab-content-parametre typography">
		<h5>Liste agents validateurs</h5>
				<table id="table_bdAgent" class="table  table-bordered table-hover" style="margin-left:10px">
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
					

				function format ( d ) {
							
					var zData = "";
					$.ajax({
						url: "{/literal}{$zBasePath}{literal}utilisateur/getRole", // json datasource
						type: 'POST',
						data: {
							iUserId: d[1]
						},
						success: function(data, textStatus, jqXHR) {
							zData = data;
						},
						async: !1
					})

					return zData;
				}
				
				var zListeEntite = $('#table_bdAgent').DataTable( {
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
						url : "{/literal}{$zBasePath}{literal}utilisateur/getAjax", // json datasource
						data: function ( d ) {
							
						},
						type: "post",  // method  , by default get
						error: function(){  // error handling

						}
					}
				}); 

				// Add event listener for opening and closing details
				$('#table_bdAgent tbody').on('click', 'td.details-control', function () {
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

					
			</script>
			<style>
			th.dt-center, td.dt-center { text-align: center!important; }
			.dt-width {width:20%!important}
			#table_bdAgent th{
				width: 15px!important;
			}
			td.details-control {
				background: url('{/literal}{$zBasePath}{literal}assets/images/flch_or.png') no-repeat center center;
				cursor: pointer;
				background-size: 15px;
				width:15px;
			}
			tr.shown td.details-control {
				background: url('{/literal}{$zBasePath}{literal}assets/images/flch_or_bas.png') no-repeat center center;
				background-size: 25px;
			}

			.dataTable > thead > tr > th[class*="details-control"]:before,
			.dataTable > thead > tr > th[class*="details-control"]:after {
				content: "" !important;
			}
			</style>
			{/literal}

	</div>
</div>		