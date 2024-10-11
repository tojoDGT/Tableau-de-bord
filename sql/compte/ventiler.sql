WITH LGECRITUREBAL AS (
SELECT l.*, 'BALANCE D''ENTREE' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE  entite = '10101.100' and ECRI_NUM = (
SELECT max(ecri_num) FROM execution%ANNEE%.T_LGECRITURE_CTRL l WHERE  NVL (l.ecri_type, 'XX') = '00' and l.entite = '10101.100')
union all
SELECT l.*, 'FIN DE GESTION' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE entite = '10101.100' and ECRI_NUM = (
SELECT max(ecri_num) FROM execution%ANNEE%.T_LGECRITURE_CTRL l WHERE  NVL (l.ecri_type, 'XX') = '08' and l.entite = '10101.100') 
union all
SELECT l.*, 'OPERATION DE LA GESTION' TYPE_ECRITURE  FROM execution%ANNEE%.T_LGECRITURE_CTRL@dblcca2 l WHERE entite = '10101.100'
and NVL (l.ecri_type, '99') NOT IN
                                                                 ('00', '08') 
) 

SELECT * from (	
	SELECT  rownum r__ , niv2.* from (

		SELECT COUNT(*) over () found_rows,niv1.* from (
		select pc.pstp_libelle,pc.PSTP_CODE, ecriture.ecri_exercice exercice, ecriture.ecri_ref as reference_ecriture,ecriture.lecr_cpt_general compte,ecriture.ecri_lib libelle_ecriture,
				ecriture.ecri_dt_cecriture date_ecriture,--ecriture.ecri_oper_saisie operateur,
				--ecriture.ecri_mt_debit ecriture_mt,decode (ecriture.ecri_valid,1,'VALIDE','NON VALIDE') status,
				ecriture.prop_code proprietaire,
				type_ecriture,
				ecriture.ecri_lib libelle_ligne,ecriture.lecr_mt montant_operation,
				ecriture.lecr_sens sens--distinct ecriture.ecri_ref,ecri_num

					  FROM LGECRITUREBAL ecriture, CATIA.POSTE_COMPTABLE pc
					 WHERE --ecriture.exercice = '%ANNEE%'
					   ecriture.entite = pc.PSTP_CODE
					   --AND NVL (ecriture.ecri_type, 'XX') = '08'	
					   /*AND TO_DATE (ecriture.ecri_dt_cecriture, 'DD/MM/RRRR')
							  BETWEEN TO_DATE ($P{Date_Start}, 'DD/MM/RRRR')
								  AND TO_DATE ($P{Date_End}, 'DD/MM/RRRR')*/
					   AND 
					   ecriture.ecri_dt_cecriture
							  BETWEEN TO_DATE ('01/01/%ANNEE%', 'DD/MM/RRRR')
								  AND TO_DATE ('31/12/%ANNEE%', 'DD/MM/RRRR')
					   AND ecriture.prop_code = 'ETAT'
					   AND  SUBSTR (ecriture.LECR_CPT_GENERAL, 1, 1) != '8'
						and ecriture.lecr_cpt_general not in (select compte.compte_num
						from catia.compte,catia.compte_tcompte
						where compte.id = compte_tcompte.ID_COMPTE
						and compte_tcompte.ID_TCOMPTE = 3 and compte.compte_owner = '01'
						)
					   AND exists (
					   select 'X' from catia.compte where compte.compte_num = ecriture.lecr_cpt_general and compte.compte_owner ='01'
					and exo='%ANNEE%'--$P{Exercice}
					   )
		) niv1
		%WHERE%
	) niv2
	WHERE rownum <= %FIN%
) 
WHERE r__ > %DEBUT%