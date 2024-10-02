<div class="col-md-4" style="display:inline-flex">
<table class="table tableRond table-top-countries">
	<tbody>
		<tr>
			<td class="middle" style="vertical-align: middle;padding-left: 36px;" width="10"><h6>Année Exercice:</h6></td>
			<td class="noBottom">
				<select class="form-control" id="iAnneeExercice" name="iAnneeExercice" onChange="ChargementOnglet(this.value);">
						<option {if $iAnneeExercice=='2023'}selected="selected"{/if} value="2023">2023</option>
						<option {if $iAnneeExercice=='2024'}selected="selected"{else}selected="selected"{/if} value="2024">2024</option>
				</select>
			</td>
		</tr>
		</tbody>
</table>
</div>
<div class="mb-0 detailTj">
	<div class="card-body">
		<div class="row">
			<div class="col-md-12">
				<div class="pcss3t pcss3t-effect-scale pcss3t-theme-1">
					<input type="radio" checked="" name="pcss3t" id="tab1" data-info="statistique" data-title="Information" class="radioTabs tab-content-info">
					<label style="background-color: #777;" for="tab1"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#fff"></circle><path fill="#aba6a6" d="M12 17a.99943.99943 0 0 1-1-1V12a1 1 0 0 1 2 0v4A.99943.99943 0 0 1 12 17zM12 9a.9994.9994 0 0 1-.37988-.08008A1.14718 1.14718 0 0 1 11.29 8.71.98946.98946 0 0 1 11 8a.83154.83154 0 0 1 .08008-.37988A1.14718 1.14718 0 0 1 11.29 7.29a1.02883 1.02883 0 0 1 .33008-.21.99414.99414 0 0 1 .75976 0 1.03947 1.03947 0 0 1 .33008.21A1.05232 1.05232 0 0 1 13 8a.99042.99042 0 0 1-1 1z"></path></svg> Statistiques</label>
					<input type="radio" name="pcss3t" id="tab3" data-info="valider" data-title="Ajout structures filles" class="radioTabs tab-content-addstructure">
					<label style="background-color: #777;" for="tab3"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="#fff" d="M19,21.5H5a3.00328,3.00328,0,0,1-3-3V5.5a3.00328,3.00328,0,0,1,3-3H9.55859A2.99629,2.99629,0,0,1,12.4043,4.55078L12.7207,5.5H19a3.00328,3.00328,0,0,1,3,3v10A3.00328,3.00328,0,0,1,19,21.5Z"></path><path fill="#aba6a6" d="M14,12.5H13v-1a1,1,0,0,0-2,0v1H10a1,1,0,0,0,0,2h1v1a1,1,0,0,0,2,0v-1h1a1,1,0,0,0,0-2Z"></path></svg> Liste des dossiers validés (<strong id="dossierValide" style="color:#2aff5b !important">{if $oGetInfo->VALIDE>0}{$oGetInfo->VALIDE}{else}0{/if}</strong>)</label>
					<input type="radio" name="pcss3t" id="tab4" data-info="refuser" data-title="Désactivation des structures filles" class="radioTabs tab-content-addstructure">
					<label style="background-color: #777;" for="tab4"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"><path fill="#fff" d="M19,21.5H5a3.00328,3.00328,0,0,1-3-3V5.5a3.00328,3.00328,0,0,1,3-3H9.55859A2.99629,2.99629,0,0,1,12.4043,4.55078L12.7207,5.5H19a3.00328,3.00328,0,0,1,3,3v10A3.00328,3.00328,0,0,1,19,21.5Z"></path><path fill="#aba6a6" d="M14,12.5H13v-1a1,1,0,0,0-2,0v1H10a1,1,0,0,0,0,2h1v1a1,1,0,0,0,2,0v-1h1a1,1,0,0,0,0-2Z"></path></svg> Liste des dossiers refusés (<strong id="dossierRefus" style="color:#ffafaf !important">{if $oGetInfo->REJET>0}{$oGetInfo->REJET}{else}0{/if}</strong>)</label>

					<div class="ombremultiple" id="contentPaneTabs">
						{$zTplAffiche}
					</div>
			</div>
		</div>
	</div>			
</div>
<script type="text/javascript">
		
		function ChargementOnglet(_iAnnee){
			$('input[name="pcss3t"]:checked').click();	
		}
		
		$(".radioTabs").off("click").on("click", function(){

			$("#table_bd_processing1").show();
			var iType = $(this).attr("data-info"); 
			var iUserId = '{$iUserId}';
			var iAnneeExercice = $('#iAnneeExercice').val();

			$.ajax({
				url: zBasePath + "Utilisateur/getTabsAgentActive",
				method: "POST",
				data: {
					iType : iType,
					iUserId : iUserId,
					iAnneeExercice : iAnneeExercice,
					ajax : 1
				},
				success: function(data, textStatus, jqXHR) {
						var data = JSON.parse(data);
						$("#dossierValide").html(data.VALIDE);
						$("#dossierRefus").html(data.REJET);
						$("#contentPaneTabs").html(data.TEMPLATE);
						$("#table_bd_processing1").hide();
				},
				async: true

			});
			
		});

</script>
<style>
.avatar > img {
  width: 100%;
  height: 100%;
  -o-object-fit: cover;
  object-fit: cover;
  border-radius: 50%;
}
.avatar {
  background-color: transparent;
  color: #ffffff;
  display: inline-block;
  font-weight: 500;
  height: 34px;
  line-height: 38px;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  vertical-align: middle;
  width: 34px;
  position: relative;
  white-space: nowrap;
  margin: 0 10px 0 0;
  border-radius: 50%;
}
.modifPremierResp{
	position:absolute;
	font-size:20px;
	margin-left: 34px;
	margin-top: 5px;
	color:#3c8dbc;
	cursor:pointer;
}
.main-float:after {
	position:absolute;
	cursor:pointer;
    height: 1em;
    width: 1em;
    margin-top: 10px;
	margin-left: -23px;
    display: inline-block;
    color: #e8dfdf;
    /*border: 0.15em solid white;*/
    border-radius: 1em;
    box-shadow: 0 0 0.2em #444;
    box-sizing: content-box;
    text-align: center;
    text-indent: 0 !important;
    font-family: "Courier New",Courier,monospace;
    line-height: 1em;
    content: "-";
    background-color: #e57a7a;
}
.main-plus:after {
    height: 1.5em;
    width: 1.5em;
    margin-top: 10px;
	/*margin-left: -23px;*/
    display: inline-block;
	cursor:pointer;
    color: #e8dfdf;
    /*border: 0.15em solid white;*/
    border-radius: 1em;
    box-shadow: 0 0 0.2em #444;
    box-sizing: content-box;
    text-align: center;
    text-indent: 0 !important;
    font-family: "Courier New",Courier,monospace;
    line-height: 1.5em;
    content: "+";
    background-color: #3c8dbc;
}
.main-modif:after {
    height: 1.5em;
    width: 1.5em;
    margin-top: 10px;
	/*margin-left: -23px;*/
    display: inline-block;
	cursor:pointer;
    color: white;
    border: 0.15em solid white;
    border-radius: 1em;
    box-shadow: 0 0 0.2em #444;
    box-sizing: content-box;
    text-align: center;
    text-indent: 0 !important;
    font-family: "Courier New",Courier,monospace;
    line-height: 1.5em;
    content: "fa fa-edit";
    background-color: #31b131;
}
.detailTj a.bleu {
    color: #337ab7!important;
    text-decoration: none;
}

.alignementLeft{
	width:200px;
	display:inline-block;
}

.alignementRight{
	width:500px;
	display:inline;
	padding-right:15px;
}
.alignementRight span{
	padding-right:15px;
	padding-top:15px;
}

.alignementRight select{
	padding:0 25px 0 5px;
}

.alignementRight input[type=file]{
	display:inline;
}

.select2-container-multi .select2-choices {
    min-height: 41px;
}

.select2-container-multi .select2-choices .select2-search-field input {
    margin: 10px 0;
}

.select2-container .select2-choice{
	height:41px;
	border: 1px solid #666;
	text-decoration:none!important;
	
}

.select2-container .select2-choice span{
/*	padding-top:3px;*/
	color:#666!important;
}

.noStyleType li{
	list-style-type: none;
}
.pure-material-button-contained{
	float:right;
}

.jBox-Modal {
	z-index:100000000!important;
}
.card {
	border: 1px solid #ededed;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);
	margin-bottom: 30px;
	padding-bottom: 10px;

}

 .card-text { height: 42px; overflow-y: scroll; width: 100%; }
    
 .card-text p { width: 650px; word-break: break-word; }


.card-title {
	color: #1f1f1f;
	font-size: 16px;
	font-weight: 500;
	/*margin-bottom: 20px;*/
}

.card-header {
	background-color: #fff;
}

.card-footer {
	background-color: #fff;
}
</style>

							</div>
							  
							  
							  

							  
							
							  

							 

							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>