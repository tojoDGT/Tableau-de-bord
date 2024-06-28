{include_php file=$zHeader}
{include_php file=$zLeft}


    <nav class="user-menu">
      <a href="javascript:;" class="main-menu-access">
      <i class="icon-proton-logo"></i>
      <i class="icon-reorder"></i>
      </a>
    </nav>
    <div class="main-grid">
      <div class="agile-grids"> 
        <div class="banner">
          <h2>
            <a href="{$zBasePath}accueil/index">Accueil</a>
            <i class="fa fa-angle-right"></i>
          </h2>
        </div>
        <div class="asked">

        <div id="flash-container"> 
                <div class="row">&nbsp;</div>       
                <div align="center">
                  <h2>Liste des formations<hr style="width: 410px; border-color: #00BCD4; margin-top: 5px; border-width: 2px 0px 0px; margin-bottom: 10px;"></h2>
                </div> 
                <br>

              <div align="center">
                <a class="subnav-text" href="{$zBasePath}offre/liste_offre">Offres locales </a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}offre/liste_bourse">Bourses</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}offre/liste_concours">Concours</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}offre/liste_formation_payante">Formations payantes</a>
              </div>
              <br>
              <div align="center">
                <a class="subnav-text" href="{$zBasePath}reporting/liste_programme_formation">Programme de formation</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}reporting/liste_rapport_formation">Rapports de formation</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}reporting/liste_autre_rapport">Autres formations</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}reporting/liste_base_donnee">Bases de données</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}reporting/liste_album">Album</a>
              </div>
              <br>
              <div align="center">
                <a class="subnav-text" href="{$zBasePath}lien_utile/liste_texte_reference">Texte de reférences</a>
                <b style="font-size: 22px">&nbsp; | &nbsp;</b>
                <a class="subnav-text" href="{$zBasePath}lien_utile/liste_document_point_focaux">Documents points focaux</a>
              </div>
              <br>
              <div align="center">
                <a class="subnav-text" href="{$zBasePath}info_region/liste_info_region">Infos Regions</a>
              </div>
              <br><br>
        </div>
    </div>
    
  </section>
  
<br>
{include_php file=$zFooter}

</body>
