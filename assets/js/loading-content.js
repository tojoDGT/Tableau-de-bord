
var zListeEntite = $('#table_bd').DataTable( {
				"processing": true,
				"serverSide": true,
				"searching": true,
				"footer": true,
				"columnDefs": [
					{ className: "dt-center", "targets": [ 2,3,4 ] },
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
								_: "%d lignes s�l�ctionn�es",
								0: "Aucune ligne s�l�ctionn�e",
								1: "1 ligne s�l�ctionn�e"
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
						zMessage = " d�sactiver";
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
				if (confirm ("Voulez-vous supprimer cet entit�?"))
				{
					$.ajax({
					url : zBasePath + zController + "/supprimer/entite",
					type : "POST",
					data : {supprId :  iElement},
						success : function(data){
								zListeEntite.ajax.reload();  
						}
					});
				}
					
			});