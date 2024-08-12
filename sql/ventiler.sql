SELECT COUNT(*) over () found_rows,norm.* from (
select pc.PSTP_LIBELLE,pc.PSTP_CODE,ecriture.ecri_exercice exercice, ecriture.ecri_ref as reference_ecriture,ecriture.ecri_lib libelle_ecriture,
        ecriture.ecri_dt_cecriture date_ecriture,ecriture.ecri_oper_saisie operateur,
        ecriture.ECRI_MT ecriture_mt,decode (ecriture.ecri_valid,1,'VALIDE','NON VALIDE') status,
        ecriture.prop_code proprietaire,
        case when NVL (ecriture.ecri_type, 'XX') = '00' THEN 'BALANCE D'' ENTREE'
        when NVL (ecriture.ecri_type, 'XX') = '08' THEN 'FIN DE GESTION'
        when NVL (ecriture.ecri_type, '99') NOT IN
                                                                 ('00', '08') THEN 'OPERATION DE LA GESTION'
        end as type_ecriture,
        lgecriture.ECRI_LIB libelle_ligne,lgecriture.lecr_mt montant_operation,
        lgecriture.lecr_sens sens,lgecriture.lecr_cpt_general compte

              FROM EXECUTION%ANNEE%.T_lgecriture_ctrl lgecriture, EXECUTION%ANNEE%.ecriture ecriture, CATIA.POSTE_COMPTABLE pc
             WHERE lgecriture.ecri_num = ecriture.ecri_num
               AND ecriture.ecri_exercice = '%ANNEE%'
               AND ecriture.ENTITE = lgecriture.entite
               -- AND ecriture.ecri_exercice >= '2014'
               -- and ecriture.ENTITE = $P{poste_comptable}
               -- and lgecriture.entite = $P{poste_comptable}
			   and pc.pstp_code=ecriture.ENTITE
			   and pc.pstp_code=lgecriture.entite
               -- AND TO_DATE (ecriture.ecri_dt_cecriture, 'DD/MM/RRRR')
               --       BETWEEN TO_DATE ($P{Date_Start}, 'DD/MM/RRRR')
               --           AND TO_DATE ($P{Date_End}, 'DD/MM/RRRR')
               -- AND UPPER(ecriture.prop_code) LIKE 'ETAT'
				
                and lgecriture.lecr_cpt_general not in (select compte.compte_num
                from catia.compte,catia.compte_tcompte
                where compte.id = compte_tcompte.ID_COMPTE
                and compte_tcompte.ID_TCOMPTE = 3 and compte.compte_owner = '01'
                )
               AND exists (
               select 'X' from catia.compte where compte.compte_num = lgecriture.lecr_cpt_general and compte.compte_owner ='01'
		and exo='%ANNEE%'
               )
) norm
%WHERE%