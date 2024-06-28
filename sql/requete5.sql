SELECT SQL_CALC_FOUND_ROWS *,entite_denomination as Institution,typeEntite_libelle as Secteur ,produit_trimestreId as Trimestre,produit_annee as Annee,region_libelle as Region,
SUM(societariat_nbrHomme) as NbrHomme,SUM(societariat_nbrFemme) as NbrFemme,SUM(societariat_nbrMorale) as NbrPme,SUM(societariat_groupFemme) as NbrGroupeAss,
SUM(societariat_empActifHomme) as NbrGroupeHomme,SUM(societariat_empActifFemme) as NbrGroupeFemme,SUM(societariat_empActifMorale) as empActifMorale
FROM `cnfi_produit` 
INNER JOIN `cnfi_societariat` ON societariat_produitId = produit_id
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
LEFT JOIN `cnfi_region` ON societariat_regionId = region_id
WHERE 1 %WHERE%
GROUP BY produit_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC