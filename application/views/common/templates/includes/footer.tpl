{literal}
<script>
  jQuery(document).ready(function() {
       jQuery('#table_planning').dataTable({
        "order": [[ 0, 'asc' ]]
     });  
  });
  </script> 
{/literal}
<footer class="main-footer">
	<div class="pull-right hidden-xs">
	  <b>Version</b> 1.0
	</div>
	<strong>Copyright &copy; 2024 <a href="#">MEF</a></strong>/DGT
</footer>
 <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<form id="sendSearch" name="sendSearch" action="{$zBasePath}dashboard/changeCol" method="post">
			<input type="zReturnUrl" name="zReturnUrl" value="{$zReturnUrl}">
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="Identifiant-E.ECRI_NUM" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="IdentifiantNumInfo-m.MAND_NUM_INFO" class="mr-1" name="colonneAffiche[]" /><span>Identifiant Mandat</span></div>
				{*<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-tt.TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="CODE TIERS-tt.CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>CODE TIERS</span></div>*}
				<div class="mb-2"><input type="checkbox" {if ECRI_REF|in_array:$oDataTempCol} checked="checked" {/if} value="Référence-E.ECRI_REF" class="mr-1" name="colonneAffiche[]" /><span>Réference</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_LIB|in_array:$oDataTempCol} checked="checked" {/if} value="Libellé-E.ECRI_LIB" class="mr-1" name="colonneAffiche[]" /><span>Libellé</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_DT_CECRITURE|in_array:$oDataTempCol} checked="checked" {/if} value="Date-E.ECRI_DT_CECRITURE" class="mr-1" name="colonneAffiche[]" /><span>Date</span></div>
				<div class="mb-2"><input type="checkbox" {if PROP_CODE|in_array:$oDataTempCol} checked="checked" {/if} value="Propriétaire-t.PROP_CODE" class="mr-1" name="colonneAffiche[]" /><span>Propriété</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MODE_PAIE|in_array:$oDataTempCol} checked="checked" {/if} value="Mode-m.MAND_MODE_PAIE" class="mr-1" name="colonneAffiche[]" /><span>Mode de paiement</span></div>
				<div class="mb-2"><input type="checkbox" {if SOA|in_array:$oDataTempCol} checked="checked" {/if} value="SOA-m.SOA" class="mr-1" name="colonneAffiche[]" /><span>SOA</span></div>
				<div class="mb-2"><input type="checkbox" {if COMPTE|in_array:$oDataTempCol} checked="checked" {/if} value="COMPTE-m.COMPTE" class="mr-1" name="colonneAffiche[]" /><span>COMPTE</span></div>
				<div class="mb-2"><input type="checkbox" {if MISSION|in_array:$oDataTempCol} checked="checked" {/if} value="MISSION-m.MISSION" class="mr-1" name="colonneAffiche[]" /><span>MISSION</span></div>

				<div class="mb-2"><input type="checkbox" {if ASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="Assignataire-m.ASSIGNATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Assignataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MANDATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="Mandataire-m.MANDATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Mandataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_VISA_TEF|in_array:$oDataTempCol} checked="checked" {/if} value="Visa TEF-m.MAND_VISA_TEF" class="mr-1" name="colonneAffiche[]" /><span>Visa TEF</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_NUM_INFO|in_array:$oDataTempCol} checked="checked" {/if} value="Numéro Info-m.MANDAT" class="mr-1" name="colonneAffiche[]" /><span>Numéro Info</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_OBJET|in_array:$oDataTempCol} checked="checked" {/if} value="Objet du mandat-m.MAND_OBJET" class="mr-1" name="colonneAffiche[]" /><span>Objet du mandat</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_RECUP|in_array:$oDataTempCol} checked="checked" {/if} value="Date Récupération-m.MAND_DATE_RECUP" class="mr-1" name="colonneAffiche[]" /><span>Date Récupération</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_REEL_VISA|in_array:$oDataTempCol} checked="checked" {/if} value="Date réelle du Visa-m.MAND_DATE_REEL_VISA" class="mr-1" name="colonneAffiche[]" /><span>Date réelle du Visa</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MONTANT1|in_array:$oDataTempCol} checked="checked" {/if} value="Montant-m.MAND_MONTANT1" class="mr-1" name="colonneAffiche[]" /><span>Montant</span></div>
				<hr class="mb-2" />
				<div style="text-align: center;"> <input type="submit" class="changerCol btn btn-info" value="Changer" autocomplete="off"></div>
			</div>
			</form>
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- Bootstrap 3.3.7 -->
<!--<script src="{$zBasePath}assets/common/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="{$zBasePath}assets/common/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="{$zBasePath}assets/common/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>-->

<script src="{$zBasePath}assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="{$zBasePath}assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="{$zBasePath}assets/plugins/jszip/jszip.min.js"></script>
<script src="{$zBasePath}assets/plugins/pdfmake/pdfmake.min.js"></script>
<script src="{$zBasePath}assets/plugins/pdfmake/vfs_fonts.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="{$zBasePath}assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<!-- FastClick -->
<script src="{$zBasePath}assets/common/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="{$zBasePath}assets/common/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="{$zBasePath}assets/common/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="{$zBasePath}assets/common/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="{$zBasePath}assets/common/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="{$zBasePath}assets/common/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="{$zBasePath}assets/common/bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{$zBasePath}assets/common/dist/js/pages/dashboard2.js"></script>

<script src="{$zBasePath}assets/common/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->

<script src="{$zBasePath}assets/common/bower_components/Flot/jquery.flot.js"></script>

<script src="{$zBasePath}assets/common/bower_components/Flot/jquery.flot.resize.js"></script>

<script src="{$zBasePath}assets/common/bower_components/Flot/jquery.flot.pie.js"></script>

<script src="{$zBasePath}assets/common/bower_components/Flot/jquery.flot.categories.js"></script>

<!-- Bootstrap 4 -->
<script src="{$zBasePath}assets/common/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="{$zBasePath}assets/common/plugins/chart.js/Chart.min.js"></script>
<script src="{$zBasePath}assets/common/dist/js/adminlte.min.js"></script>
</body>
</html>