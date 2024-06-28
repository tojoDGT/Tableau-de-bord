{include_php file=$zCssJs}

  {include_php file=$zHeader}
  
  <div class="content-wrapper">
    
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{$oData.zLibelle1}</h1>
          </div>
        
		  <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
			  <li class="breadcrumb-item"><a href="#">Accueil</a></li>
			  <li class="breadcrumb-item"><a href="#">Tableau de bord</a></li>
			  <li class="breadcrumb-item active">{$oData.zLibelle|ucfirst}</li>
            </ol>
          </div>
        </div>
		
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
	<div class="row">
	  <a href="{$zBasePath}utilisateur/edit" class="btn btn-primary" style="text-align:left">Ajouter un {$oData.zLibelle1}</button></a> 
	</div>
	<div>&nbsp;</div>
	<div class="row">	
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title"></h3>

					<div class="card-tools">
					</div>
				</div>
					{$oData.zPortionTable}
				</div>
			<!-- /.content -->
			</div>
		</div>
	</div>
<style>
.row {
margin-left:15px;
margin-right:15px;
}
</style>
  {include_php file=$zFooter}