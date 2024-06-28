SELECT SQL_CALC_FOUND_ROWS *,entite_denomination AS Institution,typeEntite_libelle AS Secteur,region_libelle AS Region,
produit_annee AS Année, produit_trimestreId AS trimestre,SUM(zone_nombre) AS ZoneNombre, produit_id AS iProduitId, region_id AS iRegionId,

(SELECT SUM(societariat_nbrHomme) FROM `cnfi_societariat` WHERE  societariat_produitId = iProduitId AND societariat_regionId = iRegionId) AS nbrHomme,
(SELECT SUM(societariat_nbrFemme) FROM `cnfi_societariat` WHERE  societariat_produitId = iProduitId AND societariat_regionId = iRegionId) AS nbrFemme,
(SELECT SUM(societariat_nbrMorale) FROM `cnfi_societariat` WHERE  societariat_produitId = iProduitId AND societariat_regionId = iRegionId) AS nbrMorale,
(SELECT SUM(encoursActivite_nombre) FROM `cnfi_encoursactivite` WHERE encoursActivite_type = 1 AND encoursActivite_produitId = iProduitId AND encoursActivite_regionId = iRegionId) AS 
nbrTotalDepot,
(SELECT SUM(encoursActivite_montant) FROM `cnfi_encoursactivite` WHERE encoursActivite_type = 1 AND encoursActivite_produitId = iProduitId AND encoursActivite_regionId = iRegionId) AS 
montantTotalDepot,
(SELECT SUM(octroiActivite_nombre) FROM `cnfi_octroiactivite` WHERE octroiActivite_type = 1 AND octroiActivite_produitId = iProduitId AND octroiActivite_regionId = iRegionId) AS 
nbrTotalOctroi,
(SELECT SUM(octroiActivite_montant) FROM `cnfi_octroiactivite` WHERE octroiActivite_type = 1 AND octroiActivite_produitId = iProduitId AND octroiActivite_regionId = iRegionId) AS 
montantTotalOctroi,

(SELECT SUM(autreVolumeActivite_nbrCompteActif) FROM `cnfi_autrevolumeactivite` WHERE autreVolumeActivite_produitId = iProduitId AND autreVolumeActivite_regionId = iRegionId) AS 
nbrCompteME,
(SELECT SUM(autreVolumeActivite_encoursME) FROM `cnfi_autrevolumeactivite` WHERE autreVolumeActivite_produitId = iProduitId AND autreVolumeActivite_regionId = iRegionId) AS 
nbrME,
(SELECT SUM(activiteAssurance_nomPoliceAssurance) FROM `cnfi_activiteassurance`  WHERE activiteAssurance_produitId = iProduitId AND activiteAssurance_regionId = iRegionId) AS 
nbrPoliceAssurance,
(SELECT SUM(activiteAssurance_montantCapital) FROM `cnfi_activiteassurance`  WHERE activiteAssurance_produitId = iProduitId AND activiteAssurance_regionId = iRegionId) AS 
montantCapitalGaranti


FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 %WHERE%
GROUP BY produit_trimestreId,produit_annee,region_libelle,typeEntite_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC


