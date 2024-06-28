$(".prix").numeric({ decimal : ".",  negative : false, scale: 2 });
$(".entier").numeric({ decimal : false,  negative : false });

$('.prix').on("click change",function(){
	var value = $(this).val();

	var formattedValue = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')
	$(this).val(formattedValue);
});

$(".radioSpo").click(function() {
	var iValue = $(this).val();

	var isChecked = $(this).is(':checked');  

	switch (isChecked) {
		case true:
			$("#spo-" + iValue).show();
			if(iValue>1){
				$("#epargne-type-"+iValue).show();
			}
			break;

		case false:
			$("#spo-" + iValue).hide();
			if(iValue>1){
				$("#epargne-type-"+iValue).hide();
			}
			break;
	}
});

$(".calculAutreVolumeActivite").change(function() {
		
	var iCible1 = $(this).attr("iCibleVolume");
	var iTotal = 0;
	$(".calculAutreVolumeActivite"+iCible1).each (function ()
	{
		if($(this).val()!=''){
			iTotal += eval($(this).val().replace(/ /g, '')); 
		}
	});

	$("#iCibleVolume_"+iCible1).html(iTotal);
});

$(".calculZone").change(function() {
	var iTotal = 0
	$(".calculZone").each (function ()
	{
		iTotal += eval($(this).val()); 
	}) ;

	$("#totalZone").html(iTotal);
});

$(".calculSocietariat").change(function() {
		
	var iCible = $(this).attr("iCible");
	var iTotal = 0;
	$(".calculSocietariat"+iCible).each (function ()
	{
		if($(this).val()!=''){
			iTotal += eval($(this).val()); 
		}
	});

	$("#iCible_"+iCible).html(iTotal);
});

 $( ".withDatePicker" ).datepicker({
	dateFormat: "dd/mm/yy",
	changeMonth: true,
	numberOfMonths: 1,
	changeYear: true,
});

$(".calculVolumeActivite").change(function() {
		
	var iCible1 = $(this).attr("iCible");
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
});

$(".calculPorteFeuille").change(function() {
		
	var iCible1 = $(this).attr("iCible");
	var iTotal = 0;
	$(".calculPorteFeuille"+iCible1).each (function ()
	{
		if($(this).val()!=''){
			iTotal += eval($(this).val().replace(/ /g, '')); 
		}
	});

	iTotal = iTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar";

	$("#iCibleQP_"+iCible1).html(iTotal);
});

$('.automatique').on("click change",function(){
	getTotal();
});

function getTotal(){


	$('.setCalculAuto').remove();

	$(".parSecteur").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var iBoucle = 0;
		var zNomNombre = $(this).attr("zNomNombre");
		var zNomMontant = $(this).attr("zNomMontant");
		var zSecteurValue = $(this).attr("zSecteurValue");

		var iNombreTotal = 0;
		var rMontantTotal = 0;

		$("."+zSecteurValue+":checked").each (function ()
		{
			var iType = $(this).html();

			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			var rMontant = $('input[name="'+zNomMontant+'[]"]').eq(iBoucle).val().replace(/ /g, '');

			var zContent = iType +"_"+ iNombre + "_" + rMontant;
			iTableauContent.push(zContent);

			if(iNombre >0){
				iNombreTotal += eval(iNombre);
			}

			if(rMontant >0){
				rMontantTotal += eval(rMontant);
			}

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";
		
		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
					if(toExplodeType[2]!='' && toExplodeType[2] !=undefined){
						rMontant += eval(toExplodeType[2]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+rMontant.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td></tr>";

			if(iNombre!=0 && iTableauType[i]!='' && rMontant!=0){
				$(this).append(zHtml);
			}
		}

		if(iNombreTotal>0){

			var zHtmlTotal = "<tr style='color:#f100ff!important' class='setCalculAuto'>";
			zHtmlTotal += "<td><strong>Total</strong></td>";
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td></tr>";
			$(this).append(zHtmlTotal);
		}

		iNombreTotal = 0;
		rMontantTotal = 0;


	});


	$(".parRegion").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var zNomNombre = $(this).attr("zNomNombre");
		var zNomMontant = $(this).attr("zNomMontant");
		var zSetRegValue = $(this).attr("zSetRegValue");

		var iBoucle = 0;
		var iNombreTotal = 0;
		var rMontantTotal = 0;

		$("."+zSetRegValue+":checked").each (function ()
		{
			var iType = $(this).html();
			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			var rMontant = $('input[name="'+zNomMontant+'[]"]').eq(iBoucle).val().replace(/ /g, '');

			var zContent = iType +"_"+ iNombre + "_" + rMontant;
			iTableauContent.push(zContent);

			if(iNombre >0){
				iNombreTotal += eval(iNombre);
			}

			if(rMontant >0){
				rMontantTotal += eval(rMontant);
			}

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";

		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
					if(toExplodeType[2]!='' && toExplodeType[2] !=undefined){
						rMontant += eval(toExplodeType[2]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+rMontant.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td></tr>";

			if(iNombre!=0 && iTableauType[i]!='' && rMontant!=0){
				$(this).append(zHtml);
			}
		}

		if(iNombreTotal>0){

			var zHtmlTotal = "<tr style='color:#f100ff!important' class='setCalculAuto'>";
			
			zHtmlTotal += "<td><strong>Total</strong></td>";
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td></tr>";
			$(this).append(zHtmlTotal);
		}
	});


	$(".parSecteurAssurance").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var iBoucle = 0;
		var zNomNombre = $(this).attr("zNomNombre");
		var zNomMontant = $(this).attr("zNomMontant");
		var zSecteurValue = $(this).attr("zSecteurValue");
		var zMontantCapitaliser = 0;//$(this).attr("zMontantCapitaliser");

		$("."+zSecteurValue+":checked").each (function ()
		{
			var iTotalNombre = 0;
			var iTotalIndemnistations = 0;
			var iType = $(this).html();

			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			var rMontant = $('input[name="'+zNomMontant+'[]"]').eq(iBoucle).val().replace(/ /g, '');
			var rMontantCapitaliser = 0;
			//var rMontantCapitaliser = $('input[name="'+zMontantCapitaliser+'[]"]').eq(iBoucle).val().replace(/ /g, '');

			iTotalNombre += eval(($('input[name="activiteAssurance_nbFemme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbFemme[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbHomme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbHomme[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbCreancier[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbCreancier[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbAgriculteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbAgriculteur[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbSouscripteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbSouscripteur[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbPersMorale[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbPersMorale[]"]').eq(iBoucle).val());


			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbFemme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbFemme[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbHomme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbHomme[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbCreancier[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbCreancier[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbAgriculteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbAgriculteur[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbSouscripteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbSouscripteur[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbPersMorale[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbPersMorale[]"]').eq(iBoucle).val().replace(/ /g, ''));

			var zContent = iType +"_"+ iNombre + "_" + rMontant + "_" + rMontantCapitaliser + "_" + iTotalNombre+ "_" + iTotalIndemnistations;
			iTableauContent.push(zContent);

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";
		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			var rMontantCapitaliser = 0;
			var iTotalNombre = 0;
			var iTotalIndemnistations = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
					if(toExplodeType[2]!='' && toExplodeType[2] !=undefined){
						rMontant += eval(toExplodeType[2]);
					}
					
					if(toExplodeType[3]!='' && toExplodeType[3] !=undefined){
						rMontantCapitaliser += eval(toExplodeType[3]);
					}

					if(toExplodeType[4]!='' && toExplodeType[4] !=undefined){
						iTotalNombre += eval(toExplodeType[4]);
					}

					if(toExplodeType[5]!='' && toExplodeType[5] !=undefined){
						iTotalIndemnistations += eval(toExplodeType[5]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+rMontant.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			//zHtml += "<td style='text-align:right'>"+rMontantCapitaliser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			zHtml += "<td>"+iTotalNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+iTotalIndemnistations.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td></tr>";

			if(iNombre!=0 && iTableauType[i]!='' && rMontant!=0){
				$(this).append(zHtml);
			}
		}
	});


	$(".parRegionAssurance").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var zNomNombre = $(this).attr("zNomNombre");
		var zNomMontant = $(this).attr("zNomMontant");
		var zSetRegValue = $(this).attr("zSetRegValue");
		var zMontantCapitaliser = 0;//$(this).attr("zMontantCapitaliser");

		var setClassNombre = $(this).attr("setClassNombre");
		var setClassMontant = $(this).attr("setClassMontant");
		
			

		var iBoucle = 0;
		$("."+zSetRegValue+":checked").each (function ()
		{
			var iTotalNombre = 0;
			var iTotalIndemnistations = 0;
			var iType = $(this).html();
			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			var rMontant = $('input[name="'+zNomMontant+'[]"]').eq(iBoucle).val().replace(/ /g, '');
			var rMontantCapitaliser = 0;
			//var rMontantCapitaliser = $('input[name="'+zMontantCapitaliser+'[]"]').eq(iBoucle).val().replace(/ /g, '');

			iTotalNombre += eval(($('input[name="activiteAssurance_nbFemme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbFemme[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbHomme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbHomme[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbCreancier[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbCreancier[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbAgriculteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbAgriculteur[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbSouscripteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbSouscripteur[]"]').eq(iBoucle).val());
			iTotalNombre += eval(($('input[name="activiteAssurance_nbPersMorale[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_nbPersMorale[]"]').eq(iBoucle).val());


			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbFemme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbFemme[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbHomme[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbHomme[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbCreancier[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbCreancier[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbAgriculteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbAgriculteur[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbSouscripteur[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbSouscripteur[]"]').eq(iBoucle).val().replace(/ /g, ''));
			iTotalIndemnistations += eval(($('input[name="activiteAssurance_montantNbPersMorale[]"]').eq(iBoucle).val()=='')?0:$('input[name="activiteAssurance_montantNbPersMorale[]"]').eq(iBoucle).val().replace(/ /g, ''));


			var zContent = iType +"_"+ iNombre + "_" + rMontant + "_" + rMontantCapitaliser + "_" + iTotalNombre+ "_" + iTotalIndemnistations;

			iTableauContent.push(zContent);

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";
		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			var rMontantCapitaliser = 0;
			var iTotalNombre = 0;
			var iTotalIndemnistations = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
					if(toExplodeType[2]!='' && toExplodeType[2] !=undefined){
						rMontant += eval(toExplodeType[2]);
					}

					if(toExplodeType[3]!='' && toExplodeType[3] !=undefined){
						rMontantCapitaliser += eval(toExplodeType[3]);
					}

					if(toExplodeType[4]!='' && toExplodeType[4] !=undefined){
						iTotalNombre += eval(toExplodeType[4]);
					}

					if(toExplodeType[5]!='' && toExplodeType[5] !=undefined){
						iTotalIndemnistations += eval(toExplodeType[5]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+rMontant.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			//zHtml += "<td style='text-align:right'>"+rMontantCapitaliser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			zHtml += "<td>"+iTotalNombre+"</td>";
			zHtml += "<td style='text-align:right'>"+iTotalIndemnistations.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td></tr>";

			if(iNombre!=0 && iTableauType[i]!='' && rMontant!=0){
				$(this).append(zHtml);
			}
		}
	});

	$(".parSecteurNoMantant").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var iBoucle = 0;
		var zNomNombre = $(this).attr("zNomNombre");
		var zSecteurValue = $(this).attr("zSecteurValue");

		var iNombreTotal = 0;
		var rMontantTotal = 0;

		$("."+zSecteurValue+":checked").each (function ()
		{
			var iType = $(this).html();

			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			

			var zContent = iType +"_"+ iNombre;
			iTableauContent.push(zContent);

			if(iNombre >0){
				iNombreTotal += eval(iNombre);
			}

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";
		
		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			

			if(iNombre!=0 && iTableauType[i]!=''){
				$(this).append(zHtml);
			}
		}

		if(iNombreTotal>0){

			var zHtmlTotal = "<tr style='color:#f100ff!important' class='setCalculAuto'>";
			zHtmlTotal += "<td><strong>Total</strong></td>";
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td></tr>";
			$(this).append(zHtmlTotal);
		}

		iNombreTotal = 0;
		rMontantTotal = 0;


	});

	$(".parRegionNoMantant").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var zNomNombre = $(this).attr("zNomNombre");
		var zSetRegValue = $(this).attr("zSetRegValue");

		var iBoucle = 0;
		var iNombreTotal = 0;
		var rMontantTotal = 0;

		$("."+zSetRegValue+":checked").each (function ()
		{
			var iType = $(this).html();
			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();

			var zContent = iType +"_"+ iNombre ;
			iTableauContent.push(zContent);

			if(iNombre >0){
				iNombreTotal += eval(iNombre);
			}

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";

		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var rMontant = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
				}
			}

			zHtml += "<td>"+iNombre+"</td>";
			zHtml += "</tr>";

			if(iNombre!=0 && iTableauType[i]!=''){
				$(this).append(zHtml);
			}
		}

		if(iNombreTotal>0){

			var zHtmlTotal = "<tr style='color:#f100ff!important' class='setCalculAuto'>";
			
			zHtmlTotal += "<td><strong>Total</strong></td>";
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td>";
			zHtmlTotal += "</tr>";
			$(this).append(zHtmlTotal);
		}
	});

	$(".parRegionPoste").each (function ()
	{
		var iTableauType = new Array();
		var iTableauContent = new Array();
		var iTableauFinal = new Array();

		var zNomNombre = $(this).attr("zNomNombre");
		var zNomMontant = $(this).attr("zNomMontant");
		var zNomMontantMoyen = $(this).attr("zNomMontantMoyen");
		var zNomNombreClient = $(this).attr("zNomNombreClient");
		var zSetRegValue = $(this).attr("zSetRegValue");

		var iBoucle = 0;
		var iNombreTotal = 0;
		var iNombreTotalClient = 0;
		var rMontantTotal = 0;
		var rMontantTotalMoyen = 0;

		$("."+zSetRegValue+":checked").each (function ()
		{
			var iType = $(this).html();
			var iNombre = $('input[name="'+zNomNombre+'[]"]').eq(iBoucle).val();
			var rMontant = $('input[name="'+zNomMontant+'[]"]').eq(iBoucle).val().replace(/ /g, '');
			var rMontantMoyen = $('input[name="'+zNomMontantMoyen+'[]"]').eq(iBoucle).val().replace(/ /g, '');
			var iNombreClient = 0;

			if(zNomNombreClient != undefined){
				iNombreClient = $('input[name="'+zNomNombreClient+'[]"]').eq(iBoucle).val().replace(/ /g, '');
				var zContent = iType +"_"+ iNombre + "_" + rMontant + "_" + rMontantMoyen + "_" + iNombreClient;

				if(iNombreClient >0){
					iNombreTotalClient += eval(iNombreClient);
				}


			} else {
				var zContent = iType +"_"+ iNombre + "_" + rMontant + "_" + rMontantMoyen;
			}


			
			iTableauContent.push(zContent);

			if(iNombre >0){
				iNombreTotal += eval(iNombre);
			}

			if(rMontant >0){
				rMontantTotal += eval(rMontant);
			}

			if(rMontantMoyen >0){
				rMontantTotalMoyen += eval(rMontantMoyen);
			}

			if(iTableauType.includes(iType)==false){
				iTableauType.push(iType);
			}

			++iBoucle;
		});

		var zHtml = "";

		for (i = 0; i < iTableauType.length; i++){

			var iNombre = 0;
			var iNombreClient = 0;
			var rMontant = 0;
			var rMontantMoyen = 0;
			zHtml = "<tr class='setCalculAuto'>";
			zHtml += "<td><strong> " + iTableauType[i] + "</strong></td>";
			for (j = 0; j < iTableauContent.length; j++){
				var toExplodeType = iTableauContent[j].split("_");

				if(iTableauType[i] == toExplodeType[0]){
					if(toExplodeType[1]!='' && toExplodeType[1] !=undefined){
						iNombre += eval(toExplodeType[1]);
					}
					if(toExplodeType[2]!='' && toExplodeType[2] !=undefined){
						rMontant += eval(toExplodeType[2]);
					}

					if(toExplodeType[3]!='' && toExplodeType[3] !=undefined){
						rMontantMoyen += eval(toExplodeType[3]);
					}

					if(toExplodeType[4]!='' && toExplodeType[4] !=undefined){
						iNombreClient += eval(toExplodeType[4]);
					}
				}
			}

			if(zNomNombreClient != undefined){
				zHtml += "<td style='text-align:right'>"+iNombreTotalClient+"</td>";
			}
			zHtml += "<td>"+iNombre+"</td>";
			
			zHtml += "<td style='text-align:right'>"+rMontant.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			zHtml += "<td style='text-align:right'>"+rMontantMoyen.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</td>";
			
			zHtml += "</tr>";

			if(iNombre!=0 && iTableauType[i]!=''){
				$(this).append(zHtml);
			}
		}

		if(iNombreTotal>0){

			var zHtmlTotal = "<tr style='color:#f100ff!important' class='setCalculAuto'>";
			
			zHtmlTotal += "<td><strong>Total</strong></td>";
			if(zNomNombreClient != undefined){
				zHtmlTotal += "<td style='text-align:right'>"+iNombreTotalClient+"</td>";
			}
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotalMoyen.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td></tr>";
			$(this).append(zHtmlTotal);
		}
	});
}