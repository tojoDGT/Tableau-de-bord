// Document ready
$(
    function () {

        // Datepicker
        //$( ".withDatePicker" ).datepicker();

		/*jQuery('.retractLeftCont').on('click', function() {
			jQuery(this).toggleClass('turn');
			jQuery(this).parents('#leftContent').toggleClass('visible');
		});*/

		/*jQuery('#mainHeaderMenu').find('nav').find('ul').find('> li').hover(
			function (){
				jQuery(this).addClass('showMenu');
			},
			function () {
				jQuery(this).removeClass('showMenu');
			}
		);

		jQuery('.formationMenuNav').find('nav').find('ul').find('> li').hover(
			function (){ 
				jQuery(this).addClass('showMenu');
			},
			function () {
				jQuery(this).removeClass('showMenu');
			}
		);*/
	
	/*........................................................................ Start Modified by GARINA ................................................................	
		jQuery('.liParent').hover(
			function (){
				jQuery(this).closest('li').addClass('showMenu');
			},
			function () {
				jQuery(this).closest('li').removeClass('showMenu');
			}
		);

		jQuery('.liParent').hover(
			function (){ 
				jQuery(this).closest('li').addClass('showMenu');
			},
			function () {
				jQuery(this).closest('li').removeClass('showMenu');
			}
		);
	/*........................................................................ End Modified by GARINA ................................................................*/

		var iTypeGcapId = $("#iTypeGcapId").val();
		var iSessionCompte = $("#iSessionCompte").val();

		var zDateToDay =  $("#zDateToDay").val();

		if (zDateToDay != undefined) {

			if (iTypeGcapId == 5 && iSessionCompte == 2){
				$( ".withDatePicker" ).datepicker({
					dateFormat: "dd/mm/yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
					onClose: function( selectedDate, inst ) {
						 var maxDate = new Date(Date.parse(selectedDate));
						 maxDate.setDate(maxDate.getDate() - 1);            
					}
				});
			} else {

				var ToDate = zDateToDay.split("-");
				var _iAnnee = ToDate[0];
				var _iMois = ToDate[1];
				var _iJour = ToDate[2];

				$( "#date_debut" ).datepicker({
					minDate: new Date(_iAnnee, _iMois - 1, _iJour),
					dateFormat: "dd/mm/yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
				});

				//$( "#date_debut" ).datepicker( "setDate", _iJour + "/"+  _iMois + "/"+ _iAnnee);

				$( "#date_fin" ).datepicker({
					minDate: new Date(_iAnnee, _iMois - 1, _iJour),
					dateFormat: "dd/mm/yy",
					changeMonth: true,
					numberOfMonths: 1,
					changeYear: true,
				});
			}
		} else {
			$( ".withDatePicker" ).datepicker({
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				numberOfMonths: 1,
				changeYear: true,
				onClose: function( selectedDate, inst ) {
					 var maxDate = new Date(Date.parse(selectedDate));
					 maxDate.setDate(maxDate.getDate() - 1);            
				}
			});
		}

		//$( "#date_fin" ).datepicker( "setDate", _iJour + "/"+  _iMois + "/"+ _iAnnee);

		// si Autorisation abscence = début jamais antérieure à la date en cours
		/*if (iTypeGcapId == 3)
		{
			var zDateToDay =  $("#zDateToDay").val();
			var ToDate = zDateToDay.split("-");
			var _iAnnee = ToDate[0];
			var _iMois = ToDate[1];
			var _iJour = ToDate[2];

			$( "#date_debut" ).datepicker({
				minDate: new Date(_iAnnee, _iMois - 1, _iJour),
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				numberOfMonths: 1,
				changeYear: true,
			});

			$( "#date_debut" ).datepicker( "setDate", _iJour + "/"+  _iMois + "/"+ _iAnnee);

			$( "#date_fin" ).datepicker({
				minDate: new Date(_iAnnee, _iMois - 1, _iJour),
				maxDate: new Date(_iAnnee, 12 - 1, 31),
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				numberOfMonths: 1,
				changeYear: true,
			});

			$( "#date_fin" ).datepicker( "setDate", _iJour + "/"+  _iMois + "/"+ _iAnnee);

		}
		else
		{
			$( ".withDatePicker" ).datepicker({
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				numberOfMonths: 1,
				changeYear: true,
				onClose: function( selectedDate, inst ) {
					 var maxDate = new Date(Date.parse(selectedDate));
					 maxDate.setDate(maxDate.getDate() - 1);            
				}
			});
		}*/

        // Event handler sur les boutons du popup de notification
        $('.notification').find('.button').find('a').click(
            function () {
                $('.notification').removeClass('visible');
                return false;
            }
        );


        // Notification
        /* @todo: A SUPPRIMER
         * ceci est un code temporaire pour le test d'affichage des notifications dans les maquettes html
         */
        $('.notification').addClass('visible');
        
    }
);



