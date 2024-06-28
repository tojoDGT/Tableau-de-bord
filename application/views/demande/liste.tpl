{include_php file=$zCssJs}
<script>
	var zController = "demande";
</script>
	<div class="wrapper">
		<!-- ace styles -->
		<link rel="stylesheet" href="{$zBasePath}assets/common/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		{include_php file=$zHeader}

		<div class="content-wrapper">
			<section class="content-header">
			  <h1>
				{$oData.zLibelle}
				<small>&nbsp;</small>
			  </h1>
			  <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Accueil</a></li>
				<li><a href="#"><i class="fa fa-th"></i> Gestion des utilisateus</a></li>
				<li class="active">{$oData.zLibelle1|ucfirst}</li>
			  </ol>
			</section>
			<!------------------------------>
			<!-- Main content -->
			<section class="content">
			  <div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-header">
					  <a href="{$zBasePath}demande/edit" class="btn btn-primary">Ajouter un {$oData.zLibelle1}</button></a> 
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					  <!------------------------------------------------------------->
							<div class="row">
								<div class="col-xs-12" id="setHtmlInfo1">
									{$oData.zPortionTable}
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