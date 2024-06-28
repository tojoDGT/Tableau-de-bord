<ul class="sidebar-menu" data-widget="tree">
 <li class="{if $oData.iFormationId|in_array:$toInstitution}active menu-open{/if} treeview">
  <a href="#">
	<i class="fa fa-user"></i> Gestion identifications <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	<li {if $oData.iMenuActifId==1}class="active"{/if}><a href="{$zBasePath}entite/liste/imf"><i class="fa fa-circle-o text-red"></i>Les institutions IMF</a></li>
	<li {if $oData.iMenuActifId==2}class="active"{/if}><a href="{$zBasePath}entite/liste/assurance"><i class="fa fa-circle-o text-blue"></i>Les institutions Assurances</a></li>
	<li {if $oData.iMenuActifId==3}class="active"{/if}><a href="{$zBasePath}entite/liste/banque"><i class="fa fa-circle-o text-yellow"></i>Les institutions Banques</a></li>
	<li {if $oData.iMenuActifId==4}class="active"{/if}><a href="{$zBasePath}entite/liste/cnaps"><i class="fa fa-circle-o text-green"></i>Cnaps</a></li>
	<!--<li {if $oData.iMenuActifId==6}class="active"{/if}><a href="{$zBasePath}entite/liste/cem"><i class="fa fa-circle-o text-purple"></i>CEM</a></li>-->
	<li {if $oData.iMenuActifId==7}class="active"{/if}><a href="{$zBasePath}entite/liste/poste"><i class="fa fa-circle-o text-maroon"></i>Paositra malagasy</a></li>
	<li {if $oData.iMenuActifId==5}class="active"{/if}><a href="{$zBasePath}entite/liste/eme"><i class="fa fa-circle-o"></i>Les institutions EME</a></li>
  </ul>
</li>
<li class="{if $oData.iProduit|in_array:$toProduit}active menu-open{/if} treeview">
  <a href="#">
	<i class="fa fa-th"></i> Gestion des canevas <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	<li {if $oData.iMenuActifId==1}class="active"{/if}><a href="{$zBasePath}produit/liste/imf"><i class="fa fa-circle-o text-red"></i>Les canevas IMF</a></li>
	<li {if $oData.iMenuActifId==2}class="active"{/if}><a href="{$zBasePath}produit/liste/assurance"><i class="fa fa-circle-o text-blue"></i>Les canevas Assurances</a></li>
	<li {if $oData.iMenuActifId==3}class="active"{/if}><a href="{$zBasePath}produit/liste/banque"><i class="fa fa-circle-o text-yellow"></i>les canevas Banques</a></li>
	<li {if $oData.iMenuActifId==4}class="active"{/if}><a href="{$zBasePath}produit/liste/cnaps"><i class="fa fa-circle-o text-green"></i> Les canevas Cnaps</a></li>
	<!--<li {if $oData.iMenuActifId==6}class="active"{/if}><a href="{$zBasePath}produit/liste/cem"><i class="fa fa-circle-o text-purple"></i> Les canevas CEM</a></li>-->
	<li {if $oData.iMenuActifId==7}class="active"{/if}><a href="{$zBasePath}produit/liste/poste"><i class="fa fa-circle-o text-orange"></i> Paositra malagasy</a></li>
	<li {if $oData.iMenuActifId==5}class="active"{/if}><a href="{$zBasePath}produit/liste/eme"><i class="fa fa-circle-o"></i> Les canevas EME</a></li>
  </ul>
</li>
<!--<li {if $oData.iMenuActifId==-24}class="active"{/if}><a href="{$zBasePath}dashboard/accueil"><i class="fa fa-dashboard"></i> <span>Tableau de bord</span></a></li>-->
<li class="{if $oData.iStat|in_array:$toStat}active menu-open{/if} treeview">
  <a href="#">
	<i class="fa fa-dashboard"></i> Tableau de Bord et stat <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	<li {if $oData.iMenuActifId==104}class="active"{/if}><a href="{$zBasePath}dashboard/accueil"><i class="fa fa-circle-o text-red"></i>Tableau de bord</a></li>
	<li {if $oData.iMenuActifId==105}class="active"{/if}><a href="{$zBasePath}dashboard/affiche"><i class="fa fa-circle-o text-blue"></i>Statistiques</a></li>
	<li {if $oData.iMenuActifId==106}class="active"{/if}><a href="{$zBasePath}dashboard/exportOta"><i class="fa fa-circle-o text-yellow"></i>Export Dynamique</a></li>
  </ul>
</li>
<li class="{if $oData.iParametreId|in_array:$toMenuOta}active menu-open{/if} treeview">
  <a href="#">
	<i class="fa fa-dashboard"></i> Export OTA <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	{foreach from=$toExportOta item=oExportOta}
	   <li {if $oData.iMenuActifId==$oExportOta.menuOta_activation}class="active"{/if}><a href="{$zBasePath}menuota/liste/{$oExportOta.menuOta_zhashUrl}"><i class="fa fa-circle-o {$oExportOta.menuOta_couleur}"></i> {$oExportOta.menuOta_nom}</a></li>
    {/foreach}
  </ul>
