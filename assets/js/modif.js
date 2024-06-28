$(document).ready (function ()
{

	$(".prix").numeric({ decimal : ".",  negative : false, scale: 2 });
	$(".entier").numeric({ decimal : false,  negative : false });

	$('.prix').on("click change",function(){
		var value = $(this).val();
 
		var formattedValue = value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ')
		$(this).val(formattedValue);
	});


});


	