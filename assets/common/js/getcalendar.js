jQuery(function($) {
    var zBasePath = '';

			$('#external-events div.external-event').each(function() {

				var eventObject = {
					title: $.trim($(this).text()) 
				};

				$(this).data('eventObject', eventObject);

				$(this).draggable({

				zIndex: 999,

				revert: true,      

				revertDuration: 0  
				});
			});

		var calendar = $('#calendar').fullCalendar({
	
				lang: 'fr',
				buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},

				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},

				events: {
						url: zBasePath + 'common/getAjaxEvent'
				},
				editable: true,
				droppable: true, 	
				drop: function(date) { 	
				var originalEventObject = $(this).data('eventObject');
				var $extraEventClass = $(this).attr('data-class');
				var copiedEventObject = $.extend({}, originalEventObject);
				copiedEventObject.start = date;
				copiedEventObject.allDay = false;
		
				if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];	
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
					if ($('#drop-remove').is(':checked')) {		
						$(this).remove();
					}
				},

				selectable: true,
				selectHelper: true,
				select: function(start, end, allDay) {
					bootbox.prompt("New Event Title:", function(title) {
					if (title !== null) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay,
							className: 'label-info'
						},
						true 
									
						);

						}

					});
					calendar.fullCalendar('unselect');
				},
				eventClick: function(calEvent, jsEvent, view) {

		
					//display a modal

					var modal = 
					'<div class="modal fade">\
					  <div class="modal-dialog">\
					   <div class="modal-content">\
						 <div class="modal-body">\
						   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
						   <form class="no-margin">\
							  <label class="label1"><u>Intitulé</u> :</label><p class="label2"> ' + calEvent.intitule + '</p>\
							  <label class="label1"><u>Date début</u> :</label><p class="label2"> ' + calEvent.debut + '</p>\
							  <label class="label1"><u>Date Fin</u> :</label><p class="label2"> ' + calEvent.fin + '</p>\
							  <label class="label1"><u>Heure</u> :</label><p class="label2"> ' + calEvent.heure + '</p>\
							  <label class="label1"><u>Description</u> :</label><p class="label2"> ' + calEvent.description + '</p>\
							  <label class="label1"><u>Lieu</u> :</label><p class="label2"> ' + calEvent.lieu + '</p>\
						   </form>\
						 </div>\
					  </div>\
					 </div>\
					</div>';
					var modal = $(modal).appendTo('body');
					modal.find('form').on('submit', function(ev){
						ev.preventDefault();
						calEvent.title = $(this).find("input[type=text]").val();
						calendar.fullCalendar('updateEvent', calEvent);
						modal.modal("hide");
					});
					
					modal.find('button[data-action=delete]').on('click', function() {
						calendar.fullCalendar('removeEvents' , function(ev){
							return (ev._id == calEvent._id);
					});
						modal.modal("hide");
					});
					modal.modal('show').on('hidden', function(){
	
						modal.remove();

			});
		   }
			
		});


});

function FaireClignoterImage (){ 
   //$("#tojo").fadeOut(2000).fadeIn(1000); 
} 

$(document).ready (function ()
{
	
	setInterval('FaireClignoterImage()',2200); 

	$("ul#ticker01").show();
	$("ul#ticker01").liScroll();
	$("ul#ticker02").liScroll({travelocity: 0.15});

	$('#ContentBloc').show();
	$('#calendar').hide();
	$('.showCommuniquer').hide();

	$('.showCommuniquer').on('click', function(){
		$('#calendar').fullCalendar('refetchEvents');
		$('#ContentBloc').show();
		$('#calendar').hide();
		$('.showCommuniquer').hide();
		$('.showCalendar').show();

	}); 

	$('.showCalendar').on('click', function(){
		$('#calendar').fullCalendar('refetchEvents');
		$('#innerContent').hide();
		$('#calendar').show();
		$('.showCommuniquer').show();
		$('#rightContent').hide();
	}); 


	$( "#dialogEvent" ).dialog({
		autoOpen: false,
		width: '30%',
		title: 'Ajout évenement',
		close: 'X',
		modal: true,
		buttons: [
			{
				text: "Valider",
				click: function() {

					var zMessage = "";
					var zTypeEvent = $("#zTypeEvent").val();
					var zIntitule = $("#zIntitule").val();
					var zDateDeb = $("#zDateDeb").val();
					var zDateFin = $("#zDateFin").val();
					var zHeureEntree = $("#heure_event").val();
					var zMinuteEntree = $("#minute_event").val();
					var zSecondeEntree = $("#seconde_event").val();
					var iDegre = $("#iDegre").val();

					var zLieuEvent = $("#zLieuEvent").val();
					var zDescription = $("#zDescription").val();

					if (zTypeEvent == '0'){
						zMessage += " - Veuillez Sélectionner le type d'évenement\n" ; 
					} 

					if (zIntitule == ''){
						zMessage += " - Veuillez remplir le champ intitulé\n" ; 
					} 

					if (zHeureEntree == '00'){
						zMessage += " - Veuillez entrer l\'heure d\'entrée\n" ; 
					} 

					if (zDateDeb == ''){
						zMessage += " - Veuillez entrer la date début\n" ; 
					} 

					if (zTypeEvent == '7'){
						if (zDateFin == '') {
							zMessage += " - Veuillez entrer la date fin\n" ; 
						}
					}
					
					if (zMessage != ''){
						alert(zMessage) ; 
					}
					else {

						$.ajax({
							url: zBasePath + "common/saveEvent/" ,
							type: 'Post',
							data: { zTypeEvent:zTypeEvent,zIntitule:zIntitule, zDateDeb:zDateDeb, zDateFin:zDateFin, zHeureEntree:zHeureEntree,
								zMinuteEntree:zMinuteEntree, zSecondeEntree:zSecondeEntree,zLieuEvent:zLieuEvent,zDescription:zDescription,iDegre:iDegre},
							success: function(data, textStatus, jqXHR) {
								$( "#contentEventAll" ).html(data);
								$('#calendar').fullCalendar('refetchEvents');
								$( "#dialogEvent" ).html();
								$( "#dialogEvent" ).dialog( "close" );
								
								event.preventDefault();
							},
							async: false
						});
					}
				}
			},
			{
				text: "Annuler",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		]
	});


	$( ".calendrier" ).click(function( event ) {
		$("#rightContent").toggle();
	});
    $( ".layoutCal" ).click(function( event ) {
		$("#rightContent").toggle();
	});

	$( ".SelectCompte" ).click(function( event ) {
		var iCompteId = $(this).attr("selectId");
		$("#iCompteId").val(iCompteId) ; 
		$("#setCompte").submit();
		
	});
		
	$( ".delEvent" ).click(function( event ) {
		
		var iEventId = $(this).attr('iEventId');
		if (confirm("Êtes vous sûr de vouloir supprimer cet événement ?")) {

		}
	});

	$( ".dialog-add_event" ).click(function( event ) {
		$("#dialogEvent").html();
		var iUserId = iUserIdConnect;

	});
});

