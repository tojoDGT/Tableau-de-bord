SELECT * from (	
	SELECT  rownum r__ , niv2.* from (		
		
		SELECT COUNT(*) over () found_rows,niv1.* from (
		SELECT ecriture_a_apure.pstp_libelle, ecriture_a_apure.exercice, ecriture_a_apure.entite,
					   ecriture_a_apure.numero_ecriture,ecriture_a_apure.reference_ecriture,
					   ecriture_a_apure.date_ecriture,ecriture_a_apure.libelle_ecriture,
					   ecriture_a_apure.tier_code, ecriture_a_apure.libelle_ligne,ecriture_a_apure.sens,
					   ecriture_a_apure.montant_operation, ecriture_a_apure.compte,
					   ecriture_a_apure.lecr_num, t.tier_nom,
				 ecriture_a_apure.montant_operation
			   - NVL (ecriture_apurement.mt_ap, 0) reste_a_apurer, mt_ap
		  FROM (SELECT  pc.pstp_libelle, b.ecri_exercice exercice, b.entite,
					   b.ecri_num numero_ecriture, b.ecri_ref reference_ecriture,
					   TO_CHAR(b.ecri_dt_cecriture, 'DD/MM/RRRR') date_ecriture, b.ecri_lib libelle_ecriture,
					   b.tier_code, b.lecr_reference_oper libelle_ligne, b.lecr_sens sens,
					   b.lecr_mt montant_operation, b.lecr_cpt_general compte,
					   b.lecr_num
				  FROM (SELECT * from execution%ANNEE%.T_LGECRITURE_CTRL union all SELECT * from execution%ANNEE%.T_LGECRITURE_CTRL)   b
				  ,
					   CATIA.POSTE_COMPTABLE pc,
					   (select * from CATIA.compte where exO='%ANNEE%') c--SUBSTR($P{Date_End}, 7)) c
				 WHERE  b.lecr_cpt_general = c.compte_num
					   and b.entite = '10101.100'
					   --and b.entite = $P{poste_comptable}
					   and pc.pstp_code=b.entite
					   --and pc.pstp_code=b.entite
				   AND c.compte_sens = b.lecr_sens
				   AND b.lecr_cpt_general LIKE '47%'
				   AND NVL (b.ecri_type, '99') NOT IN ('00', '08')
				   AND b.prop_code = 'ETAT'
				   AND b.ecri_dt_cecriture <
						  ADD_MONTHS
							 (TO_DATE ('01/06/%ANNEE%', 'DD/MM/RRRR'), -3)
				   AND DECODE (SUBSTR (b.lecr_cpt_general, 1, 1), '8', 'V', 'D') = 'D'
			   ) ecriture_a_apure,
			   /*
			   (SELECT   r.lecr_num lecr_num_ap, SUM (r.lec_mt_apure) mt_ap
					FROM execution%ANNEE%.T_LGECRITURE_CTRL b,
						 CENTRAL.T_r_lecr_lecr r
				   WHERE r.lec_num = b.lecr_num
					   and b.entite= '10101.100'-- $P{poste_comptable}
					   --and b.entite = $P{poste_comptable}
					 AND UPPER(b.prop_code) = 'ETAT'
					 --AND a.ecri_num = b.ecri_num
					 AND b.lecr_cpt_general LIKE '47%'
					 AND NVL (b.ecri_type, '99') NOT IN ('00', '08')
					 AND TRUNC (b.ecri_dt_cecriture) < '%ZDATE%'--$P{Date_End}
					 AND DECODE (SUBSTR (TRIM (b.lecr_cpt_general), 1, 1),
								 '8', 'V',
								 'D'
								) = 'D'

				GROUP BY r.lecr_num) */
				(SELECT   r.lecr_num lecr_num_ap, SUM (r.lec_mt_apure) mt_ap
					FROM --execution%ANNEE%.T_LGECRITURE_CTRL b,
						 CENTRAL.T_r_lecr_lecr r
				   WHERE 
						r.entite = '10101.100'--r.lec_num = b.lecr_num
					   --and b.entite= '10101.100'-- $P{poste_comptable}
					   --and b.entite = $P{poste_comptable}
					 --AND UPPER(b.prop_code) = 'ETAT'
					 --AND a.ecri_num = b.ecri_num
					 --AND b.lecr_cpt_general LIKE '47%'
					 --AND NVL (b.ecri_type, '99') NOT IN ('00', '08')
					 --AND TRUNC (b.ecri_dt_cecriture) < '%ZDATE%'--$P{Date_End}
					 --AND DECODE (SUBSTR (TRIM (b.lecr_cpt_general), 1, 1),
					 --            '8', 'V',
					 --            'D'
					 --           ) = 'D'

				GROUP BY r.lecr_num) ecriture_apurement, catia.tiers t
		 WHERE ecriture_a_apure.lecr_num = ecriture_apurement.lecr_num_ap (+)
		 and ecriture_a_apure.tier_code = t.tier_code (+)
		   AND ecriture_a_apure.montant_operation > NVL (ecriture_apurement.mt_ap, 0)
		  --AND ecriture_a_apure.montant_operation - NVL (ecriture_apurement.mt_ap, 0) = 0
		order by ecriture_a_apure.compte asc
		) niv1
		%WHERE%

	) niv2
	WHERE rownum <= %FIN%
) 
WHERE r__ > %DEBUT%