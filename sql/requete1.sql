SELECT SQL_CALC_FOUND_ROWS *,entite_denomination AS Institution,typeEntite_libelle AS Secteur,produit_trimestreId AS trimestre,produit_annee AS Année,
region_libelle AS Region,
district_libelle AS District,
zone_fokontany AS Fokontany,commune_commune AS Commune,
CASE 
	WHEN typeEntite_id=2  THEN (SELECT 
	(CASE WHEN libelle="Agence centrale" OR libelle="Agence centrale" THEN "Agence" ELSE libelle END)
	libelle 
	FROM `cnfi_typezoneassurance` AS tz WHERE tz.id = zone_typeId)
	
	WHEN typeEntite_id=4  THEN "Agence Cnaps"
	WHEN typeEntite_id=5  THEN (SELECT 
	(CASE WHEN libelle="Agents Marchands" OR libelle="Agents Purs" THEN "Agent Détaillant" ELSE libelle END)
	libelle 
	FROM `cnfi_typezoneeme` AS tz WHERE tz.id = zone_typeId)
	
	WHEN typeEntite_id=7  THEN (SELECT 
	(CASE WHEN libelle="DAB" THEN "GAB" ELSE libelle END)
	libelle 
	
	FROM `cnfi_typezoneposte` AS tz WHERE tz.id = zone_typeId)
	ELSE (SELECT libelle FROM `cnfi_typezone` AS tz WHERE tz.id = zone_typeId)
END AS zType,

zone_nombreCompteMonnaie as zoneNombreCompteMonnaie,zone_nombreCompteActif as zoneNombreActif,zone_nombre as ZoneNombre
FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
LEFT JOIN `cnfi_district` ON zone_districtId = district_id 
LEFT JOIN `cnfi_commune` ON zone_communeId = commune_id
WHERE 1 %WHERE%
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC


