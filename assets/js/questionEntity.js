$(document).ready (function ()
{
	
	$('.AddLigne').on("click",function(){
		
			var iCible = $(this).attr("incrementCible");  
			var zTable = $(this).attr("tableCible");  
			var iType = $(this).attr("iTypeCible");  

			var iNbr = $('#' + iCible).val();
			iIndexNew = eval(iNbr)+1;
			$('#' + iCible).val(iIndexNew);
			getAjax(zTable,iIndexNew,iType,'getTemplate');
			$('html, body').animate({
				scrollTop: $(this).offset().top
			}, 1500);
	});  

	function getAjax(_zCible,_iIndexNew,_iType,_zTemplate){
		
		$("#beforeSend11").show();
		$.ajax({
			url: zBasePath + "produit/"+_zTemplate+"/",
			type: 'post',
			data: {
				iIndexNew : _iIndexNew,
				iType	  : _iType,
				zHashUrl  : $("#zHashUrl").val()
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
			$.getScript( zBasePath + "assets/js/loadingEntity.js" )
		});
	}
})


function deleteLigne(_zCible, _index, iNb){
	   $("#"+_zCible +_index).fadeOut('slow',function(){
		   $(this).html('');

			if(_zCible == 'LigneAct1Tr_' || _zCible == 'LigneAct2Tr_' || _zCible == 'LigneAct3Tr_' 
			|| _zCible == 'LigneOctroi3Tr_' || _zCible == 'LigneOctroi2Tr_' || _zCible == 'LigneOctroi1Tr_' || _zCible == 'LigneEpargne1Tr_' 
			|| _zCible == 'LigneEpargne2Tr_' || _zCible == 'LigneEpargne3Tr_' ||  _zCible == 'LigneZoneTr_' ||  _zCible == 'poActiviteTr_'){
				getTotal();
			}

			

			switch (_zCible)
			{
				case 'LigneSocietariatAssuranceTr_':

					if(iNb != undefined){
						
						for (var i = 1; i <= iNb; i++){
	
							var iCible = i;
							var iTotal = 0;
							$(".calculSocietariat"+iCible).each (function ()
							{
								if($(this).val()!=''){
									iTotal += eval($(this).val()); 
								}
							});
							$("#iCible_"+iCible).html(iTotal);
						}
					}
				
				case 'LigneActiviteCemTr_':
					if(iNb != undefined){
						
						for (var j = 1; j <= iNb; j++){
	
							var iCible1 = j;
							var iTotal = 0;
							$(".calculVolumeActivite"+iCible1).each (function ()
							{
								if($(this).val()!=''){
									iTotal += eval($(this).val().replace(/ /g, '')); 
								}
							});

							if(iCible1==3 || iCible1==4){
								iTotal = iTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar";
							}
							$("#iCibleAct_"+iCible1).html(iTotal);
						}
					}
					break;
				
				case 'LignePorteFeuilleTr_':
					if(iNb != undefined){
						
						for (var k = 1; k <= iNb; k++){
	
							var iCible2 = k;
							var iTotal = 0;
							$(".calculPorteFeuille"+iCible2).each (function ()
							{
								if($(this).val()!=''){
									iTotal += eval($(this).val().replace(/ /g, '')); 
								}
							});

							iTotal = iTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar";
							$("#iCibleQP_"+iCible2).html(iTotal);
						}
					}
					break;
		
			}
	   });
}
