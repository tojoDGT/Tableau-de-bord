
$('#ligneOTA').on("click",ligneOTA);

function ligneOTA(){
	
	var iNbrOTA = $('#nbrOTA').val();
	var zValueOTA = $('#zValueOTA').val();
	iIndexNew = eval(iNbrOTA)+1;
	$('#nbrOTA').val(iIndexNew);
	getAjax('tableLigneOTA',iIndexNew,1,'getTemplate',zValueOTA);
	$('html, body').animate({
		scrollTop: $(this).offset().top
	}, 1500);
	
}


function getAjax(_zCible,_iIndexNew,_iType,_zTemplate, _zValueOTA){
	
	$("#beforeSend11").show();
	$.ajax({
		url: zBasePath + "dashboard/"+_zTemplate+"/",
		type: 'post',
		data: {
			iIndexNew : _iIndexNew,
			zValueOTA : _zValueOTA,
			iType	  : _iType,
			iTypeProduitId	  : $("#iTypeP").val(),
			zHashUrl		  : $("#zHashUrl").val()
		},
		success: function(data, textStatus, jqXHR) {

			var zRow = $(data);
			zRow.hide();

			var iTotalAll = $('#'+_zCible+" tr").hasClass("totalAll");

			if(iTotalAll == true){
				$('#'+_zCible+" tr.totalAll").before(zRow);
			} else {
				$('#'+_zCible).append(zRow);
			}
			
			zRow.fadeIn(1000);
			event.preventDefault()
			$("#beforeSend11").hide();
			
		},
		async: false
	}).done(function() {
		$.getScript( zBasePath + "assets/js/loading.js" )
	});
}
