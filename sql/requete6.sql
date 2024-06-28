SELECT SQL_CALC_FOUND_ROWS *,entite_denomination as Institution,typeEntite_libelle as Secteur,produit_trimestreId as Trimestre,produit_annee as Annee,region_libelle as region,
SUM(societariatAssurance_nbrClient) as nbrClient,SUM(societariatAssurance_nombreHomme) as nombreHomme,SUM(societariatAssurance_nombreFemme) as nombreFemme,
SUM(autreVolumeActivite_encoursME) as encoursME,SUM(emeActivite_nbrTransactionsParPeriode) as nbrTransactionsParPeriode,
SUM(emeActivite_montantTotalTransaction) as montantTotalTransaction,SUM(autreVolumeActivite_nbrCompteEmeOuvert) as nbrCompteEmeOuvert,SUM(autreVolumeActivite_nbrCompteActif) as nbrCompteActif,
SUM(autreVolumeActivite_nbrCompteInactif) as nbrCompteInactif,SUM(autreVolumeActivite_reclammationEtOpposition) as reclammationEtOpposition

FROM `cnfi_produit` 
LEFT JOIN `cnfi_societariatassurance` ON societariatAssurance_produitId = produit_id
LEFT JOIN `cnfi_autrevolumeactivite` ON autreVolumeActivite_produitId = produit_id
LEFT JOIN `cnfi_emeactivite` ON emeActivite_produitId = produit_id
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
LEFT JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 AND typeEntite_id = 5 %WHERE%
GROUP BY produit_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC