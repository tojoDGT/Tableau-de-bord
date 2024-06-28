
$(document).ready (function ()
{
	$(".searchTransverse, input[name='iTypeProduitId']").click(function() {

			$("#getStat").html("");
			$("#getStat").html('<div style=";min-height: 500px;text-align: center;vertical-align: middle;padding-top: 150px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="150">');
			
			var $form = $("#transverseForm");
			var formdata = (window.FormData) ? new FormData($form[0]) : null;
			var data = (formdata !== null) ? formdata : $form.serialize();
			$.ajax({
				url: $form.attr('action'),
				type: $form.attr('method'),
				contentType: false, // obligatoire pour de l'upload
				processData: false, // obligatoire pour de l'upload
				data: data,
				success: function (zReturn, textStatus, jqXHR) {
					$("#getStat").html(zReturn);
				}
			});
	});

	$(".searchTb").click(function() {

			$(".stattPlace").html("");
			$(".stattPlace").html('<div style=";min-height: 500px;text-align: center;vertical-align: middle;padding-top: 150px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="150">');
			
			var $form = $("#getTbStat");
			var formdata = (window.FormData) ? new FormData($form[0]) : null;
			var data = (formdata !== null) ? formdata : $form.serialize();
			$.ajax({
				url: $form.attr('action'),
				type: $form.attr('method'),
				contentType: false, // obligatoire pour de l'upload
				processData: false, // obligatoire pour de l'upload
				data: data,
				success: function (zReturn, textStatus, jqXHR) {
					$("#geResult").html(zReturn);
				}
			});
	});
});