</li>


<li class="{if $oData.iParametreId|in_array:$toMenuCommuneInfos}active menu-open{/if}  treeview">
  <a href="#">
	<i class="fa fa-building-o"></i> Gestion des communes <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	<li {if $oData.iMenuActifId==-25}class="active"{/if}><a href="{$zBasePath}commune/liste/urbaine"><i class="fa fa-circle-o text-green"></i> Commune Urbaine</a></li>
	<li {if $oData.iMenuActifId==-26}class="active"{/if}><a href="{$zBasePath}commune/liste/rurale"><i class="fa fa-circle-o text-purple"></i> Commune Rurale</a></li>
  </ul>
</li>

<li class="{if $oData.iParametreId|in_array:$toMenuZone}active menu-open{/if}  treeview">
  <a href="#">
	<i class="fa fa-gears"></i> Gestion type de zone <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	       <li {if $oData.iMenuActifId==-31}class="active"{/if} ><a href="{$zBasePath}parametre/liste/type-de-zone"><i class="fa fa-circle-o text-blue"></i> Zone IMF</a></li>
		   <li {if $oData.iMenuActifId==-33}class="active"{/if}><a href="{$zBasePath}parametre/liste/type-de-zone-assurance"><i class="fa fa-circle-o text-green"></i> Zone Assurance</a></li>
		   <li {if $oData.iMenuActifId==-37}class="active"{/if} ><a href="{$zBasePath}parametre/liste/type-de-zone-cnaps"><i class="fa fa-circle-o text-red"></i> Zone CNAPS</a></li>
    	   <li {if $oData.iMenuActifId==-38}class="active"{/if} ><a href="{$zBasePath}parametre/liste/type-de-zone-cem"><i class="fa fa-circle-o text-yellow"></i> Zone CEM</a></li>
    	   <li {if $oData.iMenuActifId==-39}class="active"{/if} ><a href="{$zBasePath}parametre/liste/type-de-zone-poste"><i class="fa fa-circle-o text-purple"></i> Zone Poste</a></li>
		   <li {if $oData.iMenuActifId==-41}class="active"{/if} ><a href="{$zBasePath}parametre/liste/type-de-zone-eme"><i class="fa fa-circle-o text-red"></i> Zone EME</a></li>
  </ul>
</li>

<li class="{if $oData.iParametreId|in_array:$toMenuParaInfos}active menu-open{/if}  treeview">
  <a href="#">
	<i class="fa fa-gears"></i> Autres paramètres <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	{foreach from=$toParametre item=oParametre}
	   {if $oParametre.parametre_affiche==1}
	   <li {if $oData.iMenuActifId==$oParametre.parametre_activation}class="active"{/if}><a href="{$zBasePath}parametre/liste/{$oParametre.parametre_hash}"><i class="fa fa-circle-o {$oParametre.parametre_color}"></i> {$oParametre.parametre_nom}</a></li>
	   {/if}
    {/foreach}
  </ul>
</li>
{if $oSession.privilege=='superadmin'}
<li class="{if $oData.iAccueil|in_array:$toMenuContenu}active menu-open{/if}  treeview">
  <a href="#">
	<i class="fa fa-gears"></i> Gestion des contenus <span></span>
	<span class="pull-right-container">
	  <i class="fa fa-angle-left pull-right"></i>
	</span>
  </a>
  <ul class="treeview-menu">
	       <li {if $oData.iMenuActifId==-100}class="active"{/if} ><a href="{$zBasePath}slide/liste"><i class="fa fa-circle-o text-blue"></i> Gestion Accueil</a></li>
		   <li {if $oData.iMenuActifId==-104}class="active"{/if} ><a href="{$zBasePath}contact/liste"><i class="fa fa-circle-o text-red"></i> Contact</a></li>
		   <li {if $oData.iMenuActifId==-101}class="active"{/if}><a href="{$zBasePath}qsn/liste"><i class="fa fa-circle-o text-green"></i> Gestion QSN</a></li>
		   <li {if $oData.iMenuActifId==-102}class="active"{/if} ><a href="{$zBasePath}equipe/liste"><i class="fa fa-circle-o text-red"></i> Gestion notre equipe</a></li>
    	   <li {if $oData.iMenuActifId==-103}class="active"{/if} ><a href="{$zBasePath}mission/liste"><i class="fa fa-circle-o text-yellow"></i> Gestion nos missions</a></li>
  </ul>
</li>
{/if}
<li><a href="{$zBasePath}/Login/logout"><i class="fa fa-sign-out"></i> <span>Déconnexion</span></a></li>
</ul>