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
 <div id="table_bd_processing1" class="dataTables_processing card" style="display: none;">
	<div id="overlay111">Chargement...<br>
		<div style=";text-align: center;vertical-align: middle;padding-top: 10px;">
			<img class="imageAloha" src="http://localhost/Tableau-bord/assets/images/loading.gif" width="100">
		</div>
	</div>
</div>
 <div id="table_bd_processing2" class="dataTables_processing dataTables_processing2 card" style="display: none;">
	<div id="overlay111">Chargement...<br>
		<div style=";text-align: center;vertical-align: middle;padding-top: 10px;">
			<img class="imageAloha" src="http://localhost/Tableau-bord/assets/images/loading.gif" width="100">
		</div>
	</div>
</div>
  <aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<form id="sendSearch" name="sendSearch" action="{$zBasePath}dashboard/changeCol" method="post">
			<input type="hidden" id="zReturnUrl" name="zReturnUrl" value="{$zReturnUrl}">
			<input type="hidden" id="zParam" name="zParam" value="{$zParam}">
			{if $zParam == "op_46"}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="Identifiant-ID" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-dtl.TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if VILLE|in_array:$oDataTempCol} checked="checked" {/if} value="VILLE-c.VILLE" class="mr-1" name="colonneAffiche[]" /><span>Ville</span></div>
				<div class="mb-2"><input type="checkbox" {if OBJET|in_array:$oDataTempCol} checked="checked" {/if} value="OBJET-c.OBJET" class="mr-1" name="colonneAffiche[]" /><span>Objet</span></div>
				<div class="mb-2"><input type="checkbox" {if DATE_DOSSIER|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DOSSIER-d.DATE_DOSSIER" class="mr-1" name="colonneAffiche[]" /><span>DATE DOSSIER</span></div>

				<div class="mb-2"><input type="checkbox" {if STATUS|in_array:$oDataTempCol} checked="checked" {/if} value="STATUT-STATUS" class="mr-1" name="colonneAffiche[]" /><span>STATUT</span></div>
				<div class="mb-2"><input type="checkbox" {if CATEG_DEPENSE|in_array:$oDataTempCol} checked="checked" {/if} value="CATEGORIE DEPENSE-dtl.CATEG_DEPENSE" class="mr-1" name="colonneAffiche[]" /><span>CATEGORIE DEPENSE</span></div>
				<div class="mb-2"><input type="checkbox" {if DMDVIRDATEVALID|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DE VIREMENT-dv.DMDVIRDATEVALID" class="mr-1" name="colonneAffiche[]" /><span>DATE DE VIREMENT</span></div>
				<div class="mb-2"><input type="checkbox" {if PCPAYEUR|in_array:$oDataTempCol} checked="checked" {/if} value="PCPAYEUR-PCPAYEUR" class="mr-1" name="colonneAffiche[]" /><span>PCPAYEUR</span></div>
				<div class="mb-2"><input type="checkbox" {if PCASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="PCASSIGNATAIRE-dtl.PCASSIGNATAIRE" class="mr-1" name="colonneAffiche[]" /><span>PCASSIGNATAIRE</span></div>


				<div class="mb-2"><input type="checkbox" {if PERI_EXERCICE|in_array:$oDataTempCol} checked="checked" {/if} value="EXERCICE-d.PERI_EXERCICE" class="mr-1" name="colonneAffiche[]" /><span>EXERCICE</span></div>
				<div class="mb-2"><input type="checkbox" {if DENOMINATION|in_array:$oDataTempCol} checked="checked" {/if} value="DENOMINATION-c.DENOMINATION" class="mr-1" name="colonneAffiche[]" /><span>DENOMINATION</span></div>
				<div class="mb-2"><input type="checkbox" {if PSTP_LIBELLE|in_array:$oDataTempCol} checked="checked" {/if} value="POSTE-p.PSTP_LIBELLE" class="mr-1" name="colonneAffiche[]" /><span>POSTE</span></div>
				<div class="mb-2"><input type="checkbox" {if CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="CODE TIERS-t.CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>CODE TIERS</span></div>
				<div class="mb-2"><input type="checkbox" {if MONTANT|in_array:$oDataTempCol} checked="checked" {/if} value="MONTANT-dtl.MONTANT" class="mr-1" name="colonneAffiche[]" /><span>MONTANT</span></div>
			</div>
			{elseif $zParam == "compte-virement"}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="IdentifiantNumInfo-dtl.MANDAT" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div class="mb-2"><input type="checkbox" {if PCASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="PCASSIGNATAIRE-dtl.PCASSIGNATAIRE" class="mr-1" name="colonneAffiche[]" /><span>PCASSIGNATAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if PCPAYEUR|in_array:$oDataTempCol} checked="checked" {/if} value="PCPAYEUR-dtl.PCPAYEUR" class="mr-1" name="colonneAffiche[]" /><span>PCPAYEUR</span></div>

				<div class="mb-2"><input type="checkbox" {if STATUS|in_array:$oDataTempCol} checked="checked" {/if} value="STATUT-dtl.STATUS" class="mr-1" name="colonneAffiche[]" /><span>STATUT</span></div>
				<div class="mb-2"><input type="checkbox" {if DMDVIRDATEVALID|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DE VIREMENT-DV.DMDVIRDATEVALID" class="mr-1" name="colonneAffiche[]" /><span>DATE DE VIREMENT</span></div>
				<div class="mb-2"><input type="checkbox" {if TYPE_BUDG_DEP|in_array:$oDataTempCol} checked="checked" {/if} value="TYPE BUDGET DEPENSE-dtl.TYPE_BUDG_DEP" class="mr-1" name="colonneAffiche[]" /><span>TYPE BUDGET DEPENSE</span></div>

				<div class="mb-2"><input type="checkbox" {if EXERCICE|in_array:$oDataTempCol} checked="checked" {/if} value="EXERCICE-dtl.EXERCICE" class="mr-1" name="colonneAffiche[]" /><span>EXERCICE</span></div>
				<div class="mb-2"><input type="checkbox" {if DEPENSEOBJET|in_array:$oDataTempCol} checked="checked" {/if} value="OBJET-dtl.DEPENSEOBJET" class="mr-1" name="colonneAffiche[]" /><span>OBJET</span></div>
				<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-dtl.TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if CATEG_DEPENSE|in_array:$oDataTempCol} checked="checked" {/if} value="CATEGORIE-dtl.CATEG_DEPENSE" class="mr-1" name="colonneAffiche[]" /><span>CATEGORIE DEPENSE</span></div>
				<div class="mb-2"><input type="checkbox" {if MONTANT|in_array:$oDataTempCol} checked="checked" {/if} value="MONTANT-dtl.MONTANT" class="mr-1" name="colonneAffiche[]" /><span>MONTANT</span></div>
			</div>
			{else}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="Identifiant-M.ECRI_NUM" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="IdentifiantNumInfo-M.MAND_NUM_INFO" class="mr-1" name="colonneAffiche[]" /><span>Identifiant Mandat</span></div>
				<div class="mb-2"><input type="checkbox" {if STATUT_PAIEMENT|in_array:$oDataTempCol} checked="checked" {/if} value="STATUT DE PAIEMENT-M.STATUT_PAIEMENT" class="mr-1" name="colonneAffiche[]" /><span>STATUT DE PAIEMENT</span></div>
				{*<div class="mb-2"><input type="checkbox" {if CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="CODE TIERS-CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>CODE TIERS</span></div>*}
				<div class="mb-2"><input type="checkbox" {if ECRI_REF|in_array:$oDataTempCol} checked="checked" {/if} value="Référence-E.ECRI_REF" class="mr-1" name="colonneAffiche[]" /><span>Réference</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="Code tiers-M.MAND_CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>Code tiers</span></div>
				<div class="mb-2"><input type="checkbox" {if STATUT|in_array:$oDataTempCol} checked="checked" {/if} value="Statut-M.STATUT" class="mr-1" name="colonneAffiche[]" /><span>Statut</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_LIB|in_array:$oDataTempCol} checked="checked" {/if} value="Libellé-E.ECRI_LIB" class="mr-1" name="colonneAffiche[]" /><span>Libellé</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_DT_CECRITURE|in_array:$oDataTempCol} checked="checked" {/if} value="Date-E.ECRI_DT_CECRITURE" class="mr-1" name="colonneAffiche[]" /><span>Date</span></div>
				<div class="mb-2"><input type="checkbox" {if PROP_CODE|in_array:$oDataTempCol} checked="checked" {/if} value="Propriétaire-E.PROP_CODE" class="mr-1" name="colonneAffiche[]" /><span>Propriété</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MODE_PAIE|in_array:$oDataTempCol} checked="checked" {/if} value="Mode-M.MAND_MODE_PAIE" class="mr-1" name="colonneAffiche[]" /><span>Mode de paiement</span></div>
				<div class="mb-2"><input type="checkbox" {if SOA|in_array:$oDataTempCol} checked="checked" {/if} value="SOA-M.SOA" class="mr-1" name="colonneAffiche[]" /><span>SOA</span></div>
				<div class="mb-2"><input type="checkbox" {if COMPTE|in_array:$oDataTempCol} checked="checked" {/if} value="COMPTE-M.COMPTE" class="mr-1" name="colonneAffiche[]" /><span>COMPTE</span></div>
				<div class="mb-2"><input type="checkbox" {if MISSION|in_array:$oDataTempCol} checked="checked" {/if} value="MISSION-M.MISSION" class="mr-1" name="colonneAffiche[]" /><span>MISSION</span></div>

				<div class="mb-2"><input type="checkbox" {if ASSIGNATAIRE1|in_array:$oDataTempCol} checked="checked" {/if} value="Assignataire-M.ASSIGNATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Assignataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MANDATAIRE1|in_array:$oDataTempCol} checked="checked" {/if} value="Mandataire-M.MANDATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Mandataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_VISA_TEF|in_array:$oDataTempCol} checked="checked" {/if} value="Visa TEF-M.MAND_VISA_TEF" class="mr-1" name="colonneAffiche[]" /><span>Visa TEF</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_NUM_INFO|in_array:$oDataTempCol} checked="checked" {/if} value="Numéro Info-M.MANDAT1" class="mr-1" name="colonneAffiche[]" /><span>Numéro Info</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_OBJET|in_array:$oDataTempCol} checked="checked" {/if} value="Objet du mandat-M.MAND_OBJET" class="mr-1" name="colonneAffiche[]" /><span>Objet du mandat</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_RECUP|in_array:$oDataTempCol} checked="checked" {/if} value="Date Récupération-M.MAND_DATE_RECUP" class="mr-1" name="colonneAffiche[]" /><span>Date Récupération</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_REEL_VISA|in_array:$oDataTempCol} checked="checked" {/if} value="Date réelle du Visa-M.MAND_DATE_REEL_VISA" class="mr-1" name="colonneAffiche[]" /><span>Date réelle du Visa</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MONTANT1|in_array:$oDataTempCol} checked="checked" {/if} value="Montant-M.MAND_MONTANT1" class="mr-1" name="colonneAffiche[]" /><span>Montant</span></div>
				<hr class="mb-2" />
				
			</div>
			
			{/if}
			<div style="text-align: center;"> <input type="submit" class="changerCol btn btn-info" value="Changer" autocomplete="off"></div>
			</form>
  </aside>
  <!-- /.control-sidebar -->
</div>
<style>
div.dataTables_processing {
	position: absolute;
	top: 270px;
	left: 50%!important;
	width: 200px;
	margin-left: -100px!important;
	margin-top: -26px!important;
	text-align: center;
	padding: 1em 0;
	z-index: 111111;
}

div.dataTables_processing2 {
	position: absolute;
	top: 50%!important;
	left: 54%!important;
	width: 200px;
	margin-left: -100px!important;
	margin-top: -26px!important;
	text-align: center;
	padding: 1em 0;
	z-index: 111111;
}
</style>
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
<!-- <script src="{$zBasePath}assets/common/dist/js/pages/dashboard2.js"></script> -->

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

<link rel="stylesheet" href="{$zBasePath}assets/css/formoid1/formoid-solid-blue-chart.css" type="text/css" />
<script src="{$zBasePath}assets/code/highcharts.js"></script>
<script src="{$zBasePath}assets/code/highcharts-3d.js"></script>
<script src="{$zBasePath}assets/code/modules/exporting.js"></script>
<script src="{$zBasePath}assets/code/modules/export-data.js"></script>

</body>
</html>