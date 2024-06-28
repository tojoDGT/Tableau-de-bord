SELECT SQL_CALC_FOUND_ROWS *,entite_denomination,typeEntite_libelle,produit_trimestreId,produit_annee,region_libelle,
SUM(societariatAssurance_nombreHomme),SUM(societariatAssurance_nombreFemme),SUM(societariatAssurance_personneMorale),
SUM(activiteAssurance_nomPoliceAssurance),SUM(activiteAssurance_montantCapital),
SUM(activiteAssurance_nbSouscripteur),SUM(activiteAssurance_montantNbSouscripteur)
FROM `cnfi_produit` 
LEFT JOIN `cnfi_societariatassurance` ON societariatAssurance_produitId = produit_id
LEFT JOIN `cnfi_activiteassurance` ON activiteAssurance_produitId = produit_id
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 %WHERE%
GROUP BY produit_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC