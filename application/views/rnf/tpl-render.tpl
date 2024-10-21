<div class="card card-secondary">
	<div class="card-body">
		<div id="change" class="panel panel-default1">	
			<div id="panelFixe" style="display:block">
				
				<table class="table table-bordered" id="tablePrincipale">
					  <thead>
							<tr>
								  <th>Rendu</th>
								  <th>HTML</th>
								  <th style="width: 10px">#</th>
							</tr>
					  </thead>
					  <tbody>
							{assign var=iIncrementForm value="1"}
							{foreach $toSaveForm as $oSaveForm}
							<tr id="tr_{$oSaveForm.iKey}">
								<td style="width:40%">
										<div class="card">
											<div class="card-header">
												<h5 class="card-title m-0">{$oSaveForm.intitule}</h5>
											</div>
											<div class="card-body">
												<div class="custom-control {if $oSaveForm.iType==1}custom-radio{elseif $oSaveForm.iType==2}custom-check{else}custom-check{/if}">
													
													{if $oSaveForm.iType==3}
														<div class="rowdynamique">
															<div class="form-group" style="display:inline-flex">
																	Nombre de boucle * :&nbsp;&nbsp;
																	<input type="text" name="nbrBoucle_{$oSaveForm.iKey}" id="nbrBoucle_{$oSaveForm.iKey}" iKey="{$oSaveForm.iKey}" onkeyup="renderBoucle({$oSaveForm.iKey})" boucleCible="boucleCible_{$oSaveForm.iKey}" style="width:15%;height:28px" class="input input-sm form-control" value="1" />
															 </div>
															 
															 <div id="boucleCibleInit_{$oSaveForm.iKey}">
															 {assign var=iIncrement value="0"}
															 {foreach $oSaveForm.caption as $zCaption}
																<span class="marge">
																	<input {if $oSaveForm.iType==1}type="radio" {elseif $oSaveForm.iType==2}type="checkbox" {else}type="checkbox"{/if} 
																	name="{$oSaveForm.champNom.$iIncrement}_1" id="{$zCaption.$iIncrement}_1" value="{$oSaveForm.montant.$iIncrement}" class="custom-control-input form-typeChamp">
																	<label class="custom-control-label" for="{$zCaption.$iIncrement}">&nbsp;{$zCaption}</label>
																</span>
															{assign var=iIncrement value=$iIncrement+1}
															{/foreach}
															</div>
															<div id="boucleCible_{$oSaveForm.iKey}">
															</div>
														</div>
													{else}
													
														{assign var=iIncrement value="0"}
														{foreach $oSaveForm.caption as $zCaption}
															<span class="marge">
																<input {if $oSaveForm.iType==1}type="radio" {elseif $oSaveForm.iType==2}type="checkbox" {else}type="checkbox"{/if} name="{$oSaveForm.champNom.$iIncrement}" id="{$zCaption.$iIncrement}" value="{$oSaveForm.montant.$iIncrement}" class="custom-control-input form-typeChamp">
																<label class="custom-control-label" for="{$zCaption.$iIncrement}">&nbsp;{$zCaption}</label>
															</span>
														{assign var=iIncrement value=$iIncrement+1}
														{/foreach}
													{/if}
												</div>
											</div>
										</div>
								</td>
								<td style="width:60%">
									
									<textarea  id="codeMirrorDemo{$iIncrementForm}" class="p-3">
<h5 class="card-title m-0">{$oSaveForm.intitule}</h5>
<div class="custom-control {if $oSaveForm.iType==1}custom-radio{elseif $oSaveForm.iType==2}custom-check{else}custom-check{/if}">
	{assign var=iIncrement value="0"}
	{foreach $oSaveForm.caption as $zCaption}
		<span class="marge">
			<input {if $oSaveForm.iType==1}type="radio"{elseif $oSaveForm.iType==2}type="checkbox"{else}type="checkbox"{/if} name="{$oSaveForm.champNom.$iIncrement}" id="{$zCaption.$iIncrement}" value="{$oSaveForm.montant.$iIncrement}" class="custom-control-input form-typeChamp">
			<label class="custom-control-label" for="{$zCaption.$iIncrement}">&nbsp;{$zCaption}</label>
		</span>
	{assign var=iIncrement value=$iIncrement+1}
	{/foreach}
</div>

									</textarea>																					
								</td>
								<td style="vertical-align:middle">
									<button style="cursonr:pointer" class="btn_close" type="button" onclick="deleteChamp({$iIndexNew})"><img style="cursonr:pointer;color: #F10610;" width="20" src="{$zBasePath}/assets/iles/del.png"></button>
								</td>
							</tr>
							{assign var=iIncrementForm value=$iIncrementForm+1}
							{/foreach}
					  </tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>
{if count($toSaveForm)>0}
<script>
  $(function () {
    // Summernote
    $('#summernote').summernote()

    // CodeMirror
	{for $foo=1 to $iIncrementForm-1}

    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo{$foo}"), {
      mode: "htmlmixed",
      theme: "monokai"
    });

	{/for}

  })

  function renderBoucle(iKey){
		
		var iBoucle = $("#nbrBoucle_"+iKey).val();
		var zCible  = $("#boucleCible_"+iKey);


		if(iBoucle!=0 || iBoucle!=""){
			$(zCible).html("");
			boucleCibleInit = $("#boucleCibleInit_"+iKey).html();

			//console.log("---" + boucleCibleInit + "-----");

			for(iIncr=1;iIncr<=iBoucle-1;iIncr++){
				
				var iLast = iIncr+1 ; 
				var zChange = "_" + iLast; 
				
				var boucleCibleInit2 = boucleCibleInit.replaceAll("_1", zChange);

				//console.log(boucleCibleInit2);
				
				$(zCible).append(boucleCibleInit2+ "<br>");
			}
		}
  }

  $(document).ready(function() {
	 
  })
</script>
{/if}