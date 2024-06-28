//var Formation
const INDEX_MIN = 200;
var indexDiplome,indexParcours,indexAttrib,indexTache,indexPost,indexProduit,indexAcad,indexProf,
indexFaire ,indexEtre ,indexRequi, indexActivite = INDEX_MIN;

$(document).ready(function() {
        var dejaVerifier = false;
        
        $('#prenom').on("focus",function(){
           
        });
		
        $('#pays').on("change",changePays);
        $('#province').on("change",changeProvince);
        $('#region').on("change",changeRegion);
        
        $('#departement').on("change",changeDepartement);
        $('#direction').on("change",changeDirection);
        $('#district').on("change",changeDistrict);
        $('#service').on("change",changeService);
        $('#service').on("change",changeSoa);
        
        $('#division').on("change",changeDivision);
		
		$('#corps').on("change",changeCorps);
		$('#grade').on("change",changeGrade);
		$('#indice').on("change",changeIndice);

		$('.retractLeftCont').on('click', function() {
            $(this).toggleClass('turn');
            $(this).parents('#leftContent').toggleClass('visible');
        });
		
	/*........................................................................ Start Modified by GARINA ................................................................
		/*$('#mainHeaderMenu').find('nav').find('ul').find('> li').hover(
			function (){
				jQuery(this).addClass('showMenu');
			},
			function () {
				jQuery(this).removeClass('showMenu');
			}
		);*/
	/*........................................................................ End Modified by GARINA ................................................................*/
	
		function toggleBloc() {

			$(".blocToggle").eq(0).addClass("show");
			$(".blocToggle").eq(1).addClass("show");
			$(".blocToggle").eq(2).addClass("show");
			$(".blocToggle").eq(3).addClass("show");
			$(".blocToggle").eq(4).addClass("show");
			$(".blocToggle.show .child").show();

			/*$(".blocToggle").eq(0).addClass("show");
			$(".blocToggle.show .child").show();

			$(".blocPartenaire .blocToggle").eq(0).removeClass("show");
			$(".blocPartenaire .blocToggle .child").hide();
			
			$(".toggleBloc").each(function () {
				$(this).click(function () {
					$(this).siblings(".child").slideToggle();
					$(this).parent().toggleClass("show");
				})
			})*/
		}
        
		function changeCorps(){
            var valeur = $('#corps').val();
            if(valeur=='0'){
               $('#autre_corps').show(); 
               $('#autre_corps').focus();
            }
            else{
                 $('#autre_corps').hide(); 
            }
        }
		function changeGrade(){
            var valeur = $('#grade').val();
            if(valeur=='0'){
               $('#autre_grade').show(); 
               $('#autre_grade').focus();
            }
            else{
                 $('#autre_grade').hide(); 
            }
        }
		function changeIndice(){
            var valeur = $('#indice').val();
            if(valeur=='0'){
               $('#autre_indice').show(); 
               $('#autre_indice').focus();
            }
            else{
                 $('#autre_indice').hide(); 
            }
        }
		
        $('#ajoutDiplome').on("click",ajouterDiplome);
        $('#ajoutParcours').on("click",ajouterParcours);
        $('#ajoutActivite').on("click",ajouterActivite);
        
        $('#ajoutAttrib').on("click",ajoutAttrib);
        $('#ajoutTache').on("click",ajoutTache);
        $('#ajoutPost').on("click",ajoutPost);
        $('#ajoutProduit').on("click",ajoutProduit);
        $('#ajoutFormAcad').on("click",ajoutFormAcad);
        $('#ajoutFormProf').on("click",ajoutFormProf);
        $('#ajoutRequi').on("click",ajoutRequi);
        $('#ajoutFaire').on("click",ajoutFaire);
        $('#ajoutEtre').on("click",ajoutEtre);
        
        
        function ajouterDiplome(){
            indexDiplome++;
            $('#tableDiplome').append(getRowTableDiplome(indexDiplome));
			
			$("input[name='diplome_date[]']").mask('9999');
        }
        
         function ajouterParcours(){
            indexParcours++;
            $('#tableParcours').append(getRowTableParcours(indexParcours));

			$("input[name='date_debut[]']").mask('9999');
			$("input[name='date_fin[]']").mask('9999');
            /*
            $("[name='date_fin[]']").datetimepicker({
                format: 'dd/mm/yyyy',
                minView:'month',
                            autoclose : true
            });
            $("[name='date_debut[]']").datetimepicker({
                format: 'dd/mm/yyyy',
                minView:'month',
                            autoclose : true
            });*/
        }
         
         function ajouterActivite(){
        	 indexActivite++;
        	 $('#table_activite').append(getRowTableActivite(indexActivite));
         }
         
         function ajoutAttrib(){
             indexAttrib++;
             $('#div_attrib').append(getRowTableAttrib(indexAttrib));
         }
         
         function ajoutTache(){
        	 indexTache++;
             $('#div_tache').append(getRowTableTache(indexTache));
         }
         
         function ajoutPost(){
        	 indexPost++;
             $('#div_post').append(getRowTablePost(indexPost));
         }
         
         function ajoutProduit(){
        	 indexProduit++;
             $('#div_produit').append(getRowTableProduit(indexProduit));
         }
         
         function ajoutFormAcad(){
        	 indexAcad++;
             $('#formation_acad_row').append(getRowTableAcad(indexAcad));
         }
         
         function ajoutFormProf(){
        	 indexProf++;
             $('#formation_prof_row').append(getRowTableProf(indexProf));
         }

		 toggleBloc();
         
         function ajoutRequi(){
        	 indexRequi++;
             $('#requi_row').append(getRowTableRequi(indexRequi));
         }
         
         function ajoutFaire(){
        	 indexFaire++;
             $('#faire_row').append(getRowTableFaire(indexFaire));
         }
         
         function ajoutEtre(){
        	 indexEtre++;
             $('#etre_row').append(getRowTableEtre(indexEtre));
         }
         
         function getRowTableActivite(index){
             var ret = '<tr id="row_activite_'+index+'">';
             ret += '<td style="padding:2px;width:90%"><input class="form-control" placeholder="Activite" type="text" name="activite[]"/></td>';     
             ret += '<td><button class="form-control btn_close" type="button" onclick="deleteActivite('+index+')"><i class="fa fa-minus-circle"></i></button></td>';     
             ret += '</tr>';
             return ret;
         }
         
        function getRowTableDiplome(index){
            /*var ret = '<div class="row diplome_row" id="diplome_row_'+index+'">';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Diplome" type="text" name="diplome_name[]"/></div>';
            ret += '<div class="col-md-3"><input class="form-control" placeholder="Fili&egrave;re" type="text" name="diplome_discipline[]"/></div>';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Ann&eacute;e d&grave;obtention" maxLength="4" id="diplome_date_'+index+'" onChange="testDate('+index+')" type="text" name="diplome_date[]"/></div>';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Etablissement" type="text" name="diplome_etablissement[]"/></div>';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Pays" type="text" name="diplome_pays[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiplome('+index+')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';*/

			var ret = '<tr id="diplome_row_'+index+'">';
            ret += '<td><input class="form-control" placeholder="Diplome" type="text" name="diplome_name[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Fili&egrave;re" type="text" name="diplome_discipline[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Ann&eacute;e d&grave;obtention" maxLength="4" id="diplome_date_'+index+'" onChange="testDate('+index+')" type="text" name="diplome_date[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Etablissement" type="text" name="diplome_etablissement[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Pays" type="text" name="diplome_pays[]"/></td>';     
            ret += '<td style="width:15px!important"><button class="btn_close" type="button" onclick="deleteDiplome('+index+')"><i class="fa fa-minus-circle"></i></button></td>';     
            ret += '</tr>';

            return ret;
        }
        
        function getRowTableParcours(index){
            /*var ret = '<div class="row diplome_row" id="parcours_row_'+index+'">';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Ann&eacute;e / Debut" maxLength="4" id="date_debut_'+index+'" onChange="testDate('+index+')" type="text" name="date_debut[]"/></div>';
            ret += '<div class="col-md-2"><input class="form-control" placeholder="Ann&eacute;e / Fin" id="date_fin_'+index+'" maxLength="4" onChange="testDate('+index+')" type="text" name="date_fin[]"/></div>';
            ret += '<div class="col-md-3"><input class="form-control" placeholder="PosteOccupe" type="text" name="par_poste[]"/></div>';
            ret += '<div class="col-md-3"><input class="form-control" placeholder="Departement" type="text" name="par_departement[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteParcours('+index+')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';*/
			var ret = '<tr id="parcours_row_'+index+'">';
			ret += '<td>&nbsp;</td>';
            ret += '<td><input class="form-control" placeholder="Ann&eacute;e / Debut" maxLength="4" id="date_debut_'+index+'" onChange="testDate('+index+')" type="text" name="date_debut[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Ann&eacute;e / Fin" id="date_fin_'+index+'" maxLength="4" onChange="testDate('+index+')" type="text" name="date_fin[]"/></td>';
            ret += '<td><input class="form-control" placeholder="PosteOccupe" type="text" name="par_poste[]"/></td>';
            ret += '<td><input class="form-control" placeholder="Departement" type="text" name="par_departement[]"/></td>';     
            ret += '<td><button class="btn_close" type="button" onclick="deleteParcours('+index+')"><i class="fa fa-minus-circle"></i></button></td>';     
            ret += '</tr>';
            return ret;
        }
        
        function  getRowTableAttrib(index){
            var ret = '<div class="row diplome_row" id="attribution_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Attribution" type="text" name="attribution[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteAttrib('+index+')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableTache(index){
            var ret = '<div class="row diplome_row" id="tache_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Tâche" type="text" name="tache_journaliere[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteTache('+index+')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTablePost(index){
            var ret = '<div class="row diplome_row" id="post_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Poste de travail" type="text" name="poste_travail[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'post_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableProduit(index){
            var ret = '<div class="row diplome_row" id="produit_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Produit Périodique" type="text" name="produit_periodique[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'produit_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableAcad(index){
            var ret = '<div class="row diplome_row" id="formation_academique_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Formation Academique" type="text" name="formation_academique[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'formation_academique_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableProf(index){
            var ret = '<div class="row diplome_row" id="formation_academique_prof_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Formation Professionnelle" type="text" name="formation_professionnelle[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'formation_academique_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableRequi(index){
            var ret = '<div class="row diplome_row" id="requi_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Connaissances Th&eacute;oriques" type="text" name="savoir_requi[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'tache_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableFaire(index){
            var ret = '<div class="row diplome_row" id="faire_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Savoir Faire" type="text" name="savoir_faire[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'faire_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        function  getRowTableEtre(index){
            var ret = '<div class="row diplome_row" id="etre_row_'+index+'">';
            ret += '<div class="col-md-8"><input class="form-control" placeholder="Savoir Être" type="text" name="savoir_etre[]"/></div>';     
            ret += '<div class="col-md-1"><button class="form-control btn_close" type="button" onclick="deleteDiv('+index+',\'etre_row\')"><i class="fa fa-minus-circle"></i></button></div>';     
            ret += '</div>';
            return ret;
        }
        
        
       
        
        function changeService(){
           var valeur = $('#service').val();
            if(valeur=='0'  || valeur=='-1' ){
               $('#autre_service').show(); 
               $('#autre_service').focus();
            }
            else{
                 $('#autre_service').hide(); 
            }
            
           $.ajax({
                    url: base_url() + "json/division/"+valeur,
                    type: 'get',
                    success: function(data, textStatus, jqXHR) {
                          var obj = $.parseJSON(data);
                          $('#division').html('');
                          var select_option ='';
                          select_option += '<option value="9999">------</option>';
                          obj.forEach(function(module) {
                              select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                          });
                          select_option += '<option value="0">AUTRES</option>';
                          $('#division').html(select_option);
                    },
                    async: false
            });
        }
        
        function changeSoa(){
            var valeur = $('#service').val();
             if(valeur=='0'  || valeur=='-1' ){
                $('#autre_service').show(); 
                $('#autre_service').focus();
				
             }
             else{
                  $('#autre_service').hide(); 
             }
             
            $.ajax({
                     url: base_url() + "json/soa/"+valeur,
                     type: 'get',
                     success: function(data, textStatus, jqXHR) {
                           var obj = $.parseJSON(data);
                           $('#div_soa').html('');
                           var select_option ='';
                           //select_option += '<option value="9999">------</option>';
                           obj.forEach(function(module) {
                               select_option += '<div class="row">'+module['libele']+'</div>';
                           });
                           //select_option += '<option value="0">AUTRES</option>';
                           $('#div_soa').html(select_option);
                     },
                     async: false
             });
         }
        
        /*
        function changeRegion(){
           var valeur = $('#region').val();
           $.ajax({
                url: base_url() + "json/district/"+valeur,
                type: 'get',
                success: function(data, textStatus, jqXHR) {
                      var obj = $.parseJSON(data);
                      $('#district').html('');
                      var select_option ='';
                      obj.forEach(function(module) {
                          select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                      });
                      $('#district').html(select_option);
                },
                async: false
            });*/
            
        function changeDistrict(){
            var valeur = $('#district').val();
            $.ajax({
                 url: base_url() + "json/departement_by_district/"+valeur,
                 type: 'get',
                 success: function(data, textStatus, jqXHR) {
                       var objArray = $.parseJSON(data);
                       $('#departement').html('');
                       var select_option1 = "";
                       select_option1 += '<option value="9999">------</option>';
                       objArray.forEach(function(obj) {
                    	   select_option1 += '<option value="'+obj.id+'">'+obj.libele+'</option>';
                       });
                       $('#departement').html(select_option1);
                       /*
                       $('#province').html('');
                       var select_option2 = '<option value="'+obj.prov_id+'">'+obj.prov_lib+'</option>';
                       $('#province').html(select_option2);*/
                 },
                 async: false
             });
        }
        
        function changeDivision(){
            var valeur = $('#division').val();
            if(valeur=='0'){
               $('#autre_division').show(); 
               $('#autre_division').focus();
            }
            else{
                 $('#autre_division').hide(); 
            }
        }
        
        
    
});

function base_url(){
    return zBasePath;
 }  

function changePays(){
    var valeur = $('#pays').val();
    $.ajax({
             url: base_url() + "json/province/"+valeur,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#province').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="9999">------</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                       exist = true;
                   });
                   if(exist)
                     /*select_option += '<option value="0">AUTRES</option>';*/
                   $('#province').html(select_option);
                   
                   $('#region').html('');
                   $('#region').html('<option value="9999">------</option>');
                   $('#district').html('');
                   $('#district').html('<option value="9999">------</option>');
             },
             async: false
     });
 }

function changeProvince(){
    var valeur = $('#province').val();
    $.ajax({
             url: base_url() + "json/region/"+valeur,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#region').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="9999">------</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	   /*select_option += '<option value="0">AUTRES</option>';*/
                   $('#region').html(select_option);
                   
                   $('#district').html('');
                   $('#district').html('<option value="9999">------</option>');
             },
             async: false
     });
 }
 
function changeRegion(){
    var valeur = $('#region').val();
    $.ajax({
             url: base_url() + "json/district/"+valeur,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#district').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="9999">------</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                       exist = true;
                   });
                   if(exist)
                	  /* select_option += '<option value="0">AUTRES</option>';*/
                   $('#district').html(select_option);
             },
             async: false
     });
 }

function changeDepartement(){
    var valeur = $('#departement').val();
    var district = $('#district').val();
    var url_get = base_url() + "json/direction/"+valeur+"/"+district;
    if(district==undefined)
    	url_get = base_url() + "json/direction/"+valeur;
    $.ajax({
             url: url_get,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#direction').html('');
                   var select_option ='';
                   var exist = false;
                   select_option += '<option value="9999">------</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                       exist = true;
                   });
                     /*select_option += '<option value="0">AUTRES</option>';*/
                   if(!exist){
                       $('#service').html('');
                       $('#service').html(select_option);
                       $('#division').html('');
                       $('#division').html(select_option);
                   }
				   else{
					   $('#service').html('');
                       $('#service').html('<option value="9999">------</option>');
                       $('#division').html('');
                       $('#division').html('<option value="9999">------</option>');
				   }
                   $('#direction').html(select_option);
             },
             async: false
     });
 }
 
 function changeDirection(){
    var valeur = $('#direction').val();
    var district = $('#district').val();
     if(valeur=='0' || valeur=='-1'){
        $('#autre_direction').show(); 
        $('#autre_direction').focus();
     }
     else{
          $('#autre_direction').hide(); 
     }
     var url_get = base_url() + "json/service/"+valeur+"/"+district;
     if(district==undefined)
    	 url_get = base_url() + "json/service/"+valeur;
    $.ajax({
             url:url_get ,
             type: 'get',
             success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
                   $('#service').html('');
                   var select_option ='';
                   select_option += '<option value="9999">------</option>';
                   obj.forEach(function(module) {
                       select_option += '<option value="'+module['id']+'">'+module['libele']+'</option>';
                   });
                     /*select_option += '<option value="0">AUTRES</option>';*/
                   $('#service').html(select_option);
             },
             async: false
     });
 }

