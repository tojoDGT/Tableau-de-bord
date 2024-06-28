
$(document).ready (function ()
{
	
	$('input[name="iTypeProduitId"]').on('click', function() {
			$("#getStat").html("");
			$("#getStat").html('<div style=";min-height: 500px;text-align: center;vertical-align: middle;padding-top: 150px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="150">');
			$("#iTypeP").val($(this).val());
			$.ajax({
				url: zBasePath + "dashboard/getExportOta/",
				type: 'post',
				data: {
					iTypeProduit  : $(this).val()
				},
				success: function (zReturn, textStatus, jqXHR) {
					$("#getStat").html(zReturn);
				}
			});
	});
	
	$('.searchTransverse1').on("click",function(){
		var iRet = 1 ; 
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				 $(this).parent().addClass("error");
				 iRet = 0 ;
			}
		}) ;

		if(iRet==1){
			$('#transverseForm1').submit();
		}
	})

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
				iIndexNew		  : _iIndexNew,
				zValueOTA		  : _zValueOTA,
				iType			  : _iType,
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

})


function deleteOTA(removeNum) {
	$('#rowCount_'+removeNum).remove();
}