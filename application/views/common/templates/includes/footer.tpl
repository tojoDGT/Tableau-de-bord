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
			<input type="hidden" id="zReturnUrl" name="zReturnUrl" value="{$zReturnUrl}">
			<input type="hidden" id="zParam" name="zParam" value="{$zParam}">
			{if $zParam == "op_46"}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="Identifiant-ID" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if VILLE|in_array:$oDataTempCol} checked="checked" {/if} value="VILLE-VILLE" class="mr-1" name="colonneAffiche[]" /><span>Ville</span></div>
				<div class="mb-2"><input type="checkbox" {if OBJET|in_array:$oDataTempCol} checked="checked" {/if} value="OBJET-OBJET" class="mr-1" name="colonneAffiche[]" /><span>Objet</span></div>
				<div class="mb-2"><input type="checkbox" {if DATE_DOSSIER|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DOSSIER-DATE_DOSSIER" class="mr-1" name="colonneAffiche[]" /><span>DATE DOSSIER</span></div>

				<div class="mb-2"><input type="checkbox" {if STATUS|in_array:$oDataTempCol} checked="checked" {/if} value="STATUT-STATUS" class="mr-1" name="colonneAffiche[]" /><span>STATUT</span></div>
				<div class="mb-2"><input type="checkbox" {if CATEG_DEPENSE|in_array:$oDataTempCol} checked="checked" {/if} value="CATEGORIE DEPENSE-CATEG_DEPENSE" class="mr-1" name="colonneAffiche[]" /><span>CATEGORIE DEPENSE</span></div>
				<div class="mb-2"><input type="checkbox" {if DMDVIRDATEVALID|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DE VIREMENT-DMDVIRDATEVALID" class="mr-1" name="colonneAffiche[]" /><span>DATE DE VIREMENT</span></div>
				<div class="mb-2"><input type="checkbox" {if PCPAYEUR|in_array:$oDataTempCol} checked="checked" {/if} value="PCPAYEUR-PCPAYEUR" class="mr-1" name="colonneAffiche[]" /><span>PCPAYEUR</span></div>
				<div class="mb-2"><input type="checkbox" {if PCASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="PCASSIGNATAIRE-PCASSIGNATAIRE" class="mr-1" name="colonneAffiche[]" /><span>PCASSIGNATAIRE</span></div>


				<div class="mb-2"><input type="checkbox" {if PERI_EXERCICE|in_array:$oDataTempCol} checked="checked" {/if} value="EXERCICE-PERI_EXERCICE" class="mr-1" name="colonneAffiche[]" /><span>EXERCICE</span></div>
				<div class="mb-2"><input type="checkbox" {if DENOMINATION|in_array:$oDataTempCol} checked="checked" {/if} value="DENOMINATION-DENOMINATION" class="mr-1" name="colonneAffiche[]" /><span>DENOMINATION</span></div>
				<div class="mb-2"><input type="checkbox" {if PSTP_LIBELLE|in_array:$oDataTempCol} checked="checked" {/if} value="POSTE-PSTP_LIBELLE" class="mr-1" name="colonneAffiche[]" /><span>POSTE</span></div>
				<div class="mb-2"><input type="checkbox" {if CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="CODE TIERS-CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>CODE TIERS</span></div>
				<div class="mb-2"><input type="checkbox" {if MONTANT|in_array:$oDataTempCol} checked="checked" {/if} value="MONTANT-MONTANT" class="mr-1" name="colonneAffiche[]" /><span>MONTANT</span></div>
			</div>
			{elseif $zParam == "compte-virement"}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="IdentifiantNumInfo-MANDAT" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div class="mb-2"><input type="checkbox" {if PCASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="PCASSIGNATAIRE-PCASSIGNATAIRE" class="mr-1" name="colonneAffiche[]" /><span>PCASSIGNATAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if PCPAYEUR|in_array:$oDataTempCol} checked="checked" {/if} value="PCPAYEUR-PCPAYEUR" class="mr-1" name="colonneAffiche[]" /><span>PCPAYEUR</span></div>

				<div class="mb-2"><input type="checkbox" {if STATUS|in_array:$oDataTempCol} checked="checked" {/if} value="STATUT-STATUS" class="mr-1" name="colonneAffiche[]" /><span>STATUT</span></div>
				<div class="mb-2"><input type="checkbox" {if DMDVIRDATEVALID|in_array:$oDataTempCol} checked="checked" {/if} value="DATE DE VIREMENT-DMDVIRDATEVALID" class="mr-1" name="colonneAffiche[]" /><span>DATE DE VIREMENT</span></div>
				<div class="mb-2"><input type="checkbox" {if TYPE_BUDG_DEP|in_array:$oDataTempCol} checked="checked" {/if} value="TYPE BUDGET DEPENSE-TYPE_BUDG_DEP" class="mr-1" name="colonneAffiche[]" /><span>TYPE BUDGET DEPENSE</span></div>

				<div class="mb-2"><input type="checkbox" {if EXERCICE|in_array:$oDataTempCol} checked="checked" {/if} value="EXERCICE-EXERCICE" class="mr-1" name="colonneAffiche[]" /><span>EXERCICE</span></div>
				<div class="mb-2"><input type="checkbox" {if DEPENSEOBJET|in_array:$oDataTempCol} checked="checked" {/if} value="OBJET-DEPENSEOBJET" class="mr-1" name="colonneAffiche[]" /><span>OBJET</span></div>
				<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if CATEG_DEPENSE|in_array:$oDataTempCol} checked="checked" {/if} value="CATEGORIE-CATEG_DEPENSE" class="mr-1" name="colonneAffiche[]" /><span>CATEGORIE DEPENSE</span></div>
				<div class="mb-2"><input type="checkbox" {if MONTANT|in_array:$oDataTempCol} checked="checked" {/if} value="MONTANT-MONTANT" class="mr-1" name="colonneAffiche[]" /><span>MONTANT</span></div>
			</div>
			{else}
			<div class="p-3 control-sidebar-content" style="">
				<h5>COLONNE A AFFICHER</h5>
				<hr class="mb-2" />
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="Identifiant-ECRI_NUM" class="mr-1" name="colonneAffiche[]" /><span>Identifiant</span></div>
				<div style="display:none;" class="mb-2"><input type="checkbox" checked="checked" value="IdentifiantNumInfo-MAND_NUM_INFO" class="mr-1" name="colonneAffiche[]" /><span>Identifiant Mandat</span></div>
				{*<div class="mb-2"><input type="checkbox" {if TITULAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="TITULAIRE-TITULAIRE" class="mr-1" name="colonneAffiche[]" /><span>TITULAIRE</span></div>
				<div class="mb-2"><input type="checkbox" {if CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="CODE TIERS-CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>CODE TIERS</span></div>*}
				<div class="mb-2"><input type="checkbox" {if ECRI_REF|in_array:$oDataTempCol} checked="checked" {/if} value="Référence-ECRI_REF" class="mr-1" name="colonneAffiche[]" /><span>Réference</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_CODE_TIERS|in_array:$oDataTempCol} checked="checked" {/if} value="Code tiers-MAND_CODE_TIERS" class="mr-1" name="colonneAffiche[]" /><span>Code tiers</span></div>
				<div class="mb-2"><input type="checkbox" {if STATUT|in_array:$oDataTempCol} checked="checked" {/if} value="Statut-STATUT" class="mr-1" name="colonneAffiche[]" /><span>Statut</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_LIB|in_array:$oDataTempCol} checked="checked" {/if} value="Libellé-ECRI_LIB" class="mr-1" name="colonneAffiche[]" /><span>Libellé</span></div>
				<div class="mb-2"><input type="checkbox" {if ECRI_DT_CECRITURE|in_array:$oDataTempCol} checked="checked" {/if} value="Date-ECRI_DT_CECRITURE" class="mr-1" name="colonneAffiche[]" /><span>Date</span></div>
				<div class="mb-2"><input type="checkbox" {if PROP_CODE|in_array:$oDataTempCol} checked="checked" {/if} value="Propriétaire-PROP_CODE" class="mr-1" name="colonneAffiche[]" /><span>Propriété</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MODE_PAIE|in_array:$oDataTempCol} checked="checked" {/if} value="Mode-MAND_MODE_PAIE" class="mr-1" name="colonneAffiche[]" /><span>Mode de paiement</span></div>
				<div class="mb-2"><input type="checkbox" {if SOA|in_array:$oDataTempCol} checked="checked" {/if} value="SOA-SOA" class="mr-1" name="colonneAffiche[]" /><span>SOA</span></div>
				<div class="mb-2"><input type="checkbox" {if COMPTE|in_array:$oDataTempCol} checked="checked" {/if} value="COMPTE-COMPTE" class="mr-1" name="colonneAffiche[]" /><span>COMPTE</span></div>
				<div class="mb-2"><input type="checkbox" {if MISSION|in_array:$oDataTempCol} checked="checked" {/if} value="MISSION-MISSION" class="mr-1" name="colonneAffiche[]" /><span>MISSION</span></div>

				<div class="mb-2"><input type="checkbox" {if ASSIGNATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="Assignataire-ASSIGNATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Assignataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MANDATAIRE|in_array:$oDataTempCol} checked="checked" {/if} value="Mandataire-MANDATAIRE1" class="mr-1" name="colonneAffiche[]" /><span>Mandataire</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_VISA_TEF|in_array:$oDataTempCol} checked="checked" {/if} value="Visa TEF-MAND_VISA_TEF" class="mr-1" name="colonneAffiche[]" /><span>Visa TEF</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_NUM_INFO|in_array:$oDataTempCol} checked="checked" {/if} value="Numéro Info-MANDAT1" class="mr-1" name="colonneAffiche[]" /><span>Numéro Info</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_OBJET|in_array:$oDataTempCol} checked="checked" {/if} value="Objet du mandat-MAND_OBJET" class="mr-1" name="colonneAffiche[]" /><span>Objet du mandat</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_RECUP|in_array:$oDataTempCol} checked="checked" {/if} value="Date Récupération-MAND_DATE_RECUP" class="mr-1" name="colonneAffiche[]" /><span>Date Récupération</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_DATE_REEL_VISA|in_array:$oDataTempCol} checked="checked" {/if} value="Date réelle du Visa-MAND_DATE_REEL_VISA" class="mr-1" name="colonneAffiche[]" /><span>Date réelle du Visa</span></div>
				<div class="mb-2"><input type="checkbox" {if MAND_MONTANT1|in_array:$oDataTempCol} checked="checked" {/if} value="Montant-MAND_MONTANT1" class="mr-1" name="colonneAffiche[]" /><span>Montant</span></div>
				<hr class="mb-2" />
				
			</div>
			
			{/if}
			<div style="text-align: center;"> <input type="submit" class="changerCol btn btn-info" value="Changer" autocomplete="off"></div>
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
</body>
</html>