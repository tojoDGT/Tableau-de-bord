function show(_iBloc){
	$("#bloc-"+_iBloc).show();
}
function hideShow(){
	$(".blocHideShow").hide();
}
$(document).ready (function ()
{
	hideShow();
	show(1);
	$(".precedent").attr("disabled","disabled");

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

		if (iPrecedent<4)
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
		if (iSuivant==4)
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

	$( "input[name$='question_1_3_4']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_3_5").hide();
				$("#1_3_6").show();
				break;

			default:
				$("#1_3_5").show();
				$("#1_3_6").hide();
				break;
		}
	});

	$( "input[name$='question_1_3_9']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_3_10").show();
				break;

			default:
				$("#1_3_10").hide();
				break;
		}
	});

	$( "input[name$='question_1_3_11']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_3_12").show();
				break;

			default:
				$("#1_3_12").hide();
				break;
		}
	});

	$( "input[name$='question_1_3_13']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_3_14").show();
				break;

			default:
				$("#1_3_14").hide();
				break;
		}
	});

	$( "input[name$='question_1_3_15']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_3_16").show();
				break;

			default:
				$("#1_3_16").hide();
				break;
		}
	});

	$( "input[name$='question_1_4_2_2']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_4_2_3").hide();
				break;

			default:
				$("#1_4_2_3").show();
				break;
		}
	});

	$( "input[name$='question_1_4_3_2']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_4_3_3").hide();
				break;

			default:
				$("#1_4_3_3").show();
				break;
		}
	});

	$( "input[name$='question_1_4_4_2']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_4_4_3").hide();
				break;

			default:
				$("#1_4_4_3").show();
				break;
		}
	});

	$( "input[name$='question_1_4_5_2']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_4_5_3").hide();
				break;

			default:
				$("#1_4_5_3").show();
				break;
		}
	});

	$( "input[name$='question_1_4_6_2']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Oui":
				$("#1_4_6_3").hide();
				break;

			default:
				$("#1_4_6_3").show();
				break;
		}
	});


	$( "input[name$='question_1_4_33']" ).click(function(){
		
		var iValue = $( this ).attr("iTest");  
		switch (iValue) {
			case "1":
				$("#1_4_33_1").show();
				$("#1_4_33_2").hide();
				$("#1_4_33_3").hide();
				break;
			
			case "2":
				$("#1_4_33_2").show();
				$("#1_4_33_1").hide();
				$("#1_4_33_3").hide();
				break;

			case "3":
				$("#1_4_33_3").show();
				$("#1_4_33_1").hide();
				$("#1_4_33_2").hide();
				break;

		}
	});

	$( "input[name$='question_1_4_4']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Moyenne":
			case "Mediocre":
				$("#1_4_4_11").show();
				break;

			default:
				$("#1_4_4_11").hide();
				break;
		}
	});

	$( "input[name$='question_1_2_7']" ).click(function(){
		
		var iValue = $( this ).val();  
		switch (iValue) {
			case "Non":
				$("#1_2_7").show();
				break;

			default:
				$("#1_2_7").hide();
				break;
		}
	});

	$( "input[name$='question_1_4_1_1']" ).keyup(function() {
		var iValue = $( this ).val();  
		if (iValue==''){
			$("#mission_a").hide();
		} else {
			$("#mission_a").show();
		}
	});

	$( "input[name$='question_1_4_1_2']" ).keyup(function() {
		var iValue = $( this ).val();  
		if (iValue==''){
			$("#mission_b").hide();
		} else {
			$("#mission_b").show();
		}
	});

	$( "input[name$='question_1_4_1_3']" ).keyup(function() {
		var iValue = $( this ).val();  
		if (iValue==''){
			$("#mission_c").hide();
		} else {
			$("#mission_c").show();
		}
	});

	$( "input[name$='question_1_4_1_4']" ).keyup(function() {
		var iValue = $( this ).val();  
		if (iValue==''){
			$("#mission_d").hide();
		} else {
			$("#mission_d").show();
		}
	});

	$( "input[name$='question_1_4_1_5']" ).keyup(function() {
		var iValue = $( this ).val();  
		if (iValue==''){
			$("#mission_e").hide();
		} else {
			$("#mission_e").show();
		}
	});
})

function valider()
{
	var iRet = 1 ; 
	var zValue = '' ; 
	
	$(document).ready (function ()
	{
		$(".element-textarea1").attr("style","height:55px;");
		$(".obligatoire").each (function ()
		{
			$(this).parent().removeClass("error");
			if($(this).val()=="")
			{
				$(this).parent().addClass("error");


				if($(this).attr('name') == 'question_b_1'){
					$(".element-textarea2").attr("style","height:90px;");
				}

				if($(this).attr('name') == 'question_c_1'){
					$(".element-textarea3").attr("style","height:90px;");
				}

				//zValue += " - " +  + " - ";

				 iRet = 0 ;
			}
		}) ;

		if (iRet == 1)
		{	
			bootbox.confirm("Êtes-vous sûr de vouloir enregistrer ce formulaire?", function(result) {
				if (result) {
					$("#form-question").submit();
				}
			});
			//$("#form-question").submit();
		} else {
			//alert(zValue);
			bootbox.alert("Au moins un champ n'est pas rempli convenablement. Veuillez remplir. merci!");
		}

	})
}


function validerQuestionnaire()
{
	var iRet = 1 ; 
	var zValue = '' ; 
	
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
			//$("#form-question").submit();
			bootbox.confirm("Êtes-vous sûr de vouloir enregistrer ce formulaire?", function(result) {
				if (result) {
					$("#form-question").submit();
				}
			});
		} else {
			//alert(zValue);
			bootbox.alert("Au moins un champ n'est pas rempli convenablement. Veuillez remplir. merci!");
		}

	})
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