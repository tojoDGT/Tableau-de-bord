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
			  <li class="breadcrumb-item active">{$oData.zLibelle1|ucfirst}</li>
            </ol>
          </div>
        </div>
		
      </div><!-- /.container-fluid -->
    </section>
<style>
.row {
	margin-left:10px;
	margin-right:10px;
}
</style>
    <!-- Main content -->
			{$oData.zPortionTable}
    <!-- /.content -->
  </div>
  {include_php file=$zFooter}
