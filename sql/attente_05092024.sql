SELECT COUNT(*) over () found_rows,norm.* from (
	SELECT ecriture_a_apure.pstp_libelle,ecriture_a_apure.pstp_code, ecriture_a_apure.exercice, ecriture_a_apure.entite,
				   ecriture_a_apure.numero_ecriture,ecriture_a_apure.reference_ecriture,
				   ecriture_a_apure.date_ecriture,ecriture_a_apure.libelle_ecriture,
				   ecriture_a_apure.tier_code, ecriture_a_apure.libelle_ligne,ecriture_a_apure.sens,
				   ecriture_a_apure.montant_operation, ecriture_a_apure.compte,
				   ecriture_a_apure.lecr_num, t.tier_nom,
			 ecriture_a_apure.montant_operation
		   - NVL (ecriture_apurement.mt_ap, 0) reste_a_apurer
	  FROM (SELECT  pc.pstp_libelle,pc.pstp_code, a.ecri_exercice exercice, a.ENTITE entite,
				   a.ecri_num numero_ecriture, a.ecri_ref reference_ecriture,
				   TO_CHAR(a.ecri_dt_cecriture, 'DD/MM/RRRR') date_ecriture, a.ecri_lib libelle_ecriture,
				   b.tier_code, b.ECRI_LIB libelle_ligne, b.lecr_sens sens,
				   b.lecr_mt montant_operation, b.lecr_cpt_general compte,
				   b.lecr_num
			  FROM EXECUTION%ANNEE%.ECRITURE a,
				   EXECUTION%ANNEE%.T_lgecriture_ctrl b,
				   CATIA.POSTE_COMPTABLE pc,
				   (select * from CATIA.compte where exo='%ANNEE%') c
			 WHERE a.ecri_num = b.ecri_num
			   AND NVL (a.ecri_valid, 9) = 1
			   -- AND a.ecri_exercice > '2012'
			   AND b.lecr_cpt_general = c.compte_num
				  -- and a.ENTITE = $P{poste_comptable} and b.entite = $P{poste_comptable}
				   and pc.pstp_code=a.ENTITE
				   and pc.pstp_code=b.entite
			   AND c.compte_sens = b.lecr_sens
			   AND b.lecr_cpt_general LIKE '47%'
			   AND NVL (a.ecri_type, '99') NOT IN ('00', '08')
			   AND a.prop_code LIKE 'ETAT'
			   AND a.ecri_dt_cecriture < ADD_MONTHS (TO_DATE ('31/12/%ANNEE%', 'DD/MM/RRRR'), -3)
			   AND DECODE (SUBSTR (b.lecr_cpt_general, 1, 1), '8', 'V', 'D') = 'D'
		   ) ecriture_a_apure,
		   (SELECT   r.lecr_num lecr_num_ap, SUM (r.lec_mt_apure) mt_ap
				FROM EXECUTION%ANNEE%.ECRITURE a,
					 EXECUTION%ANNEE%.T_lgecriture_ctrl b,
					 CENTRAL.T_r_lecr_lecr r
			   WHERE r.lec_num = b.lecr_num
				 AND a.ecri_valid = '1'
				 -- AND a.ecri_exercice > '2012'
				   -- and a.ENTITE = $P{poste_comptable}
				   -- and b.entite = $P{poste_comptable}
				 AND UPPER(a.prop_code) = 'ETAT'
				 AND a.ecri_num = b.ecri_num
				 AND b.lecr_cpt_general LIKE '47%'
				 AND NVL (a.ecri_type, '99') NOT IN ('00', '08')
				 -- AND TRUNC (a.ecri_dt_cecriture) < $P{Date_End}
				 AND DECODE (SUBSTR (TRIM (b.lecr_cpt_general), 1, 1),
							 '8', 'V',
							 'D'
							) = 'D'

			GROUP BY r.lecr_num) ecriture_apurement, catia.tiers t
	 WHERE ecriture_a_apure.lecr_num = ecriture_apurement.lecr_num_ap (+)
	 and ecriture_a_apure.tier_code = t.tier_code (+)
	   AND ecriture_a_apure.montant_operation > NVL (ecriture_apurement.mt_ap, 0)
	order by ecriture_a_apure.compte asc
	) norm
%WHERE%