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
	<div>&nbsp;</div>
	<div class="row">	
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">
					  <i class="fas fa-chart-pie mr-1"></i>
					  Resultats
					</h3>
					<br>
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