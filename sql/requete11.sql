SELECT SQL_CALC_FOUND_ROWS *,entite_denomination AS Institution,typeEntite_libelle AS Secteur,produit_trimestreId AS trimestre,
produit_annee AS Année,region_libelle AS Region ,SUM(zone_nombre) AS ZoneNombre, produit_id AS iProduitId, region_id AS iRegionId,
SUM(activiteAssurance_nomPoliceAssurance) AS nomPoliceAssurance,
SUM(activiteAssurance_nbSouscripteur) AS nbSouscripteur,
SUM(activiteAssurance_montantCapital) AS montantCapital,
SUM(activiteAssurance_montantNbSouscripteur) AS montantNbSouscripteur,
(SUM(activiteAssurance_montantNbFemme)+ SUM(activiteAssurance_montantNbHomme) + SUM(activiteAssurance_montantNbCreancier) + 
SUM(activiteAssurance_montantNbAgriculteur) + SUM(activiteAssurance_montantNbSouscripteur) + SUM(activiteAssurance_montantNbPersMorale))
AS montantIndemnisation

FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
LEFT JOIN `cnfi_activiteassurance` ON activiteAssurance_produitId =  produit_id AND activiteAssurance_regionId = region_id
WHERE 1 AND typeEntite_id = 2 %WHERE%
GROUP BY produit_trimestreId,produit_annee,region_libelle,typeEntite_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC


