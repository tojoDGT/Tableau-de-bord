{include_php file=$zCssJs}
	<link rel="stylesheet" href="{$zBasePath}assets/css/formoid1/formoid-solid-blue-chart.css" type="text/css" />
	<div class="wrapper">
		<!-- ace styles -->
		<link rel="stylesheet" href="{$zBasePath}assets/common/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		 <link rel="stylesheet" type="text/css" href="{$zBasePath}assets/common/css/vendor/jquery-ui.css?20180723161023?sdsds" >

		{include_php file=$zHeader}
		<script src="{$zBasePath}assets/js/jquery.maskedinput.js?V2"></script>

		<div class="content-wrapper">
			<section class="content-header">
			  <h1>
				{if $oData.iId==''}Ajout{else}Modification{/if} {$oData.zLibelle}
				<small>&nbsp;</small>
			  </h1>
			  <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Accueil</a></li>
				<li><a href="#"><i class="fa fa-th"></i> Gestion des usagers</a></li>
				<li><a href="#"><i class="fa fa-th"></i> {$oData.zLibelle1|ucfirst} </a></li>
				<li class="active">{if $oData.iId==''}Ajout{else}Modification{/if}</li>
			  </ol>
			</section>
			<!------------------------------>
			<!-- Main content -->
			<section class="content">
			  <div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-body">
					  <!------------------------------------------------------------->
					  <form method="post" name="formulaireEdit" id="formulaireEdit" onSubmit="return valider();"  enctype="multipart/form-data" action="{$zBasePath}usager/save">
															<input type="hidden" id="iId" name="iId" value="{$oData.iId}"> 
							<div class="row">
								<div class="col-xs-12">
										<div class="box box-primary">
												<!-- Left col -->
											<div class="">
												<div id="getStat">
														<div class="box box-success">
															
															<main>
																<input id="radio0" type="radio" name="css-tabs" checked>
																<input id="radio1" type="radio" name="css-tabs">
																<input id="radio2" type="radio" name="css-tabs">
																<input id="radio3" type="radio" name="css-tabs">
																<div id="tabs">
																	<label id="tab0" for="radio0">Demande</label>
																	<label id="tab1" for="radio1">Developpeur</label>
																	<label id="tab2" for="radio2">Observateur</label>
																	<label id="tab3" for="radio3">FAQ</label>
																</div>
																<div id="content">
																			<section id="content0">
																				{$oData.zContentDemande}
																			</section>
																			<section id="content1">
																				{$oData.zContentDeveloppement}
																			</section>
																			<section id="content2">
																				{$oData.zContentObservation}
																			</section>
																			<section id="content3">
																				{$oData.zContentFaq}
																			</section>
																
																</div>
																
															</main>

														</div>
												</div>
												<div class="box-footer">
																	<input style="width: 150px;" type="submit" name="btnSave" onsubmit="return valider();ss" class="btn btn-primary text-blue" value="Enregistrer">
																	<a style="width: 150px;" href="{$zBasePath}usager/liste" class="btn btn-primary">Retour</a> 
																</div>

											</div>
											<!-- fin Left col -->
										 </div>
										 
								</div>
							</div>
						</form>
					  <!------------------------------------------------------------->
					</div>
				  </div>
				</div>
			  </div>
			</section>
		</div> 
		<style>
			.sectionContent{
				/*display:none;*/
			}
			.zavatra{
				/*display:block;*/
			}
		</style>
		{include_php file=$zFooter}
		 <script type="text/javascript" src="{$zBasePath}assets/common/js/vendor/jquery-ui.js"></script>

	</div>
	</body>
</html>