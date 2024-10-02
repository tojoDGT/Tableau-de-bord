<div class="">
	<div class="card">
			  <div class="card-header p-2">
				<ul class="nav nav-pills">
				  <li class="nav-item"><a class="nav-link {if $iModeGraph==1}active{/if} getOngletGraph" iModeGraph="1" href="#histogramme" data-toggle="tab">Histogramme</a></li>
				  <li class="nav-item"><a class="nav-link {if $iModeGraph==2}active{/if} getOngletGraph" iModeGraph="2" href="#circulaire" data-toggle="tab">Circulaire</a></li>
				  <li class="nav-item"><a class="nav-link {if $iModeGraph==3}active{/if} getOngletGraph" iModeGraph="3" href="#baton" data-toggle="tab">Bâton</a></li>
				  <li class="nav-item"><a class="nav-link {if $iModeGraph==4}active{/if} getOngletGraph" iModeGraph="4" href="#line" data-toggle="tab">LineChart</a></li>
				  <li class="nav-item"><a class="nav-link {if $iModeGraph==5}active{/if} getOngletGraph" iModeGraph="5" href="#donut" data-toggle="tab">Donut</a></li>
				 
				</ul>
			  </div>
			  <div class="card-body">
						<div class="tab-content">
									  <div class="tab-pane {if $iModeGraph==1}active{/if}" id="histogramme">
											{if $iModeGraph==1}
											{$zTplGraphPortion}
											{/if}
									  </div>
									  
									  <div class="tab-pane {if $iModeGraph==2}active{/if}" id="circulaire">
											{if $iModeGraph==2}
											{$zTplGraphPortion}
											{/if}
									  </div>
									 
									  <div class="tab-pane {if $iModeGraph==3}active{/if}" id="baton">
											{if $iModeGraph==3}
											{$zTplGraphPortion}
											{/if}
									  </div>
									  <div class="tab-pane {if $iModeGraph==4}active{/if}" id="line">
											{if $iModeGraph==4}
											{$zTplGraphPortion}
											{/if}
									  </div>
									   <div class="tab-pane {if $iModeGraph==5}active{/if}" id="donut">
											{if $iModeGraph==5}
											{$zTplGraphPortion}
											{/if}
									  </div>
						 
						</div>
			  </div>
	</div>
</div>

{literal}
<script type="text/javascript">

	$('.getOngletGraph').on('click', function () {

		var iModeGraph = $(this).attr("iModeGraph");
		$("#iModeGraph").val(iModeGraph);
		$(".stattPlace").html("");
		//$(".stattPlace").html('<div style=";text-align: center;vertical-align: middle;padding-top: 10px;"><img class="imageAloha" src="'+zBasePath+'assets/images/loading.gif" width="100">');
		$("#table_bd_processing2").show();
		
		$.ajax({
			url : zBasePath + "dashboard/getGraphAjax", // json datasource
			type: "post",
			data: $("#sendSearch").serialize(),
			success: function (zReturn, textStatus, jqXHR) {
				
				$(".stattPlace").html("");
				$(".stattPlace").html(zReturn);
				$("html, body").animate({ scrollTop: document.body.scrollHeight }, "slow");
				$("#table_bd_processing2").hide();
			},
			async: true
		});
    });
</script>
{/literal}
