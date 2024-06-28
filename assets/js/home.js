$(document).ready(function() {
        var dejaVerifier = false;
        
		$('#commune_provinceId').on("change",changeProvince);
		$('#commune_regionId').on("change",changeRegion);
})


function changeProvince(){
    var iValue = $('#commune_provinceId').val();
    $.ajax({
              url: $("#zBasePath").val() + "commune/region/"+iValue,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#commune_regionId').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="">Sélectionner</option> ';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['region_id']+'">'+module['region_libelle']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	   
                   $('#commune_regionId').html(select_option);
                   
                   $('#commune_districtId').html('');
                   $('#commune_districtId').html('<option value="">Sélectionner</option> ');
             },
             async: false
     });
 }

 function changeRegion(){
    var iValue = $('#commune_regionId').val();
    $.ajax({
             url: $("#zBasePath").val() + "commune/district/"+iValue,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#commune_districtId').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="">Sélectionner</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['district_id']+'">'+module['district_libelle']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	  /* select_option += '<option value="0">AUTRES</option>';*/
                   $('#commune_districtId').html(select_option);
             },
             async: false
     });
 }

 function valider(){
	var iRet = 1 ; 
	var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
	var okRegex = new RegExp("(?=.{6,}).*", "g");

	$(".addInterlocuteur").each (function ()
	{
		$('input[name="contact_password2[]"]').eq(iBoucle).parent().removeClass("error");
		$('input[name="contact_confpass2[]"]').eq(iBoucle).parent().removeClass("error");
	})


	$(".obligatoire").each (function ()
	{
		$(this).parent().removeClass("error");
		if($(this).val()=="")
		{
			$(this).parent().addClass("error");
			 iRet = 0 ;
		}
	}) ; 

	var newPass = $("#entite_newPassword").val();
	var zConfirmPass = $("#entite_confpass").val();

	$("#entite_confpass").parent().removeClass("error");
	if(newPass!=zConfirmPass){
		$("#entite_confpass").parent().addClass("error");
		iRet = 0 ;
	}

	$(".email").each (function ()
	{
		email = $(this).val();
		if($(this).val()!=""){
			$(this).parent().removeClass("error1");
			if(!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
			{
				$(this).parent().addClass("error1");
				iRet = 0 ;
			} 
		}
	}) ;

	$(".isUrl").each (function ()
	{
		zUrl = $(this).val();
		if($(this).val()!="" && $(this).val()!="http://"){
			$(this).parent().removeClass("error1");
			if(!zUrl.match(/^http(s)?:\/\/(www\.)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/))
			{
				$(this).parent().addClass("error1");
				iRet = 0 ;
			} 
		}
	}) ;

	var iBoucle=0;
	$(".addInterlocuteur").each (function ()
	{
		var zLastPass = $('input[name="iLast[]"]').eq(iBoucle).val();
		var pass = $('input[name="contact_password2[]"]').eq(iBoucle).val();
		var zConfirmPass = $('input[name="contact_confpass2[]"]').eq(iBoucle).val();
		$('input[name="contact_confpass2[]"]').eq(iBoucle).parent().removeClass("error");

		if(zLastPass!= pass){
			if(pass !=""){
				if (okRegex.test(pass) === false) {
					   $('input[name="contact_password2[]"]').eq(iBoucle).next("p").html('Le mot de passe doit comporter 6 caractères.');
					   $('input[name="contact_password2[]"]').eq(iBoucle).parent().addClass("error");;
					   iRet = 0 ;
				}  else {
					if (strongRegex.test(pass) === false) {
						
						$('input[name="contact_password2[]"]').eq(iBoucle).next("p").html('Le mot de passe doit contenir des majuscules, des chiffres,des minuscules et de caractères spéciaux');
						$('input[name="contact_password2[]"]').eq(iBoucle).parent().addClass("error");
						iRet = 0 ;
					} 
				}
			}
			
			if(pass!=zConfirmPass){
				$('input[name="contact_confpass2[]"]').eq(iBoucle).parent().addClass("error");
				iRet = 0 ;
			}
		}

		++iBoucle;
	})

	if (iRet == 0){	
		return false;
	} else {
		return true;
	}
}

 jQuery(document).ready(function() {
			 
  jQuery( ".withDatePicker" ).datepicker({
		dateFormat: "dd/mm/yy",
		changeMonth: true,
		numberOfMonths: 1,
		changeYear: true,
  });

  jQuery( ".withDate" ).datepicker({
	    minDate: new Date(1980, 00, 01),
		maxDate: new Date(2049, 11, 31),
		dateFormat: "yy",
		changeMonth: true,
		numberOfMonths: 1,
		changeYear: true,
  });

  jQuery('input').attr("autocomplete","off");

});

$(document).ready(function() {
	showPreview();
});

function showPreview(){
	$('#formulaireEdit').find('input.jfilestyle').on('change', function (e) {
		var files = $(this)[0].files; 
		if (files.length> 0) {
			$(this).siblings('p.zImgVignette').children().removeAttr('src');
			$('.zImgVignette').show();
			var file = files[0],
			$image_preview = $(this).siblings('p.zImgVignette');
			$image_preview.show();
			$(this).siblings('p.zImgVignette').children().show();
			$(this).siblings('p.zImgVignette').children().attr('src', window.URL.createObjectURL(file));
		}
	});
}
