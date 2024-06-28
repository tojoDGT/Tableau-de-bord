SELECT SQL_CALC_FOUND_ROWS *,entite_denomination AS Institution,typeEntite_libelle AS Secteur,produit_trimestreId AS trimestre,
produit_annee AS Année,region_libelle AS Region ,SUM(zone_nombre) AS ZoneNombre, produit_id AS iProduitId, region_id AS iRegionId,
SUM(autreVolumeActivite_nbrCompteEmeOuvert) AS nbrCompteOuvertSurLaPeriode,
SUM(emeActivite_nbrTransactionsParPeriode) AS nbrTransactionsParPeriode,
SUM(emeActivite_montantTotalTransaction) AS montantTotalTransaction,

SUM(autreVolumeActivite_nbrCompteActif) AS nbrCompteActif,
SUM(autreVolumeActivite_nbrCompteInactif) AS nbrCompteInactif,
SUM(autreVolumeActivite_reclammationEtOpposition) AS nbrReclammationEtOpposition,
SUM(autreVolumeActivite_encoursME) AS nbrEncoursME



FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
LEFT JOIN cnfi_autrevolumeactivite ON autreVolumeActivite_produitId =  produit_id AND autreVolumeActivite_regionId = region_id
LEFT JOIN `cnfi_emeactivite` ON emeActivite_produitId = produit_id
WHERE 1 AND typeEntite_id = 5 %WHERE%
GROUP BY produit_trimestreId,produit_annee,region_libelle,typeEntite_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC


