SELECT COUNT(*) over () found_rows,norm.* from (
select distinct bal."PSTP_LIBELLE",bal."PSTP_CODE",bal."ECRI_EXERCICE",bal."CLASSE",bal."COMPTE_NUM",bal."BAL_ENTR_D",bal."BAL_ENTR_C",bal."OPER_GEST_D",bal."OPER_GEST_C",bal."OPER_FIN_GEST_D",bal."OPER_FIN_GEST_C",bal."TOTAL_G_D",bal."TOTAL_G_C",bal."SOLDE_DEBIT",bal."SOLDE_CREDIT",bal."SENSFIN",bal."SENSOG", 
case when SUBSTR ('%ZDATE%', 1, 5) = '31/12' then (
CASE 
    WHEN (compte.compte_sens_fin_gestion = 'C')
        THEN 'CREDITEUR'
    WHEN (compte.compte_sens_fin_gestion = 'D')
        THEN 'DEBITEUR'
    ELSE 'NEUTRE'
    END)
    ELSE  (CASE 
    WHEN (compte.compte_sens = 'C')
        THEN 'CREDITEUR'
    WHEN (compte.compte_sens = 'D')
        THEN 'DEBITEUR'
    ELSE 'NEUTRE'

    END) end  AS SENS_ENCOURS,

case when SUBSTR ('%ZDATE%', 1, 5) = '31/12' then (
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
SELECT DISTINCT pstp_libelle,pstp_code,ecri_exercice, classe, p.compte_num, /* compte.id*/
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
(SELECT   pstp_libelle,pstp_code,ecri_exercice, classe, lecr_cpt_general, bal_entr_d,
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
                   pc.pstp_libelle,pc.pstp_code,ecriture.ecri_exercice, SUBSTR (TRIM (lgecriture.lecr_cpt_general),
                           1,
                           1
                          ) AS classe,
                   TRIM (lgecriture.lecr_cpt_general) AS lecr_cpt_general,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'D'
                          AND NVL (ecriture.ecri_type, 'XX') = '00'
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS bal_entr_d,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'C'
                          AND NVL (ecriture.ecri_type, 'XX') = '00'
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS bal_entr_c,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'D'
                          AND NVL (ecriture.ecri_type, '99') NOT IN
                                                                 ('00', '08')
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS mt_d,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'C'
                          AND NVL (ecriture.ecri_type, '99') NOT IN
                                                                 ('00', '08')
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS mt_c,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'D'
                          AND NVL (ecriture.ecri_type, 'XX') = '08'
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS oper_gest_d,
                   SUM
                      (CASE
                          WHEN lgecriture.lecr_sens = 'C'
                          AND NVL (ecriture.ecri_type, 'XX') = '08'
                             THEN lgecriture.lecr_mt
                          ELSE 0
                       END
                      ) AS oper_gest_c
              FROM EXECUTION%ANNEE%.T_lgecriture_ctrl lgecriture, EXECUTION%ANNEE%.ecriture ecriture, CATIA.POSTE_COMPTABLE pc
             WHERE lgecriture.ecri_num = ecriture.ecri_num
			  
               AND NVL (ecriture.ecri_valid, 9) = 1
                           -- and pc.pstp_code=ecriture.ENTITE
                           and pc.pstp_code=lgecriture.entite
               --AND to_char(nvl(ecriture.ecri_dt_cecriture, '01/01/1900'), 'DD/MM/RRRR')
                      -- BETWEEN to_date($P{Date_Start}, 'DD/MM/RRRR') AND to_date($P{Date_End}, 'DD/MM/RRRR')
               -- AND ecriture.prop_code LIKE $P{prop}
               AND DECODE (SUBSTR (TRIM (lgecriture.lecr_cpt_general), 1, 1),
                           '8', 'V',
                           'D'
                          ) = 'D'
          GROUP BY
                   pc.pstp_libelle,pc.pstp_code,ecriture.ecri_exercice, SUBSTR (TRIM (lgecriture.lecr_cpt_general), 1, 1),
                   TRIM (lgecriture.lecr_cpt_general))
ORDER BY classe, lecr_cpt_general) a, catia.compte p, catia.compte_tcompte t
where a.lecr_cpt_general = p.compte_num and t.id_compte=p.id and t.id_tcompte = '3' and p.compte_owner='01'
group by a.pstp_libelle,a.pstp_code,a.ecri_exercice, classe, p.compte_num
order by classe, compte_num
) bal, catia.compte compte
where bal.compte_num = compte.compte_num (+) AND compte_owner='01'
) norm
%WHERE%