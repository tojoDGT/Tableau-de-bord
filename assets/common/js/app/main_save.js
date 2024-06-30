$(document).ready (function ()
{
	$( ".withDatePicker1" ).datepicker({
		minDate: new Date(2015, 00, 01),
		maxDate: new Date(2018, 11, 31),
		dateFormat: "dd/mm/yy",
		changeMonth: true,
		numberOfMonths: 1,
		changeYear: true,
	});
})

function setFinDateTransaction(_zValue){

	var toDateDebut = _zValue.split('/');
	$(document).ready (function ()
	{
		$("#date_fin").datepicker("destroy");
		$( "#date_fin" ).datepicker({
			minDate: new Date(2015, 00, 01),
			maxDate: new Date(toDateDebut[2], 11, 31),
			dateFormat: "dd/mm/yy",
			changeMonth: true,
			numberOfMonths: 1,
			changeYear: true,
		});
	})
}

function valider(_zBasePath, _iTest)
{
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;


		if (_iTest == 1 || _iTest == 4 || _iTest == 6)
		{
			var zDateDebut =  $("#date_debut").val();
			var zDateFin =  $("#date_fin").val();


			if((zDateDebut != '') && (zDateFin != '')){

				var toDateDebut = zDateDebut.split('/');
				var toDateFin = zDateFin.split('/');


				var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
				var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

				$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
				$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
				
				if(d1 > d2)
				{
					iRet = 0 ;
					$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieur &agrave; la date fin");
					$(".debut").parent().addClass("error");
					$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieur &agrave; la date de d&eacute;but");
					$(".fin").parent().addClass("error");
				}
			}

			if ($("#iTestDateSiganture").val()==1)
			{

				var zDateCreation = $("#dateCreation").val();
				var zDateSignature = $("#date_signature").val();


				if(zDateSignature != undefined) {

					var toDateCreation = zDateCreation.split('-');
					var toDateSignature = zDateSignature.split('/');

					var d3 = new Date(toDateCreation[0],toDateCreation[1]-1,toDateCreation[2]); 
					var d4 = new Date(toDateSignature[2],toDateSignature[1]-1,toDateSignature[0]); 

					if(d3 >= d4)
					{
						iRet = 0 ;
						$(".signature").html("la date de signature de la d&eacute;cision doit &ecirc;tre diff&eacute;rente de la date de cr&eacute;ation de la d&eacute;cision");
						$(".signature").parent().addClass("error");
						
					}
				}
			}
			
		}

		if (_iTest == 4)
		{
			iValue = parseInt ($("#nbrJour").val());

			if (isNaN(iValue))
			{
				iRet = 0 ;
				$("#nbrJour").parent().removeClass("error");
				$(".nbsJourdec").html("");
				$("#nbrJour").parent().addClass("error");
			}
		}

		if (_iTest == 3)
		{
			$("#zCandidat").parent().removeClass("error");
			
			if($("#zCandidat").select2 ('val') == '')
			{	
				iRet = 0 ;
				
				$("#zCandidat").parent().addClass("error");
			}
			else
			{ 
				$("#zCandidat").parent().removeClass("error");
			}
			
		}

		if (_iTest == 6)
		{
			$("#zCandidatSearchMessage").parent().removeClass("error");
			
			if($("#zCandidatSearch").select2 ('val') == '')
			{	
				iRet = 0 ;
				
				$("#zCandidatSearchMessage").parent().addClass("error");
			}
			else
			{ 
				$("#zCandidatSearchMessage").parent().removeClass("error");
			}
			
		}

		if (iRet == 1)
		{	
			
			iTypeGcapId = $("#iTypeGcapId").val();
			var iPeriode = 0;
			if (iTypeGcapId == 3){
				var zDateDebut	=  $("#date_debut").val();
				var zDateFin	=  $("#date_fin").val();
				var iTypeId	=  $("#type_id").val();


				if((zDateDebut != '') && (zDateFin != '')){

					var toDateDebut = zDateDebut.split('/');
					var toDateFin = zDateFin.split('/');


					var dateDebutPeriode = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
					var dateFinPeriode = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

					iPeriode = (dateFinPeriode.getDate()-dateDebutPeriode.getDate())+1;

					if (dateDebutPeriode.getDay() == 1){
						iPeriode += 2;
					}

					if (dateFinPeriode.getDay() == 5){
						iPeriode += 2;
					}

					iDemiJournee = $('#iDemiJournee').is(':checked');

					if (iDemiJournee == true){
						iPeriode -= 0.5; 
					}

				}
			}

			if (_iTest == 1){
				
				var iId			=  $("#iId").val();

				if (iId == "" || iId == 0) {
				
					var zDateDebut	=  $("#date_debut").val();
					var zDateFin	=  $("#date_fin").val();
					var iTypeId	=  $("#type_id").val();
					
					$.ajax({
						url: _zBasePath + "gcap/TestDate/",
						method: "POST",
						data: { date_debut: zDateDebut, date_fin: zDateFin, iTypeId: iTypeId},
						success: function(data, textStatus, jqXHR) {
							if (data == 1) {
								alert($("#zMessageDate").val());
							} else {
								if (iTypeGcapId == 3) {

									var iMaxPrise = 3;
									/* Autorisation d'absence spéciale*/
									if (iTypeId == 19) 
									{
										var iMaxPrise = 7;
									}
									if (iPeriode > iMaxPrise) {
										var iConge = iPeriode - iMaxPrise;
										var zS = "";
										if (iConge > 1) {
											zS = "s";
										}
										if (confirm("Êtes-vous sûr de confirmer "+iMaxPrise+" jours d'autorisations d'absence et "+iConge+" jour"+zS+" de congé?")) {
											$("#formulaireEdit").submit();
										}
									} else {
										$("#formulaireEdit").submit();
									}
								} else {
									$("#formulaireEdit").submit();
								}
							}
						},
						async: false
					});
				} else {

					if (iTypeGcapId == 3) {
						if (iPeriode > 3) {
							var iConge = iPeriode - 3;
							var zS = "";
							if (iConge > 1) {
								zS = "s";
							}
							if (confirm("Êtes-vous sûr confimer 3 jours d'autorisation d'absence et "+iConge+" de congé"+zS)) {
								$("#formulaireEdit").submit();
							}
						} else {
							$("#formulaireEdit").submit();
						}
					} else {
						$("#formulaireEdit").submit();
					}
				}

			} else {
				if (iTypeGcapId == 3) {
					if (iPeriode > 3) {
						var iConge = iPeriode - 3;
						var zS = "";
						if (iConge > 1) {
							zS = "s";
						}
						if (confirm("Êtes-vous sûr confimer 3 jours d'autorisation d'absence et "+iConge+" de congé"+zS)) {
							$("#formulaireEdit").submit();
						}
					} else {
						$("#formulaireEdit").submit();
					}	
				} else {
					$("#formulaireEdit").submit();
				}
			}
        
		}
	})
}


function validerSansDate()
{
	var iRet = 1 ; 
	
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		if (iRet == 1)
		{	
			$("#formulaireEdit").submit();
		}
	})
}


function validerReclassement()
{
	var iRet = 1 ; 
	
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		$("#iInstitutSearchMessage").parent().removeClass("error");

		if($("#iInstituId").select2 ('val') == '')
		{	
			iRet = 0 ;
			$("#iInstitutSearchMessage").parent().addClass("error");
		}
		else
		{ 
			$("#iInstitutSearchMessage").parent().removeClass("error");
		}

		$("#iDiplomeSearchMessage").parent().removeClass("error");

		if($("#iDiplomeId").select2 ('val') == '')
		{	
			iRet = 0 ;
			$("#iDiplomeSearchMessage").parent().addClass("error");
		}
		else
		{ 
			$("#iDiplomeSearchMessage").parent().removeClass("error");
		}

		$("#iUserSearchMessage").parent().removeClass("error");

		if($("#iUserId").select2 ('val') == '')
		{	
			iRet = 0 ;
			$("#iUserSearchMessage").parent().addClass("error");
		}
		else
		{ 
			$("#iUserSearchMessage").parent().removeClass("error");
		}

		if (iRet == 1)
		{	
			$("#formulaireEdit").submit();
		}
	})
}



function setCongeAnnuelCumule(_zBasePath, _iTypeId, _iUserId)
{
	// décision de congé cumulé
	if (_iTypeId == 2) {
		
		$(document).ready (function ()
		{
			$.ajax({
				url: _zBasePath + "gcap/setCongeAnnuelCumule/",
				method: "POST",
				data: { iUserId:_iUserId, iTypeId: _iTypeId},
				success: function(data, textStatus, jqXHR) {
					if (data == 0) {
						alert($("#zMessageCumulee").val());
						$("#type_id").val("");
					} 
				},
				async: false
			});
		});
	}
}


function validerGcap(_iTest, iVerdict)
{
	var iRet = 1 ; 

	$("#decision").val(iVerdict);
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		/*$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;*/


		if (_iTest == 1 || _iTest == 4)
		{
			var zDateDebut =  $("#date_debut").val();
			var zDateFin =  $("#date_fin").val();


			if((zDateDebut != '') && (zDateFin != '')){

				var toDateDebut = zDateDebut.split('/');
				var toDateFin = zDateFin.split('/');


				var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
				var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

				$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
				$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
				
				if(d1 > d2)
				{
					iRet = 0 ;
					$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieur &agrave; la date fin");
					$(".debut").parent().addClass("error");
					$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieur &agrave; la date de d&eacute;but");
					$(".fin").parent().addClass("error");
				}
			}

			if ($("#iTestDateSiganture").val()==1)
			{

				var zDateCreation = $("#dateCreation").val();
				var zDateSignature = $("#date_signature").val();


				if(zDateSignature != undefined) {

					var toDateCreation = zDateCreation.split('-');
					var toDateSignature = zDateSignature.split('/');

					var d3 = new Date(toDateCreation[0],toDateCreation[1]-1,toDateCreation[2]); 
					var d4 = new Date(toDateSignature[2],toDateSignature[1]-1,toDateSignature[0]); 

					if(d3 >= d4)
					{
						iRet = 0 ;
						$(".signature").html("la date de signature de la d&eacute;cision doit &ecirc;tre diff&eacute;rente de la date de cr&eacute;ation de la d&eacute;cision");
						$(".signature").parent().addClass("error");
						
					}
				}
			}
			
		}

		if (_iTest == 4)
		{
			iValue = parseInt ($("#nbrJour").val());

			if (isNaN(iValue))
			{
				iRet = 0 ;
				$("#nbrJour").parent().removeClass("error");
				$(".nbsJourdec").html("");
				$("#nbrJour").parent().addClass("error");
			}
			
			
		}

		if (_iTest == 3)
		{
			$("#zCandidat").parent().removeClass("error");
			
			if($("#zCandidat").select2 ('val') == '')
			{	
				iRet = 0 ;
				
				$("#zCandidat").parent().addClass("error");
			}
			else
			{ 
				$("#zCandidat").parent().removeClass("error");
			}
			
		}

		if (iRet == 1)
		{	
			$("#formulaireEdit").submit();
		}
	})
}

$(document).ready (function ()
{

	$(".suppr").click (function ()
	{
		var iElement = $(this).attr("dataSuppr");
		if (confirm ($("#zMessage").val()))
		{
			$("#iValueId").val(iElement) ; 
			$("#formDelete").submit();
			
		}
	})

	$(".suppr11").click (function ()
	{
		var iElement = $(this).attr("dataSuppr");
		var iHashUrl = $(this).attr("zhashurl");

		switch (iHashUrl) {
			case '2':
				var zHashUrl = "conge";
				break;

			case '3':
				var zHashUrl = "autorisation-abscence";
				break;

			case '4':
				var zHashUrl = "permission";
				break;

			case '5':
				var zHashUrl = "repos-medical";
				break;
		}
		if (confirm ($("#zMessage").val()))
		{
			zAction = $("#formDelete").attr("action");
			$("#formDelete").removeAttr("action");
			$("#formDelete").attr("action", zAction + zHashUrl);
			$("#iValueId").val(iElement) ; 
			$("#formDelete").submit();
			
		}
	})
})

function getEventCorrespondant (_zBasePath, _iValueId, _iTypeGcapId)
{
	if (_iValueId == 18 || _iValueId == 19 || _iValueId == 20)
	{
		// Autorisation spécial absence => affichage caractéristique
		$("#caracteristiqueAutorisation").hide();
		$("#caracteristique").val('');
		
		if (_iValueId == 20)
		{
			$("#caracteristiqueAutorisation").show();
		}
		$.ajax({
            url: _zBasePath + "gcap/getMotif/" + _iValueId,
            type: 'get',
            success: function(data, textStatus, jqXHR) {
                $('#motif').html('');
                $('#motif').html(data);
                
            },
            async: false
         });
	}

	if(_iTypeGcapId == 2) {

		$('#decisionCorrespondant').html('');
		$('#decisionCorrespondant').hide();
	}

	if (_iValueId >= 11 && _iValueId <=17)
	{
		
		$.ajax({
            url: _zBasePath + "gcap/getDecision/" + _iValueId,
            type: 'get',
            success: function(data, textStatus, jqXHR) {
                $('#decisionCorrespondant').show();
				$('#decisionCorrespondant').html('');
                $('#decisionCorrespondant').html(data);
                
            },
            async: false
         });
	}
}


function paginate(_iNum)
{
	document.location.href = $("#zUrl").val() + '/' + _iNum ;
}

function paginateSearch(_iNum)
{
	$("#formulaireSearch").attr("action", $("#zUrl").val()+ '/' + _iNum);
	$("#formulaireSearch").submit();
}

function setToolType (_zBasePath, _iTypeId)
{
	if(_iTypeId == '')
	{
		$("#allToltip").hide();
	}
	else
	{
		$("#allToltip").show();
		$.ajax({
			url: _zBasePath + "gcap/getContentType/" + _iTypeId,
			type: 'get',
			success: function(data, textStatus, jqXHR) {
				$('.getType').html('');
				$('.getType').html(data);
				
			},
			async: false
		});
	}

}

function GetCalendar (_iAnnee)
{
 

		var iAnneEnCours = $("#iAnneEnCours").val();
		var iAnnePriseService = $("#iAnnePriseService").val();
		var zDatePriseService = $("#date_prise_service").val();


		var iMoisDebut = 1;
		var iJourDebut = 1;
		
		if (iAnnePriseService == _iAnnee) {
			oDate = zDatePriseService.split('-');

			iMoisDebut = oDate[1];
			iJourDebut = oDate[2];
		}


		var Res = eval(iAnneEnCours) - eval(_iAnnee)
		
		Res = Res * 360 ;
		zAffiche = "D-" + Res ; 

		$( ".withDatePicker" ).datepicker("destroy");

		$( "#date_debut" ).datepicker({
			minDate: new Date(_iAnnee, iMoisDebut - 1, iJourDebut),
			maxDate: new Date(_iAnnee, 12 - 1, 31),
			dateFormat: "dd/mm/yy",
			changeMonth: true,
			numberOfMonths: 1,
			changeYear: true,
		});

		$( "#date_debut" ).datepicker( "setDate", "1/1/"+ _iAnnee);

		$( "#date_fin" ).datepicker({
			minDate: new Date(_iAnnee, 1 - 1, 1),
			maxDate: new Date(_iAnnee, 12 - 1, 31),
			dateFormat: "dd/mm/yy",
			changeMonth: true,
			numberOfMonths: 1,
			changeYear: true,
		});

		$( "#date_fin" ).datepicker( "setDate", "31/12/"+ _iAnnee);
		setDateFin();
}

function setDelegue (_iValue)
{
	if(_iValue==5) {
		$("#delegue").show();
	} else {
		$("#delegue").hide();
	}
}

/*MODIF LUCIA*/
function changeMotif(){
	var motif = $("#motif").val();
	var type = $("#type_id").val();
	if(motif==3 && type == 18){
		$("#conv_pers").show();
		$("#iPieceJointeId").hide();
	}
	else{
		$("#conv_pers").hide();
		$("#iPieceJointeId").show();
	}
}

function getOrganisation(_zBasePath, _iType, _iValue)
{
	$.ajax({
		url: _zBasePath + "gcap/organisation/" + _iType +'/' +_iValue ,
		type: 'get',
		success: function(data, textStatus, jqXHR) {
			
			$('#iOrganisation_' + _iType).html(data);
			
		},
		async: false
	});
}

function changeMotif1(_iMotif){
	var motif = _iMotif;
	var type = $("#type_id").val();
	$("#champsConvPers").removeClass("obligatoire");
	if(motif==3 && type == 18){
		$("#conv_pers").show();
		$("#iPieceJointeId").hide();
		$("#champsConvPers").addClass("obligatoire");
		$("#zFile").removeClass("obligatoire");
	}
	else{
		$("#conv_pers").hide();
		$("#iPieceJointeId").show();
		$("#champsConvPers").removeClass("obligatoire");
		$("#zFile").addClass("obligatoire");
	}
}

function dateDiff(date1, date2){
    var diff = {}                           // Initialisation du retour
    var tmp = date2 - date1;
 
    tmp = Math.floor(tmp/1000);             // Nombre de secondes entre les 2 dates
    diff.sec = tmp % 60;                    // Extraction du nombre de secondes
 
    tmp = Math.floor((tmp-diff.sec)/60);    // Nombre de minutes (partie entière)
    diff.min = tmp % 60;                    // Extraction du nombre de minutes
 
    tmp = Math.floor((tmp-diff.min)/60);    // Nombre d'heures (entières)
    diff.hour = tmp % 24;                   // Extraction du nombre d'heures
     
    tmp = Math.floor((tmp-diff.hour)/24);   // Nombre de jours restants
    diff.day = tmp;
     
    return diff;
}

function setDateFin() {


	var zDateDebut =  $("#date_debut").val();
	var zDateFin =  $("#date_fin").val();
	var iTypeId =  $("#type_id").val();

	var iAnnee = $("#annee").val();


	// Decision de congé et congé annuel n'est pas compris
	
		if ((zDateDebut != '') && (zDateFin != ''))
		{
			
			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');

			$( "#date_fin" ).datepicker({
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				numberOfMonths: 1,
				changeYear: true,
				onClose: function( selectedDate, inst ) {
						 var maxDate = new Date(Date.parse(selectedDate));
						 maxDate.setDate(maxDate.getDate() - 1);            
					}
			});
			
			if(iTypeId > 2)
			{
					var zNewDateDebut = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]);
					var zNewDateFin = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]);

					iNombreDeJour = dateDiff(zNewDateDebut, zNewDateFin);

					$("#nbrJour").val(iNombreDeJour.day);
					
			}
			else
			{
					
					zNewDateDebut = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]);
					zNewDateFin = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]);
					diff = dateDiff(zNewDateDebut, zNewDateFin);

					var iNombreDeJour = (diff.day * 30) / 364;

					iNombreDeJour = Math.round(iNombreDeJour*2)/2;

					if (iNombreDeJour> 30){
						iNombreDeJour = 30;
					}

					$("#nbrJour").val(iNombreDeJour);

					iValue = $("#nbrJour").val();

					iValue = iValue.replace(".", ",");
					$("#nbrJour").val(iValue);
			}
		}
	

}

function __setDateFin() {

	
	var iValue = $("#nbrJour").val();

	iValue = iValue.replace(",", ".");

	iValue = parseFloat (iValue);

	var zDateDebut =  $("#date_debut").val();
	var zDateFin =  $("#date_fin").val();
	var iTypeId =  $("#type_id").val();

	var iAnnee = $("#annee").val();


	// Decision de congé et congé annuel n'est pas compris
	
		if ((!isNaN(iValue) && (zDateDebut != '')))
		{
			
			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');

			$( "#date_fin" ).datepicker({
					dateFormat: "dd/mm/yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
					onClose: function( selectedDate, inst ) {
							 var maxDate = new Date(Date.parse(selectedDate));
							 maxDate.setDate(maxDate.getDate() - 1);            
						}
					});
			
			
			$( "#date_fin" ).attr("readonly","readonly");
			
			if(iTypeId > 2)
			{
					toDateDebut[0] = eval(toDateDebut[0]) + eval(iValue);
					var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]);
					$( "#date_fin" ).datepicker( "setDate", d1);
					$( "#date_fin" ).datepicker("destroy");
			}
			else
			{
					
					$( "#date_fin" ).datepicker({
					dateFormat: "dd/mm/yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
					onClose: function( selectedDate, inst ) {
							 var maxDate = new Date(Date.parse(selectedDate));
							 maxDate.setDate(maxDate.getDate() - 1);            
						}
					});

					
					date1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]);
					date2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]);
					diff = dateDiff(date1, date2);

					var iDenominateur = (diff.day * 30) / 364;
					


					var iDateAdd = (eval(iValue) * diff.day / iDenominateur) ;
					iDateAdd = Math.round(iDateAdd);

					var toDateAssign = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]);

					var zDateAdd = new Date(toDateAssign.setDate(toDateAssign.getDate() + iDateAdd)); 

					var zMaxDate = new Date(iAnnee,11,31);

					if (zDateAdd > zMaxDate) {
						$( "#date_fin" ).datepicker( "setDate", zMaxDate);
						alert("le nombre de jour entré dépasse le nombre de jour autorisé");
						$("#nbrJour").val("");
						
					} else {

						$( "#date_fin" ).datepicker( "setDate", toDateAssign);
					}

					

			}
		}
	

}

function sendSearch() {

	$("#formulaireSearch").attr("action", $("#zUrl").val());
	$("#formulaireSearch").submit();

}

function validerTransaction(_iTest)
{
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		
		var zDateDebut =  $("#date_debut").val();
		var zDateFin =  $("#date_fin").val();


		if((zDateDebut != '') && (zDateFin != '')){

			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');


			var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
			var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

			$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
			$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
			
			if(d1 > d2)
			{
				iRet = 0 ;
				$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieure &agrave; la date fin");
				$(".debut").parent().addClass("error");
				$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieure &agrave; la date de d&eacute;but");
				$(".fin").parent().addClass("error");
			}
		}



		if (iRet == 1)
		{	
			$("#formulaireTransaction").submit();
		}
	})
}

function validerPointage(_iTest)
{
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;


		
		var zDateDebut =  $("#date_debut").val();
		var zDateFin =  $("#date_fin").val();


		if((zDateDebut != '') && (zDateFin != '')){

			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');


			var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
			var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

			$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
			$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
			
			if(d1 > d2)
			{
				iRet = 0 ;
				$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieure &agrave; la date fin");
				$(".debut").parent().addClass("error");
				$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieure &agrave; la date de d&eacute;but");
				$(".fin").parent().addClass("error");
			}
		}



		if (iRet == 1)
		{	
			$("#formulaireTransaction").submit();
		}
	})
}

function validerSau()
{
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		if (iRet == 1)
		{	
			$("#formulaireVisiteur").submit();
		}
	})
}



function validerRang(_iTest)
{
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;


		
		var zDateDebut =  $("#date_debut").val();
		var zDateFin =  $("#date_fin").val();


		if((zDateDebut != '') && (zDateFin != '')){

			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');


			var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
			var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

			$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
			$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
			
			if(d1 > d2)
			{
				iRet = 0 ;
				$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieure &agrave; la date fin");
				$(".debut").parent().addClass("error");
				$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieure &agrave; la date de d&eacute;but");
				$(".fin").parent().addClass("error");
			}
		}



		if (iRet == 1)
		{	
			if (_iTest == 1) {
			
				iValueAction = $("#zUrlFiche").val();
				$("#formulaireTransaction").attr("action", iValueAction);
				$("#formulaireTransaction").attr("target", "_self");
				
			} else if (_iTest == 2) {
				iValueAction = $("#zUrlPdf").val();
				$("#formulaireTransaction").attr("action", iValueAction);
				$("#formulaireTransaction").attr("target", "_blank");
			} else { 
				iValueAction = $("#zUrlExcel").val();
				$("#formulaireTransaction").attr("action", iValueAction);
				$("#formulaireTransaction").attr("target", "_self");
			}

			$("#formulaireTransaction").submit();
		}
	})
}

function validerCommande()
{
	var iRet = 1 ; 
	
	$(document).ready (function ()
	{
		
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;


		if (iRet == 1)
		{	
			$("#formulaireCommande").submit();
		}
	})
}

function validerCA()
{
	var iRet = 1 ; 
	
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;


		
		var zDateDebut =  $("#date_debut").val();
		var zDateFin =  $("#date_fin").val();


		if((zDateDebut != '') && (zDateFin != '')){

			var toDateDebut = zDateDebut.split('/');
			var toDateFin = zDateFin.split('/');


			var d1 = new Date(toDateDebut[2],toDateDebut[1]-1,toDateDebut[0]); 
			var d2 = new Date(toDateFin[2],toDateFin[1]-1,toDateFin[0]); 

			$(".debut").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date de d&eacute;but");
			$(".fin").html("Veuillez cliquer ci-dessus pour s&eacute;l&eacute;ctionner la date fin");
			
			if(d1 > d2)
			{
				iRet = 0 ;
				$(".debut").html("la date de d&eacute;but doit &ecirc;tre inf&eacute;rieure &agrave; la date fin");
				$(".debut").parent().addClass("error");
				$(".fin").html("la date fin doit &ecirc;tre sup&eacute;rieure &agrave; la date de d&eacute;but");
				$(".fin").parent().addClass("error");
			}
		}



		if (iRet == 1)
		{	
			$("#formulaireCommande").submit();
		}
	})
}

function validerEntrerSortie()
{
	var iRet = 1 ; 
	
	var iRet = 1 ; 
	$(".debut").parent().removeClass("error");
	$(".fin").parent().removeClass("error");
	$(document).ready (function ()
	{
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		
		var zDate =  $("#zDate").val();
		var zHeureDebut =  $("#heure_entree").val();

		if (iRet == 1)
		{	
			$("#formulaireCommande").submit();
		}
	})
}

$(document).ready (function ()
{

	$('input[type=radio]').click(function(){
		
		var iValue = $(this).val();

		switch (iValue) {
			case '1':
				$("#isBadgePerdu").hide();
				$("#isModtif").hide();
				$("#isNotNouvelleCarte").hide();
				$("#isDatePerduOrDefectueuse").hide();
				$("#badge_datePerdue").removeClass("obligatoire");
				$("#badge_datePerdue").parent().removeClass("error");
				$("#zMotif").removeClass("obligatoire");
				$("#zMotif").parent().removeClass("error");
				$("#zFileDeclaration").removeClass("obligatoire");
				$("#zFileDeclaration").parent().removeClass("error");

				break;

			case '2':
				$("#isBadgePerdu").show();
				$("#isModtif").hide();
				$("#setLabel").html("Déclaration de perte");
				$("#isNotNouvelleCarte").show();
				$("#isDatePerduOrDefectueuse").show();
				$("#labelDate").html("Perdu le :");
				$("#badge_datePerdue").html('');
				$("#badge_datePerdue").addClass("obligatoire");
				$("#badge_datePerdue").parent().addClass("error");
				$("#zFileDeclaration").addClass("obligatoire");
				$("#zFileDeclaration").parent().addClass("error");
				$("#zMotif").removeClass("obligatoire");
				$("#zMotif").parent().removeClass("error");
				break;

			case '3':
				$("#isBadgePerdu").hide();
				$("#isModtif").show();
				$("#isNotNouvelleCarte").show();
				$("#isDatePerduOrDefectueuse").show();
				$("#labelDate").html("Défectueuse le :");
				$("#badge_datePerdue").html('');
				$("#badge_datePerdue").addClass("obligatoire");
				$("#badge_datePerdue").parent().addClass("error");
				$("#zMotif").addClass("obligatoire");
				$("#zMotif").parent().addClass("error");
				$("#zFileDeclaration").removeClass("obligatoire");
				$("#zFileDeclaration").parent().removeClass("error");
				break;

			case '4':
				$("#isBadgePerdu").show();
				$("#isModtif").hide();
				$("#setLabel").html("Pièce Justificative");
				$("#isNotNouvelleCarte").show();
				$("#isDatePerduOrDefectueuse").hide();
				$("#badge_datePerdue").html('');
				$("#badge_datePerdue").removeClass("obligatoire");
				$("#badge_datePerdue").parent().removeClass("error");
				$("#zFileDeclaration").addClass("obligatoire");
				$("#zFileDeclaration").parent().addClass("error");
				$("#zMotif").removeClass("obligatoire");
				$("#zMotif").parent().removeClass("error");

				break;
		}

		
	});
	
})

function paginate(_iNum)
{
	iValueAction = $("#zUrl").val() + '/' + _iNum ;
	$("#formulaireTransaction").attr("action", iValueAction)
	$("#formulaireTransaction").submit();
}

function rechercher()
{
	$("#formulaireTransaction").submit();
}

function fichePaiement()
{
	iValueAction = $("#zUrlFiche").val();
	$("#formulaireTransaction").attr("action", iValueAction);
	$("#formulaireTransaction").attr("target", "_self");
	$("#formulaireTransaction").submit();
}

function ImpressionPaiement()
{
	iValueAction = $("#zUrlImpression").val() ;
	$("#formulaireTransaction").attr("target", "_blank");
	$("#formulaireTransaction").attr("action", iValueAction);
	$("#formulaireTransaction").submit();
}
