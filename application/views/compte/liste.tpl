{include_php file=$zCssJs}

  {include_php file=$zHeader}
  
  <div class="content-wrapper">
    
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{$oData.zLibelle1}</h1>
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
