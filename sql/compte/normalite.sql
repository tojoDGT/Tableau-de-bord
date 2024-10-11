WITH LGECRITUREBAL AS (
SELECT l.*, 'BALANCE D''ENTREE' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE  entite = '10101.100' and ECRI_NUM = (
SELECT max(ecri_num) FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE  NVL (l.ecri_type, 'XX') = '00' and l.entite = '10101.100')
union all
SELECT l.*, 'FIN DE GESTION' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL l WHERE entite = '10101.100' and ECRI_NUM = (
SELECT max(ecri_num) FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE  NVL (l.ecri_type, 'XX') = '08' and l.entite = '10101.100') 
union all
SELECT l.*, 'OPERATION DE LA GESTION' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE entite = '10101.100'
and NVL (l.ecri_type, '99') NOT IN
                                                                 ('00', '08') 
) 

SELECT * from (	
	SELECT  rownum r__ , niv2.* from (

		SELECT COUNT(*) over () found_rows,niv1.* from (
		select distinct bal.*, case when SUBSTR ('%ZDATE%', 1, 5) = '31/12' then (
		CASE
					WHEN (bal.sensFin = 'DEBITEUR' AND compte.compte_sens = 'C')
					   THEN 'SOLDE ANORMAL'
					WHEN (bal.sensFin = 'CREDITEUR' AND compte.compte_sens = 'D')
					   THEN 'SOLDE ANORMAL'
					WHEN (compte.compte_num is null and (bal.solde_debit <> 0 or solde_credit <> 0))
					THEN 'COMPTE INEXISTANT'
					WHEN (compte.compte_num is null and bal.solde_debit=0 and solde_credit = 0)
					THEN 'COMPTE REDRESSE'
					WHEN (bal.sensFin = 'DEBITEUR' AND compte.compte_sens = 'N')
					   THEN 'SOLDE ANORMAL'
					WHEN (bal.sensFin = 'CREDITEUR' AND compte.compte_sens = 'N')
					   THEN 'SOLDE ANORMAL'
					ELSE 'SOLDE NORMAL'
				 END)
				 else  (CASE
					WHEN (bal.sensFin = 'DEBITEUR' AND compte.compte_sens_fin_gestion = 'C')
					   THEN 'SOLDE ANORMAL'
					WHEN (bal.sensFin = 'CREDITEUR' AND compte.compte_sens_fin_gestion = 'D')
					   THEN 'SOLDE ANORMAL'
					WHEN (compte.compte_num is null and (bal.solde_debit <> 0 or solde_credit <> 0))
					THEN 'COMPTE INEXISTANT'
					WHEN (compte.compte_num is null and bal.solde_debit=0 and solde_credit = 0)
					THEN 'COMPTE REDRESSE'
					WHEN (bal.sensFin = 'DEBITEUR' AND compte.compte_sens_fin_gestion = 'N')
					   THEN 'SOLDE ANORMAL'
					WHEN (bal.sensFin = 'CREDITEUR' AND compte.compte_sens_fin_gestion = 'N')
					   THEN 'SOLDE ANORMAL'
					ELSE 'SOLDE NORMAL'
				 END) end AS conclusion
		from (
		SELECT DISTINCT pstp_libelle,pstp_code,EXERCICE, classe, p.compte_num, /* compte.id*/
				sum(bal_entr_d) as bal_entr_d, sum(bal_entr_c) as bal_entr_c, sum(oper_gest_d) as oper_gest_d, sum(oper_gest_c) as oper_gest_c,
				sum (oper_fin_gest_d) as oper_fin_gest_d, sum(oper_fin_gest_c) as oper_fin_gest_c,
				sum(total_g_d) as total_g_d, sum(total_g_c) as total_g_c, sum(solde_debit) as solde_debit, sum(solde_credit) as solde_credit,
				CASE
							  WHEN   (sum(bal_entr_d) + sum(oper_gest_d) + sum (oper_fin_gest_d))
								   - (sum(bal_entr_c) + sum(oper_gest_c) + sum (oper_fin_gest_c)) > 0
								 THEN 'DEBITEUR'
							  WHEN   (sum(bal_entr_d) + sum(oper_gest_d) + sum (oper_fin_gest_d))
								   - (sum(bal_entr_c) + sum(oper_gest_c) + sum (oper_fin_gest_c)) < 0
								 THEN 'CREDITEUR'
							  WHEN   (sum(bal_entr_d) + sum(oper_gest_d) + sum (oper_fin_gest_d))
								   - (sum(bal_entr_c) + sum(oper_gest_c) + sum (oper_fin_gest_c)) = 0
								 THEN 'N'
						   END AS sensFin,
						   CASE
							  WHEN    sum (oper_fin_gest_d)
								   -  sum (oper_fin_gest_c) > 0
								 THEN 'DEBITEUR'
							  WHEN   sum (oper_fin_gest_d)
								   - sum (oper_fin_gest_c) < 0
								 THEN 'CREDITEUR'
							  WHEN   sum (oper_fin_gest_d)
								   - sum (oper_fin_gest_c) = 0
								 THEN 'N'
						   END AS sensOG


		FROM
		(SELECT   pstp_libelle,pstp_code,EXERCICE,classe, lecr_cpt_general, bal_entr_d,
				 bal_entr_c, mt_d oper_gest_d, mt_c oper_gest_c,
				 oper_gest_d oper_fin_gest_d, oper_gest_c oper_fin_gest_c,
				 bal_entr_d + mt_d + oper_gest_d AS total_g_d,
				 bal_entr_c + mt_c + oper_gest_c AS total_g_c,
				 CASE
					WHEN (  (bal_entr_d + mt_d + oper_gest_d)
						  - (bal_entr_c + mt_c + oper_gest_c)
						 ) >= 0
					   THEN (  (bal_entr_d + mt_d + oper_gest_d)
							 - (bal_entr_c + mt_c + oper_gest_c)
							)
					ELSE 0
				 END AS solde_debit,
				 CASE
					WHEN (  (bal_entr_d + mt_d + oper_gest_d)
						  - (bal_entr_c + mt_c + oper_gest_c)
						 ) <= 0
					   THEN (  (bal_entr_c + mt_c + oper_gest_c)
							 - (bal_entr_d + mt_d + oper_gest_d)
							)
					ELSE 0
				 END AS solde_credit
			FROM (SELECT
						   pc.pstp_libelle,pc.pstp_code,lgecriture.EXERCICE, SUBSTR (TRIM (lgecriture.lecr_cpt_general),
								   1,
								   1
								  ) AS classe,
						   TRIM (lgecriture.lecr_cpt_general) AS lecr_cpt_general,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'D'
								  AND NVL (lgecriture.ecri_type, 'XX') = '00'
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS bal_entr_d,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'C'
								  AND NVL (lgecriture.ecri_type, 'XX') = '00'
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS bal_entr_c,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'D'
								  AND NVL (lgecriture.ecri_type, '99') NOT IN
																		 ('00', '08')
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS mt_d,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'C'
								  AND NVL (lgecriture.ecri_type, '99') NOT IN
																		 ('00', '08')
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS mt_c,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'D'
								  AND NVL (lgecriture.ecri_type, 'XX') = '08'
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS oper_gest_d,
						   SUM
							  (CASE
								  WHEN lgecriture.lecr_sens = 'C'
								  AND NVL (lgecriture.ecri_type, 'XX') = '08'
									 THEN lgecriture.lecr_mt
								  ELSE 0
							   END
							  ) AS oper_gest_c
					  FROM LGECRITUREBAL lgecriture, CATIA.POSTE_COMPTABLE pc
					 WHERE lgecriture.ecri_exercice = '%ANNEE%'--$P{Exercice}
					   --AND ecriture.ecri_exercice >='2014'
					   --and ecriture.ecri_ent = $P{poste_comptable}
					   and lgecriture.entite = '10101.100'
					   and  lgecriture.entite = pc.pstp_code
					   AND to_char(nvl(lgecriture.ecri_dt_cecriture, '01/01/1900'), 'DD/MM/RRRR')
							  BETWEEN to_date('01/01/%ANNEE%', 'DD/MM/RRRR') AND to_date('%ZDATE%', 'DD/MM/RRRR')
					   AND lgecriture.prop_code = 'ETAT' --LIKE $P{prop}
					   AND DECODE (SUBSTR (TRIM (lgecriture.lecr_cpt_general), 1, 1),
								   '8', 'V',
								   'D'
								  ) = 'D'
				  GROUP BY
						   pc.pstp_libelle,pc.pstp_code,lgecriture.EXERCICE, SUBSTR (TRIM (lgecriture.lecr_cpt_general), 1, 1),
						   TRIM (lgecriture.lecr_cpt_general))
		ORDER BY classe, lecr_cpt_general) a, catia.compte p, catia.compte_tcompte t
		where a.lecr_cpt_general = p.compte_num and t.id_compte=p.id and t.id_tcompte = '3' and p.compte_owner='01'
		group by a.pstp_libelle,a.pstp_code,a.EXERCICE, classe, p.compte_num
		--order by classe, compte_num
		) bal, catia.compte compte
		where bal.compte_num = compte.compte_num AND compte_owner='01' and exo='%ANNEE%'
		order by bal.compte_num
		) niv1
		%WHERE%

	) niv2
		 WHERE rownum <= %FIN%
) 
WHERE r__ > %DEBUT%