function deleteDiplome(index){
       document.getElementById('diplome_row_'+index).innerHTML = '';
       document.getElementById('diplome_row_'+index).style.display = "none";
}

function deleteActivite(index){
    document.getElementById('row_activite_'+index).innerHTML = '';
    document.getElementById('row_activite_'+index).style.display = "none";
}


function deleteParcours(index){
    document.getElementById('parcours_row_'+index).innerHTML = '';
    document.getElementById('parcours_row_'+index).style.display = "none";
}

function deleteAttrib(index){
    $('#attribution_row_'+index).remove();
}

function deleteTache(index){
    $('#tache_row_'+index).remove();
}

function deleteDiv(index,div){
	$('#'+div+'_'+index).remove();
}

function testDate(_iIndex)
{
	zDateDebut = $("#date_debut_"+_iIndex).val();
	zDateFin = $("#date_fin_"+_iIndex).val();

	if (eval(zDateDebut) > eval(zDateFin) )
	{
		alert("La date de début doit être inférieur à la date fin");
		$("#date_debut_"+_iIndex).val('');
		$("#date_fin_"+_iIndex).val('');
	}
}

function print_pdf(url){
	window.open(url);
}

function printJournal(){
	update_print_content(window.location+"/5");

    
}

function update_print_content(urlPrint){
	$.ajax({
        url: urlPrint,
        type: "GET",
        asynchr:true,
        success: function(data){
            $("#print_content_1").append(data);
            var WinPrint = window.open();
            WinPrint.document.write($("#print_content_1").html());
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close(); 
        }
    });	
}

