<div class="card-body">
<div class="form-group mb-0">
	<div class="form-group">
		<label for="exampleInputEntite1">Intitulé pour le champ radio (ex: êtes-vous marié ?) </label>
		<input type="text" name="intitule" id="intitule" style="width:50%" class="input input-sm form-control obligatoire" value="" />
		<input type="hidden" name="iType" id="iType" value="1"/>
		<p class="message">Champ obligatoire</p>
	</div>
</div>
<br/>
<div style="text-align:right;padding-right: 1.25rem;">
<input style="width: 250px;" type="button" name="btnAddChamp" itypecible="1" incrementcible="nbrLigneRadio" tablecible="tableAddRadioRender" class="btn  bg-green AddLigne" value="Ajouter un nouveau choix (radio)" autocomplete="off">
<input type="hidden" name="nbrLigneRadio" id="nbrLigneRadio" value="1" autocomplete="off">
</div>
<br/>
<table class="table table-bordered" id="tableAddRadioRender">
  <thead>
		<tr>
			  <th>Libellé d'affichage</th>
			  <th>Nom de champ dans le formulaire</th>
			  <th>Montant</th>
			  <th style="width: 10px">#</th>
		</tr>
  </thead>
  <tbody>
		<tr>
			<td>
				<div class="item-cont">
					<input type="text" name="caption[]" id="caption_1" class="input input-sm form-control obligatoire" value="" />
					<p class="message">Champ obligatoire</p>
				</div>
			</td>
			<td>
				<div class="item-cont">
					<input type="text" name="champNom[]" id="champNom_1" class="automaticRad input input-sm form-control obligatoire" value="" />
					<p class="message">Champ obligatoire</p>
				</div>
			</td>
			<td>
				<div class="item-cont">
					<input type="text" name="montant[]" id="montant_1" class="input prix input-sm form-control obligatoire" value="" />
					<p class="message">Champ obligatoire</p>
				</div>
			</td>
			<td>
				
			</td>
		</tr>
  </tbody>
</table>
</div>
<script type="text/javascript">
	function deleteChamp(index){
		   $("#ChampTr_" +index).fadeOut('slow',function(){
			   $(this).html('')
		   });
	}


  $(document).ready(function() {
			
			$(".prix").numeric({ decimal : ".",  negative : false, scale: 2 });
			$('#champNom_1').on("change",function(){

					var iValue = $('#champNom_1').val();
					$(".automaticRad").val(iValue);
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
					url: zBasePath + "rnf/"+_zTemplate+"/",
					type: 'post',
					data: {
						iIndexNew : _iIndexNew,
						iType	  : _iType,
					},
					success: function(data, textStatus, jqXHR) {

						var zRow = $(data);
						$('#'+_zCible).append(zRow);
						zRow.fadeIn(1000);
						event.preventDefault()
						
					},
					async: false
				}).done(function() {
					//$.getScript( zBasePath + "assets/js/loading.js" )
				});
			}
	})
</script>