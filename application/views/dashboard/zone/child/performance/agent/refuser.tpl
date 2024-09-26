<div class="parametre" id="changeColor">
		<div class="tab-content tab-content-parametre typography">
		<h5>Liste des dossiers refusés</h5>
				<table id="table_valide" class="table  table-bordered table-hover" style="margin-left:10px;width:100%">
					<thead>
						<tr>
							<th></th>
							<th>Ecrinum</th>
							<th>NmMandat</th>
							<th>Note rejet</th>
							<th>Date rejet</th>
							<th>Objet du mandat</th>
							<th>Date récupération</th>
							<th>Montant</th>
						</tr>
					</thead>
					<tbody>
							
					</tbody>
				</table>

				
				<script>

					function format ( d) {
										
						var zData = "";
						var form = $("#sendSearch");

						var iModePaiement = 
						$.ajax({
							url: "{$zBasePath}demande/getDetail", // json datasource
							type: 'POST',
							data: {
								iEcriNum: d[1],
								iNumMandat: d[2],
								iOffset:200,
								iModePaiement: $("#sendSearch").find("input[name='MAND_MODE_PAIE[]']:checked").val()
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

					var zListeEcriture = $('#table_valide').DataTable( {
						"processing": true,
						"serverSide": true,
						"searching": true,
						"footer": true, 
						"columnDefs": [
							{ className: "dt-Visible", "targets": [ 1,2 ] },
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
							url : "{$zBasePath}dashboard/getDossierValideRefusAjax", 
							data: function ( d ) {
								d.iUserId			= '{$iUserId}',
								d.MAND_VISA_VALIDE	= '0',
								d.iAnneeExercice	= $('#iAnneeExercice').val();
								
							},
							type: "post", 
							error: function (request, error) {
								console.log(error);
							},
							timeout: 10000,
							async: true
						}
					}); 

					// Add event listener for opening and closing details
					$('#table_valide tbody').on('click', 'td.details-control', function () {
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

				</script>
				
				<style>
				hr {
					margin-top: 1rem;
					margin-bottom: 1rem;
					border: 0;
					border-top: 1px solid rgb(255 255 255 / 20%);
				}
				h3 {
					font-size: 18px!important;
					line-height:55px!important;
					width:100%!important;
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
					display:none;
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

	</div>
</div>		