function printJournalPDF(){
    var prtContent = document.getElementById('detailPrint');
    window.open(window.location+"/5/1");
}

function clickPrenom(){
  	 var matricule = $('#matricule').val();
  		matricule = matricule.replace(' ','');
       var nom = $('#nom').val();
       var prenom = $('#prenom').val();
       if(matricule == ''){
       	bootbox.alert("Remplir votre matricule d'abord");
           //$('#message').html("Remplir votre matricule d'abord");
           $('#matricule').focus();
           error = true;
       }
       else if(nom == ''){
       	bootbox.alert("Veuillez remplir votre nom");
          // $('#message').html("Veuillez remplir votre nom");
           $('#nom').focus();
           error = true;
       }
  		var statut = $('#statut').val();
       if((statut == 3 || statut == 7 || statut == 5 || statut == 8) && (prenom=="")){
           $.ajax({
               url: $('#url_base').val() + "user/verify_im_nom/"+matricule+"/"+nom,
               type: 'get',
               success: function(data, textStatus, jqXHR) {
                   var obj = $.parseJSON(data);
  					if(obj){
  						if(obj.statut){
  							switch(obj.statut){
  								case 1:
  								  $('#prenom').val(obj.prenom);
  								  $('#prenom').attr('readonly','readonly');
  								  $('#nom').attr('readonly','readonly');
  								  $('#cin').val(obj.cin);
  								  if(obj.cin!='')
  									$('#cin').attr('readonly','readonly');
  								  $('#message').html("");
  								  $('#sexe').focus();
  								  break;
  								case 2:
  								   //$('#message').html(obj.msg);
  								   bootbox.alert(obj.msg);
  								   $('#matricule').focus();
  								  break;
  								case 3:
  								  // $('#message').html(obj.msg);
  								   bootbox.alert(obj.msg);
  								   $('#nom').focus();	
  								   break;
  								case 4:
  									$('#message').html('');
  								break;
  							}
  						}
  					}  
               },
               async: false
            });
       }
  }
