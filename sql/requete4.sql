SELECT SQL_CALC_FOUND_ROWS *,entite_denomination AS Institution,typeEntite_libelle AS Secteur,produit_trimestreId AS Trimestre,produit_annee AS Annee,
region_libelle AS Region,
information_totalEffectif as TotalEffectifs,
information_effectifFemme as PourcEffectif,
information_agentCredit as AgentsCredit,
information_pourcentCreditFemme as PourcFemme

FROM `cnfi_produit` 
INNER JOIN `cnfi_entite` ON produit_entiteId = entite_id
INNER JOIN `cnfi_typeentite` ON   typeEntite_id = entite_typeEntiteId
INNER JOIN `cnfi_zone` ON zone_produitId = produit_id
LEFT JOIN `cnfi_region` ON region_id = zone_regionId
INNER JOIN `cnfi_information` ON produitId = produit_id 
WHERE 1 %WHERE%
GROUP BY produit_id
ORDER BY produit_trimestreId ASC,produit_annee ASC,entite_denomination ASC


