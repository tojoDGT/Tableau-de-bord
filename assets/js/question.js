function show(_iBloc){
	$("#bloc-"+_iBloc).show();
}

function hideShow(){
	$(".blocHideShow").hide();
}

function __getTotal(){
}

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

			zHtml += "<td>"+iNombre+"</td></tr>";
			

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
			if(iNombreTotalClient>0){
				zHtmlTotal += "<td style='text-align:right'>"+iNombreTotalClient+"</td>";
			}
			zHtmlTotal += "<td><strong>"+iNombreTotal+"</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td>";
			zHtmlTotal += "<td style='text-align:right'><strong>"+rMontantTotalMoyen.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')+" Ar</strong></td></tr>";
			$(this).append(zHtmlTotal);
		}
	});


}

function deleteCredit(index){
	   $("#creditTr_" +index).fadeOut('slow',function(){$(this).html('');});
}

function deleteEpargne(index){
	   $("#EpargneTr_" +index).fadeOut('slow',function(){$(this).html('');});
}

function deleteLigneZone(index){
	   $("#LigneZoneTr_" +index).fadeOut('slow',function(){$(this).html('');getTotal();});

}

function deleteLigneSocietariat(index, iNb){
   $("#LigneSocietariatTr_" +index).fadeOut('slow',function(){
		$(this).html('');
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
  });
}

function deleteLigneAct1(index){
	   $("#LigneAct1Tr_" +index).fadeOut('slow',function(){$(this).html('');getTotal();});
	   
}

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

$(document).ready (function ()
{
	getTotal();
	hideShow();
	show(1);
	$(".prix").numeric({ decimal : ".",  negative : false, scale: 2 });
	$(".entier").numeric({ decimal : false,  negative : false });

	$('.prix').on("click change",function(){
		var value = $(this).val();
 
		var formattedValue = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')
		$(this).val(formattedValue);
	});

	$('.automatique').on("click change",function(){
		getTotal();
	});

	$(".SubmitValider").hide();
	//$(".SubmitValider").show();

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

	$(".spoSNonFnc1").click(function() {
		var iValue = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:
				$("#snf-bloc-" + iValue).show();
				break;

			case false:
				$("#snf-bloc-" + iValue).hide();
				break;
		}
	});

	$(".typeMarquant").click(function() {
		var iValue = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:
				$("#marquant-" + iValue).show();
				break;

			case false:
				$("#marquant-" + iValue).hide();
				break;
		}
	});

	$(".spoSfm1").click(function() {
		var iValue = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:

				$(".financierType").each (function ()
				{
					if($(this).val()==iValue){
						$(this).show();
					}
				})
				
				break;

			case false:
				$(".financierType").each (function ()
				{
					if($(this).val()==iValue){
						$(this).hide();
					}
					
				})
				break;
		}
	});

	$(".calculZone").change(function() {
		var iTotal = 0
		$(".calculZone").each (function ()
		{
			iTotal += eval($(this).val()); 
		}) ;

		$("#totalZone").html(iTotal);
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


	


	$(".precedent").attr("disabled","disabled");
	$('#ligneCredit').on("click",ligneCredit);
	$('#ligneEpargne').on("click",ligneEpargne);
	$('#ligneZone').on("click",ligneZone);
	var zBasePath = $('#zBasePath').val();

	function ligneCredit(){
		var iNbrCredit = $('#nbrCredit').val();
		iIndexNew = eval(iNbrCredit)+1;
		$('#nbrCredit').val(iIndexNew);
		getAjax('tableLigneCredit',iIndexNew,1,'getTemplate');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	}

	function ligneZone(){
		var nbrZone = $('#nbrZone').val();
		iIndexNew = eval(nbrZone)+1;
		$('#nbrZone').val(iIndexNew);
		getAjax('tableLigneZone',iIndexNew,3,'getTemplate');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	}

	$('.AddLigneSFinancier').on("click",function(){
		
		var iCible = $(this).attr("incrementCible");  
		var zTable = $(this).attr("tableCible");  
		var iType = $(this).attr("iTypeCible");  

		var iNbr = $('#' + iCible).val();
		iIndexNew = eval(iNbr)+1;
		$('#' + iCible).val(iIndexNew);
		getAjaxSFinancier(zTable,iIndexNew,iType,'getTemplate');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	});  

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
			$.getScript( zBasePath + "assets/js/loading.js" )
		});
	}

	function getAjaxSFinancier(_zCible,_iIndexNew,_iType,_zTemplate){

		var iTypeSfinancier = new Array();

		$(".spoSfm1").each (function ()
		{
			
			var iValue = $(this).val();
			var isChecked = $(this).is(':checked');  

			switch (isChecked) {
				case true:
					iTypeSfinancier.push(iValue);
					break;

				case false:
					break;
			}
			
		}) ;

		
		$("#beforeSend11").show();
		$.ajax({
			url: zBasePath + "produit/"+_zTemplate+"/",
			type: 'post',
			data: {
				iIndexNew : _iIndexNew,
				iType	  : _iType,
				iTypeSfinancier : iTypeSfinancier,
				zHashUrl  : $("#zHashUrl").val()
			},
			success: function(data, textStatus, jqXHR) {

				var zRow = $(data);
				zRow.hide();
				$('#'+_zCible).append(zRow);
				zRow.fadeIn(1000);
				
				event.preventDefault()
				$("#beforeSend11").hide();
			},
			async: false
		}).done(function() {
			$.getScript( zBasePath + "assets/js/loading.js" )
		});
	}

	$('.setTypeImf').on("change",function(){
		
		var iEntiteId = $(this).val();
		
		$.ajax({
			url: zBasePath + "produit/setTypeImf",
			type: 'post',
			data: {
				iEntiteId : iEntiteId
			},
			success: function(data, textStatus, jqXHR) {

				if(data==1){
					$("#checkBoxEpargne").attr("disabled","disabled");
					$("#spanCheck").html('<p style="color:red;display: inline;">(IMF de crédit)</p>');
				} else {
					$("#checkBoxEpargne").removeAttr("disabled");
					$("#spanCheck").html('');
				}
			},
			async: true
		})
	});

	$('.AddLigneAssurance').on("click",function(){
		
		var iCible = $(this).attr("incrementCible");  
		var zTable = $(this).attr("tableCible");  
		var iType = $(this).attr("iTypeCible");  

		var iNbr = $('#' + iCible).val();
		iIndexNew = eval(iNbr)+1;
		$('#' + iCible).val(iIndexNew);
		getAjax(zTable,iIndexNew,iType,'getTemplateAssurance');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	});

	$('.AddLignePoste').on("click",function(){
		
		var iCible = $(this).attr("incrementCible");  
		var zTable = $(this).attr("tableCible");  
		var iType = $(this).attr("iTypeCible");  
		//var iType = $('input[name=iTypePosteId]:checked').val();

		var iNbr = $('#' + iCible).val();
		iIndexNew = eval(iNbr)+1;
		$('#' + iCible).val(iIndexNew);
		getAjax(zTable,iIndexNew,iType,'getTemplatePoste');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	});

	$('.AddLigneActivite').on("click",function(){
		
		var iCible = $(this).attr("incrementCible");  
		var zTable = $(this).attr("tableCible");  
		var iType = $(this).attr("iTypeCible");  
		//var iType = $('input[name=iTypePosteActiviteId]:checked').val();

		var iNbr = $('#' + iCible).val();
		iIndexNew = eval(iNbr)+1;
		$('#' + iCible).val(iIndexNew);
		getAjax(zTable,iIndexNew,iType,'getTemplateActivite');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	});
	
	$(".poAssuranceRadio").click(function() {
	
		var iTypeAssuranceId = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:
				$.ajax({
					url: zBasePath + "produit/getBlocSwitch/",
					type: 'post',
					data: {
						iType		: iTypeAssuranceId,
						iProduitId	: $("#iProduitId").val()
					},
					success: function(data, textStatus, jqXHR) {

						var oReturn = jQuery.parseJSON(data);

						var zRow = $(oReturn.zSelect);
						//zRow.hide();
						$('#zBlocSwitch-' + iTypeAssuranceId).html(zRow);
						$('#poAssurance-' + iTypeAssuranceId).show();
						zRow.fadeIn(1000);
						$('#nbrPoAssurance' + iTypeAssuranceId).html(oReturn.iNombre);
						$('#titlePoAssurance-' + iTypeAssuranceId).html(oReturn.zLibelle);
						
						event.preventDefault();
						
					},
					async: true
				})
				break;

			case false:
				$('#zBlocSwitch-' + iTypeAssuranceId).html('');
				$('#poAssurance-' + iTypeAssuranceId).hide();
				break;
		}
		
		
	}); 

	$(".poPosteRadioActivite").click(function() {
	
		var iTypePosteId = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:
				$.ajax({
					url: zBasePath + "produit/getBlocSwitchActivite/",
					type: 'post',
					data: {
						iType		: iTypePosteId,
						iProduitId	: $("#iProduitId").val()
					},
					success: function(data, textStatus, jqXHR) {

						var oReturn = jQuery.parseJSON(data);

						var zRow = $(oReturn.zSelect);
						//zRow.hide();
						$('#zBlocSwitchActivite-' + iTypePosteId).html(zRow);
						$('#PoActivite-' + iTypePosteId).show();
						zRow.fadeIn(1000);
						$('#nbrPoActivite' + iTypePosteId).html(oReturn.iNombre);
						$('#titlePoActivite-' + iTypePosteId).html(oReturn.zLibelle);
						
						event.preventDefault();
						
					},
					async: true
				})
				break;

			case false:
				$('#zBlocSwitchActivite-' + iTypePosteId).html('');
				$('#PoActivite-' + iTypePosteId).hide();
				break;
		}
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
		
	});


	$(".poPosteRadio").click(function() {
	
		var iTypePosteId = $(this).val();

		var isChecked = $(this).is(':checked');  

		switch (isChecked) {
			case true:
				$("#iTypePosteActiviteId_"+iTypePosteId).show();
				$("#PoActivite-"+iTypePosteId).show();
			
				$.ajax({
					url: zBasePath + "produit/getBlocSwitchPoste/",
					type: 'post',
					data: {
						iType		: iTypePosteId,
						iProduitId	: $("#iProduitId").val()
					},
					success: function(data, textStatus, jqXHR) {

						var oReturn = jQuery.parseJSON(data);

						var zRow = $(oReturn.zSelect);
						//zRow.hide();
						$('#zBlocSwitchPoste-' + iTypePosteId).html(zRow);
						$('#poPoste-' + iTypePosteId).show();
						zRow.fadeIn(1000);
						$('#nbrPoPoste' + iTypePosteId).html(oReturn.iNombre);
						$('#titlePoPoste-' + iTypePosteId).html(oReturn.zLibelle);
						
						event.preventDefault();
						
					},
					async: true
				})
				break;

			case false:
				$("#iTypePosteActiviteId_"+iTypePosteId).hide();
				$("#PoActivite-"+iTypePosteId).hide();
				$('#zBlocSwitchPoste-' + iTypePosteId).html('');
				$('#poPoste-' + iTypePosteId).hide();
				break;
		}
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
		
	});

	/*$('input[name=iTypePosteId]').on("change",function(){
		
		var iTypePosteId = $('input[name=iTypePosteId]:checked').val();
		
		$.ajax({
			url: zBasePath + "produit/getBlocSwitchPoste/",
			type: 'post',
			data: {
				iType		: iTypePosteId,
				iProduitId	: $("#iProduitId").val()
			},
			success: function(data, textStatus, jqXHR) {

				var oReturn = jQuery.parseJSON(data);

				var zRow = $(oReturn.zSelect);
				zRow.hide();
				$('#poPoste').html(zRow);
				zRow.fadeIn(1000);
				$('#nbrPoPoste').html(oReturn.iNombre);
				$('#titlePoPoste').html(oReturn.zLibelle);
				
				event.preventDefault();
				
			},
			async: true
		})
	});*/

	/*$('input[name=iTypePosteActiviteId]').on("change",function(){
		
		var iTypePosteId = $('input[name=iTypePosteActiviteId]:checked').val();
		
		$.ajax({
			url: zBasePath + "produit/getBlocSwitchActivite/",
			type: 'post',
			data: {
				iType		: iTypePosteId,
				iProduitId	: $("#iProduitId").val()
			},
			success: function(data, textStatus, jqXHR) {

				var oReturn = jQuery.parseJSON(data);

				var zRow = $(oReturn.zSelect);
				zRow.hide();
				$('#poActivite').html(zRow);
				zRow.fadeIn(1000);
				$('#nbrPoActivite').html(oReturn.iNombre);
				$('#titlePoActivite').html(oReturn.zLibelle);
				$('html, body').animate({
				scrollTop: $(this).offset().top
				}, 1500);
				//event.preventDefault();
				
			},
			async: true
		})
	});*/

	$('.statutService').on("change",function(){
		var iTypeStatutServiceId = $(this).val();

		switch (iTypeStatutServiceId){

			case '1':
				$("#ouverture").show();
				$("#fermeture").hide();
				break;

			case '2':
				$("#ouverture").hide();
				$("#fermeture").show();
				break;
		}
		
		
	});

	function __getAjax(_zCible,_iIndexNew,_iType,_zTemplate){
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
				$('#'+_zCible).append(zRow);
				zRow.fadeIn(1000);
				
				event.preventDefault()
				$("#beforeSend11").hide();
			},
			async: true
		}).done(function() {
			$.getScript( zBasePath + "assets/js/loading.js" )
		});
	}

	function getRowTableCredit(index){

		var zHtmlCredit = $(".creditPrincipal").html();
		zRet = "<tr id='creditTr_"+index+"'>" + zHtmlCredit ; 
		zRet	   += '<td class="importantTd"><button style="cursonr:pointer" class="btn_close" type="button" onclick="deleteCredit('+index+')"><img style="cursonr:pointer" width="20" src="'+zBasePath+'/assets/iles/del.png"></button></td></tr>';
		return zRet;
	}

	function ligneEpargne(){
		var nbrEpargne = $('#nbrEpargne').val();
		iIndexNew = eval(nbrEpargne)+1;
		$('#nbrEpargne').val(iIndexNew);
		//$('#tableLigneEpargne').append(getRowTableEpargne(iIndexNew));
		getAjax('tableLigneEpargne',iIndexNew,2,'getTemplate');
		$('html, body').animate({
			scrollTop: $(this).offset().top
		}, 1500);
	}

	function getRowTableEpargne(index){
		var zHtmlEpargne = $(".EpargnePrincipal").html();
		zRet  = "<tr id='EpargneTr_"+index+"'>" + zHtmlEpargne ; 
		zRet += '<td class="importantTd"><button style="cursonr:pointer" class="btn_close" type="button" onclick="deleteEpargne('+index+')"><img style="cursonr:pointer" width="20" src="'+zBasePath+'/assets/iles/del.png"></button></td></tr>';
		return zRet;
	}

	$(".partiel").click(function() {
		var iRet = 1 ; 

		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
		}) ;


		$(".obligatoirePartielle").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				 $(this).parent().addClass("error");
				 iRet = 0 ;
				 //alert($(this).attr("name"));
			}
		}) ;

		if (iRet == 1){	
			$("#question_partiel").val(2);
			if (confirm($("#zMessageValidation").val())){
				var $form = $("#form-question");
				var formdata = (window.FormData) ? new FormData($form[0]) : null;
				var data = (formdata !== null) ? formdata : $form.serialize();
				$.ajax({
					url: $form.attr('action'),
					type: $form.attr('method'),
					contentType: false, // obligatoire pour de l'upload
					processData: false, // obligatoire pour de l'upload
					data: data,
					success: function (response) {
						$("#question_partiel").val(4);
						bootbox.alert("Enregistrement partiel effectué avec succès. Merci!");
					}
				});
			}
		}
	});


	$(".precedent").click(function() {
		var iPagination = $("#iPagination").val();
		var iPrecedent = iPagination - 1;
		$("#iPagination").val(iPrecedent);
		hideShow();
		show(iPrecedent);

		$(".precedent").removeAttr("disabled")
		if (iPrecedent==1)
		{
			$(".precedent").attr("disabled","disabled");
		} 

		if (iPrecedent<5)
		{
			$(".suivant").removeAttr("disabled")
			$(".suivant").show();
			$(".SubmitValider").hide();
		} 
	});

	$(".suivant").click(function() {
		var iPagination = $("#iPagination").val();
		var iSuivant = eval(iPagination) + 1;
		$("#iPagination").val(iSuivant);
		hideShow();
		show(iSuivant);
		$(".suivant").removeAttr("disabled")
		if (iSuivant==5)
		{
			$(".suivant").attr("disabled","disabled");
			$(".suivant").hide();
			$(".SubmitValider").show();
		}
		if (iSuivant>1)
		{
			$(".precedent").removeAttr("disabled")
		}
	});
})

function validerQuestionnaire()
{
		var iRet = 1 ; 
		var iBoucle = 0 ;
		var zValue = '' ; 
		var iTotal = 0;
		var zMessageOther = "";

		$( 'input[name="porteFeuille_totalEncoursCredit[]"]' ).each (function () {
			var iTotalSainEnRetard = $('input[name="porteFeuille_totalEncoursCredit[]"]').eq(iBoucle).val().replace(/ /g, '');
			var iCreditSain = $('input[name="porteFeuille_encoursCreditSain[]"]').eq(iBoucle).val().replace(/ /g, '');
			var iEnRetard = $('input[name="porteFeuille_encoursCreditEnRetard[]"]').eq(iBoucle).val().replace(/ /g, '');
			

			if(iTotalSainEnRetard != '' && iCreditSain!='' && iEnRetard!=''){
				var iTotal = eval(iCreditSain) + eval(iEnRetard);
				if(iTotal != iTotalSainEnRetard){
					zMessageOther += "\nErreur sur la Qualité de porte feuille : " + iTotalSainEnRetard + " != " + iCreditSain + " + " +  iEnRetard;
					iRet = 0 ; 
				}
			}
			++iBoucle;
		});

	
		$(".spoAll").removeClass("obligatoire");

		$(".radioSpo").each (function ()
		{
			$(this).parent().removeClass("error");
			
			var iValue = $(this).val();
			var isChecked = $(this).is(':checked');  

			switch (isChecked) {
				case true:
					$(".spo-" + iValue).addClass("obligatoire");
					if(iValue>1){
						//$("#epargne-type-"+iValue).addClass("obligatoire");
					}
					break;

				case false:
					$(".spo-" + iValue).removeClass("obligatoire");
					if(iValue>1){
						//$("#epargne-type-"+iValue).removeClass("obligatoire");
					}
					break;
			}
			
		}) ;

		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				 $(this).parent().addClass("error");
				 iRet = 0 ;
				 //alert($(this).attr("name"));
			}
		}) ;

		if (iRet == 1){	
			$("#form-question").submit();
		} else {
			var zMsg = "Veuillez remplir les champs obligatoire";

			if(zMessageOther !=''){
				zMsg += zMessageOther;
			}
			alert(zMsg);
		}


}


 function changeDistrictRegion(_iValue, iCible){
    var iValue = _iValue;
    $.ajax({
             url: $("#zBasePath").val() + "commune/district/"+iValue,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#zone_districtId'+iCible).html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="">Sélectionner</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['district_id']+'">'+module['district_libelle']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	  /* select_option += '<option value="0">AUTRES</option>';*/
                   $('#'+iCible).html(select_option);
             },
             async: false
     });
 }

 function changeCommuneDistrict(_iValue, iCible){
    var iValue = _iValue;
    $.ajax({
             url: $("#zBasePath").val() + "commune/commune/"+iValue,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#zone_communeId'+iCible).html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="">Sélectionner</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['commune_id']+'">'+module['commune_commune']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	  /* select_option += '<option value="0">AUTRES</option>';*/
                   $('#'+iCible).html(select_option);
             },
             async: false
     });
 }

var ichecked = '';
function addMoreRows(_iVar, frm) {

	var iRowCount = $("#iIncrement_" + _iVar).val();
	$(document).ready (function ()
	{
		iRowCount ++;
		$('#iRow').val(iRowCount);
		if (iRowCount==1){
			ichecked='checked="checked"';
		} else {
			ichecked='';
		}

		var iVar = "'"+_iVar+"'";
		$("#iIncrement_" + _iVar).val(iRowCount);

		switch (_iVar)
		{
			case 'e':
				var recRow = '<tr id="rowCount_'+_iVar+'_'+iRowCount+'"><td class="column7"><div class="item-cont"><textarea class="medium" name="question_e_1_'+iRowCount+'" id="question_e_1_'+iRowCount+'" cols="10" rows="3" placeholder=""></textarea><span class="icon-place"><span class="icon-place"></span><p class="message">Veuillez remplir ce champ</p></div></td><td class="column7"><div class="item-cont"><textarea class="medium" name="question_e_2_'+iRowCount+'" id="question_e_2_'+iRowCount+'" cols="10" rows="3" placeholder=""></textarea><span class="icon-place"><span class="icon-place"></span></div></td><td style="border:none" class="column">&nbsp;&nbsp;<a href="#" onclick="addMoreRows('+iVar+',this.form);" ><i style="color:#69a26a;font-size:30px" class="fa fa-plus-square"></i></a>&nbsp;&nbsp;<a href="#" onclick="removeRow('+iVar+','+iRowCount+');" ><i style="color: #F10610;font-size:22px" class="fa fa-close"></i></a></td></tr>';
				$('#addedRows_'+_iVar).append(recRow);
				$('html, body').stop().animate({scrollTop: $('#rowCount_'+_iVar+'_'+iRowCount).offset().top}, 1000 );
				break;

			default :
				var recRow = '<div id="rowCount_'+_iVar+'_'+iRowCount+'" class="element-textarea"><label class="title"><strong></strong></label><div class="item-cont"><input style="width:93%" class="large" type="text"  name="question_'+_iVar+'_'+iRowCount+'" id="question_'+_iVar+'_'+iRowCount+'" placeholder=""/>&nbsp;&nbsp;<a href="#" onclick="addMoreRows('+iVar+',this.form);" ><i style="color:#69a26a;font-size:30px" class="fa fa-plus-square"></i></a>&nbsp;&nbsp;<a href="#" onclick="removeRow('+iVar+','+iRowCount+');" ><i style="color: #F10610;font-size:22px" class="fa fa-close"></i></a></span><br><br></div></div>';
				$('#addedRows_'+_iVar).append(recRow);
				
			break;
		
		}

		
		
		//$.getScript( "{/literal}{$zBasePath}{literal}assets/common/js/app/main.js");
	})
}

function removeRow(_iVar, removeNum) {
	$('#rowCount_'+_iVar+'_'+removeNum).remove();
}