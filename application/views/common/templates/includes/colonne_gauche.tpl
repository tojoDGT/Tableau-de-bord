<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
  <!-- Add icons to the links using the .nav-icon class
	   with font-awesome or any other icon font library -->
 <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/general" class="nav-link {if $oData.iSousMenuActifId==1}active{/if}">
		  <i class="nav-icon fas fa-tachometer-alt"></i>
		  <p>Tableau de bord</p>
		</a>
  </li>
  <li class="nav-item menu-open">
	<a href="#" class="nav-link {if $oData.iMenuActifId==2}active{/if}">
	  <i class="nav-icon fas fa-columns"></i>
	  <p>
		Dossiers
		<i class="right fas fa-angle-left"></i>
	  </p>
	</a>
	<ul class="nav nav-treeview">
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/situation-des-dossiers" class="nav-link {if $oData.iSousMenuActifId==2}active{/if}">
		  <i class="far fa-circle nav-icon text-red"></i>
		  <p>Situation des dossiers</p>
		</a>
	  </li>
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/situation-des-op" class="nav-link {if $oData.iSousMenuActifId==3}active{/if}">
		  <i class="far fa-circle nav-icon text-blue"></i>
		  <p>OP / régularisations</p>
		</a>
	  </li>
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/performance-des-pc" class="nav-link {if $oData.iSousMenuActifId==4}active{/if}">
		  <i class="far fa-circle nav-icon text-yellow"></i>
		  <p>Performance des PC</p>
		</a>
	  </li>
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/performance-des-pc" class="nav-link {if $oData.iSousMenuActifId==44}active{/if}">
		  <i class="far fa-circle nav-icon text-green"></i>
		  <p>Performance des agents</p>
		</a>
	  </li>
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/performance-des-pc" class="nav-link {if $oData.iSousMenuActifId==44}active{/if}">
		  <i class="far fa-circle nav-icon text-purple"></i>
		  <p>Qualité compte</p>
		</a>
	  </li>
	  <li class="nav-item">
		<a href="{$zBasePath}dashboard/stat/performance-des-pc" class="nav-link {if $oData.iSousMenuActifId==44}active{/if}">
		  <i class="far fa-circle nav-icon text-red"></i>
		  <p>Gestion de trésorerie</p>
		</a>
	  </li>
	</ul>
  </li>
  <!--<li class="nav-item">
		<a href="{$zBasePath}/Login/logout" class="nav-link">
		  <i class="nav-icon fas fa-copy"></i>
		  <p>Rôles et privilièges</p>
		</a>
   </li>-->
    <li class="nav-item">
		<a href="{$zBasePath}/utilisateur/liste" class="nav-link {if $oData.iMenuActifId==33}active{/if}">
		  <i class="nav-icon fas fa-copy"></i>
		  <p>Les utilisateurs</p>
		</a>
   </li>  
   <li class="nav-item">
		<a href="{$zBasePath}/Login/logout" class="nav-link">
		  <i class="nav-icon fas fa-sign-out-alt"></i>
		  <p>Déconnexion</p>
		</a>
   </li>
  
</ul>
