SELECT SQL_CALC_FOUND_ROWS *,entite_denomination as Institution,typeEntite_libelle as Secteur,produit_trimestreId as Trimestre,produit_annee as Annee,region_libelle as Region,
SUM(societariatAssurance_nombreHomme) as nombreHomme,SUM(societariatAssurance_nombreFemme) as nombreFemme,SUM(societariatAssurance_personneMorale) as personneMorale,
SUM(activiteAssurance_nomPoliceAssurance) as nomPoliceAssurance,SUM(activiteAssurance_montantCapital) as montantCapital,
SUM(activiteAssurance_nbSouscripteur) as nbSouscripteur ,SUM(activiteAssurance_montantNbSouscripteur) as montantNbSouscripteur

FROM `cnfi_produit` 
LEFT JOIN `cnfi_societariatassurance` ON societariatAssurance_produitId = produit_id
LEFT JOIN `cnfi_activiteassurance` ON activiteAssurance_produitId = produit_id
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 AND typeEntite_id = 2 %WHERE%
GROUP BY produit_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC