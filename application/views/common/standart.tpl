{include_php file=$zCssJs}
	<div class="wrapper">
		<!-- ace styles -->
		<link rel="stylesheet" href="{$zBasePath}assets/common/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		{include_php file=$zHeader}

		<div class="content-wrapper">
			<section class="content-header">
			  <h1>
				Liste des programmes de formation
				<small>&nbsp;</small>
			  </h1>
			  <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Accueil</a></li>
				<li><a href="#"><i class="fa fa-th"></i> Reporting</a></li>
				<li class="active">Programme de formation</li>
			  </ol>
			</section>
			

			<!------------------------------>
			<!-- Main content -->
			<section class="content">
			  <div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-header">
					  <a href="{$zBasepath}programme_formation" class="btn btn-primary">Ajouter un programme de formation</button></a> 
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					  <!------------------------------------------------------------->
							<div class="row">
								<div class="col-xs-12">
									<table id="simple-table" class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label class="pos-rel">
														<input type="checkbox" class="ace" />
														<span class="lbl">Actif</span>
													</label>
												</th>
												<th>Ordre</th>
												<th>Institues/Thèmes</th>
												<th>Intitulés</th>
												<th>Fichiers rattachés</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											

										</tbody>
									</table>
								</div>
							</div>
					  <!------------------------------------------------------------->
					</div>
				  </div>
				</div>
			  </div>
			</section>
		</div>
		{include_php file=$zFooter}
	</div>
	</body>
</html>