SELECT SQL_CALC_FOUND_ROWS *,entite_denomination as institution,typeEntite_libelle as secteur,produit_trimestreId as trimestre,produit_annee as annee,region_libelle as region,
CASE 
	WHEN entite_categorie=1  THEN 'IMF de crédit'
	WHEN entite_categorie=2  THEN 'IMF de crédit et epargne'
	ELSE ''
END AS zType,


CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_nombre) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=3 AND encoursActivite_typeCreditId=1),0)
	ELSE ''
END AS nbrDepotFemme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_nombre) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=3 AND encoursActivite_typeCreditId=2),0)
	ELSE ''
END AS nbrCompteDepotHomme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_nombre) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=2 AND encoursActivite_typeCreditId=1),0)
	ELSE ''
END AS nbrComptePME,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_montant) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=3 AND encoursActivite_typeCreditId=1),0)
	ELSE ''
END AS MontantDepotFemme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_montant) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=3 AND encoursActivite_typeCreditId=2),0)
	ELSE ''
END AS MontantDepotHomme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_montant) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=2 AND encoursActivite_typeCreditId=1),0)
	ELSE ''
END AS MontantDepotPme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_nombre) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=2),0)
	ELSE ''
END AS NbrTotalDepot,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(encoursActivite_montant) FROM `cnfi_encoursactivite` WHERE encoursActivite_produitId=produit_id 
	AND encoursActivite_type=2),0)
	ELSE ''
END AS MontantTotalDepot


FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 %WHERE%
HAVING (nbrDepotFemme >0 OR nbrCompteDepotHomme >0 OR nbrComptePME >0 OR MontantDepotFemme > 0 OR MontantDepotHomme > 0 OR NbrTotalDepot > 0)
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC