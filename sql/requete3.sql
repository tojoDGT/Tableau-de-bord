SELECT SQL_CALC_FOUND_ROWS *,entite_denomination as Institution,typeEntite_libelle as Secteur,produit_trimestreId as Trimestre,produit_annee as Annee,region_libelle as Region,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_nombre) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=3 AND octroiActivite_typeCreditId=1),0)
	ELSE ''
END AS nbrFemme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_nombre) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=3 AND octroiActivite_typeCreditId=2),0)
	ELSE ''
END AS nbrhomme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_nombre) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=2 AND octroiActivite_typeCreditId=1),0)
	ELSE ''
END AS nbrPME,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_montant) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=3 AND octroiActivite_typeCreditId=1),0)
	ELSE ''
END AS montantFemme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_montant) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=3 AND octroiActivite_typeCreditId=2),0)
	ELSE ''
END AS montanthomme,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_montant) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=2 AND octroiActivite_typeCreditId=1),0)
	ELSE ''
END AS montantPME,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_nombre) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=2),0)
	ELSE ''
END AS nombretotal,

CASE 
	WHEN entite_categorie=2  THEN IFNULL((SELECT SUM(octroiActivite_montant) FROM `cnfi_octroiactivite` WHERE octroiActivite_produitId=produit_id 
	AND octroiActivite_type=2),0)
	ELSE ''
END AS montanttotal


FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
WHERE 1 %WHERE%
HAVING (nbrFemme >0 OR nbrhomme >0 OR nbrPME >0 OR montantFemme > 0 OR montanthomme > 0 OR montantPME > 0)
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC
