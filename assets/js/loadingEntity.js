$(".telephone").mask("999 99 999 99");
$("#entite_anneeDemarrage").mask("9999"); 
$("#entite_telephone").mask("999 99 999 99"); 
$("#contact_telephone1").mask("999 99 999 99"); 
$("#contact_telephone2").mask("999 99 999 99");
$(".telephone").mask("999 99 999 99");


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