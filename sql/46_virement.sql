/* Formatted on 03/09/2024 09:19:28 (QP5 v5.374) */
/*
SELECT *
  FROM nonepn.titre                       t,  
       nonepn.dossier                     d,
       nonepn.ctiers_rga                  cais,
       chqop.t_chqop_tresor@dblcca2       a2,
       virement.ctrlvir_view_dtl@dblccad  sit
 WHERE     t.dossier_id = d.id
       AND t.compte_tiers = d.compte_tiers
       AND d.compte_tiers = cais.compte_tiers
       AND d.mode_reglement = 'VB'
       AND a2.num_chq(+) = cais.cais_code || d.id
       AND a2.CAISSE(+) = cais.cais_code
       AND t.numero_titre = sit.titrenumero(+)
       --and t.compte_tiers='46-21-7-A27-10101'
       AND d.peri_exercice = '2024';*/

/* Formatted on 27/08/2024 10:03:02 (QP5 v5.374) */
WITH
    VIREMENT
    AS
        (SELECT DISTINCT dtl.PCASSIGNATAIRE /*,

                 CASE
                     WHEN dtl.soa IS NULL
                     THEN
                         SUBSTR (titrenumero,
                                 0,
                                 REGEXP_INSTR (titrenumero, '-|\.') - 1)
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '00'
                     THEN
                         'BUDGET GENERAL'
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '01'
                     THEN
                         'BUDGET ANNEXE'
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '02'
                     THEN
                         'COMPTE PARTICULIER DU TRESOR'
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '20'
                     THEN
                         'REGION'
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '40'
                     THEN
                         'COMMUNE'
                     WHEN SUBSTR (dtl.SOA, 0, 2) = '90'
                     THEN
                         'EPN'
                     ELSE
                         'AUTRES'
                 END                       type_budg_dep*/
                                           ,
                         dtl.PCPAYEUR,
                         -- dtl.ENTITECODE,
                         dtl.EXERCICE,
                         dtl.SOA,
                         dtl.INDICATEUR            programme,
                         dtl.COMMUNE,
                         dtl.ACTIVITE,
                         dtl.CATEGORIE,
                         dtl.FINANCEMENT,
                         dtl.CPTPCDEP,
                         dtl.COMPTE,
                         dtl.DATE_VISA,
                         dtl.INFONUMERO            MANDAT,
                         dtl.TITRENUMERO,
                         --dtl.TITRENUMERO,
                         --DTL.TIER_CODE,
                         ---DTL.TITULAIRE,
                         --dtl.MONTANT,
                         ---dtl.DEPENSEOBJET,
                         ---dtl.BQBENEFNUMCOMPTE      NUMERO_COMPTE,
                         --dtl.DATERECUPDOSSIER,
                         --DTL.NOTEDTLID,
                         --nt.NOTEID,
                         nt.NOTEREF,
                         nt.NOTEMT,
                         nt.NOTEELEMENT,
                         NT.NOTESTATUS,
                         NT.NOTEDATEEDIT,
                         NT.NOTEDATEVALID,
                         --NTST.NOTESTATUSCODE,
                         NTST.NOTESTATUSLIBELLE    STATUS,
                         -- DV.DMDVIRID,
                         --DV.DMDVIRTYPEENTITEID,
                         DV.DMDVIRREF,
                         dv.DMDVIRMT,
                         --DV.DMDVIRSTATUS,
                         DV.DMDVIRDATEEDIT,
                         DV.DMDVIRDATEVALID,
                         --dv.DMDVIRUSEREDIT,
                         --dv.DMDVIRUSERVALID,
                         --OV.OVID,
                         OV.OVEXO,
                         OV.OVREF,
                         OV.OVPCPAYEUR,
                         --OV.OVTYPEVIRCODE,
                         --OV.OVSTATUS,
                         OV.OVDATEEDIT,
                         OV.OVDATEVALID            DATEEXECUTIONOV,
                         --nt.noteuseredit,
                         --nt.noteuservalid,
                         --ov.ovuseredit,
                         --ov.ovuservalid,
                         --ov.PCCPTBQID,
                         CASE
                             WHEN (                    -- Charges du personnel
                                      (    SUBSTR (dtl.compte, 1, 2) = '60'
                                       AND    SUBSTR (dtl.soa, 1, 1)
                                           || SUBSTR (dtl.soa, 7, 1) !=
                                           '92'
                                       AND    SUBSTR (dtl.soa, 1, 1)
                                           || SUBSTR (dtl.soa, 7, 1) !=
                                           '93')
                                   OR (    SUBSTR (dtl.compte, 0, 3) = '641' -- EPIC
                                       AND (      SUBSTR (dtl.soa, 1, 1)
                                               || SUBSTR (dtl.soa, 7, 1) =
                                               '92'
                                            OR    SUBSTR (dtl.soa, 1, 1)
                                               || SUBSTR (dtl.soa, 7, 1) =
                                               '93'))
                                   -- Cession / Pension
                                   OR (dtl.compte = '6521' --AND SUBSTR (CPTPCDEP, 0, 4) = '5818'
                                                 --AND dtl.TIER_CODE LIKE 'R%'
                                      )
                                   OR (dtl.compte = '6522')
                                   -- Subvention commune
                                   OR (    CPTPCDEP = '405121'
                                       AND (   dtl.compte = '65141'
                                            OR dtl.compte = '65142'
                                            OR dtl.compte = '65143'
                                            OR dtl.compte = '65144'))
                                   -- Intérêt de la dette
                                   OR (SUBSTR (dtl.compte, 0, 4) = '6611')
                                   -- Téléphone, mobile, Internet
                                   OR (   SUBSTR (dtl.compte, 0, 4) = '6262'
                                       OR SUBSTR (dtl.compte, 0, 4) = '6263'
                                       OR SUBSTR (dtl.compte, 0, 4) = '6264')
                                   -- Location d'immeubles
                                   OR (   SUBSTR (dtl.compte, 0, 4) = '6271'
                                       OR SUBSTR (dtl.compte, 0, 4) = '6272'
                                       OR SUBSTR (dtl.compte, 0, 4) = '6273')
                                   -- RFM
                                   OR (    (   (    SUBSTR (dtl.compte, 0, 4) =
                                                    '6561'
                                                AND (       SUBSTR (dtl.soa,
                                                                    1,
                                                                    1)
                                                         || SUBSTR (dtl.soa,
                                                                    7,
                                                                    1) !=
                                                         '92'
                                                     AND    SUBSTR (dtl.soa,
                                                                    1,
                                                                    1)
                                                         || SUBSTR (dtl.soa,
                                                                    7,
                                                                    1) !=
                                                         '93'))
                                            OR (    SUBSTR (dtl.compte, 0, 3) =
                                                    '647'
                                                AND (      SUBSTR (dtl.soa,
                                                                   1,
                                                                   1)
                                                        || SUBSTR (dtl.soa,
                                                                   7,
                                                                   1) =
                                                        '92'
                                                     OR    SUBSTR (dtl.soa,
                                                                   1,
                                                                   1)
                                                        || SUBSTR (dtl.soa,
                                                                   7,
                                                                   1) !=
                                                        '93')))
                                       AND SUBSTR (TIER_CODE, 1, 1) IN ('F',
                                                                        'R',
                                                                        'G',
                                                                        'O',
                                                                        'C',
                                                                        'D'))
                                   -- Indemnités Chef FKT
                                   OR (    dtl.PCASSIGNATAIRE = '10101.413'
                                       AND dtl.INFONUMERO LIKE 'MEFKT%')
                                   -- CIAD
                                   OR (    (   SUBSTR (dtl.SOA, 1, 7) =
                                               '46-14-7'
                                            OR SUBSTR (dtl.SOA, 1, 7) =
                                               '46-14-D')
                                       AND dtl.CPTPCDEP = '46778'
                                       AND dtl.soa != '46-14-7-A26-10101')
                                   --OR ( compte ='6561' and substr(TIER_CODE,1,1) in ('F','R','G','O','C','D') AND SUBSTR (soa,1,1) IN ('0','2','4'))--RFM PHYSIQUE
                                   --OR (dtl.SOA LIKE '00-16%' AND dtl.compte = '6138') --GADRA KITAY
                                   OR (    dtl.PCASSIGNATAIRE = '10101.100'
                                       AND dtl.INFONUMERO LIKE 'SPECL-%') --SPECL
                                   --OR (dtl.MONTANT <= 5000000)              --MONTANT <= 5000000
                                   --OR (dtl.exercice = '2022')

                                   -- ACFCV
                                   OR (PCASSIGNATAIRE = '10101.500')
                                   -- ACCTDP
                                   OR (PCASSIGNATAIRE = '10101.000')
                                   -- REGION
                                   OR (dtl.SOA LIKE '20-1%')
                                   -- Produits alimentaires | Gaz | Autres combustibles | Frais de déplacement intérieur et extérieur
                                   OR (dtl.compte = '6125')
                                   OR (dtl.compte = '6132')
                                   OR (dtl.compte = '6138')
                                   OR (dtl.compte = '6231')
                                   OR (dtl.compte = '6232')
                                   -- Frais postaux et location boîte postale | Services bancaires et assimilés
                                   OR (dtl.compte = '6261')
                                   OR (dtl.compte = '6266')
                                   OR (dtl.compte = '6285')
                                   -- Bourses à Madagascar | Secours
                                   OR (dtl.compte = '6531')
                                   OR (dtl.compte = '6533')
                                   OR (dtl.compte = '6562')
                                   -- Consignations financières ou judiciaires
                                   OR (dtl.CPTPCDEP = '46212')
                                   -- OR (dtl.CPTPCDEP = '46213')
                                   -- Recettes à repartir aux collectivités | ADC CENI | Dépenses de PP à virer par PP
                                   OR (dtl.CPTPCDEP = '4787188')
                                   OR (SUBSTR (dtl.CPTPCDEP, 1, 5) = '46771')
                                   OR (dtl.CPTPCDEP = '4786133')
                                   -- Revirement
                                   OR (    SUBSTR (infonumero, -1) = 'R'
                                       AND SUBSTR (titrenumero, -1) = 'R'))
                             THEN
                                 'DEPENSE OBLIGATOIRE'
                             WHEN EXISTS
                                      (SELECT 1
                                         FROM retour.T_AUTORIS_DTL_GBL@situation
                                              tr
                                        WHERE dtl.INFONUMERO =
                                              tr.MAND_NUM_INFO)
                             THEN
                                 'DEPENSE AUTORISEE'
                             ELSE
                                 'DEPENSE'
                         END                       AS CATEG_DEPENSE
           FROM VIREMENT.CV_NOTEDTL          dtl,
                VIREMENT.CV_NOTE             nt,
                VIREMENT.CV_NOTESTATUS       ntst,
                VIREMENT.CV_DEMANDEVIREMENT  dv,
                VIREMENT.CV_ORDREVIREMENT    ov
          WHERE     1 = 1
                AND DTL.EXERCICE >= '2023'
                AND ntst.NOTESTATUSID = NT.NOTESTATUS
                AND (NT.NOTESTATUS <> -2 OR NT.NOTESTATUS <> 6)
                --AND dtl.INFONUMERO like 'OP%'
                --AND TITRENUMERO NOT LIKE 'TTR%'
                AND DTL.NOTEID = nt.NOTEID
                AND NT.DMDVIRID = DV.DMDVIRID(+)
                AND NT.OVID = OV.OVID(+))
SELECT %COLUMN%
  FROM nonepn.titre                       t,
       nonepn.dossier                     d,
       ctiers.compte_tiers                c,
       CTIERS.TIERS                       tt,
       nonepn.ctiers_rga                  cais,
       ctiers.compte_tiers ti,
       catia.poste_comptable@dblccad      p--, chqop.t_chqop_tresor@dblcca2 a2
        ,virement                                  
       --,virement.ctrlvir_view_dtl@dblccad  v
 WHERE     t.dossier_id = d.id
    AND d.compte_tiers = ti.id_ct
       AND t.compte_tiers = d.compte_tiers
       AND c.id_ct = d.compte_tiers
       AND tt.code_tiers = t.code_tiers
       AND p.pstp_code = c.comptable_gestionnaire
       AND d.compte_tiers = cais.compte_tiers
       AND d.mode_reglement = 'VB'
       AND d.compte_tiers NOT IN ('46-14-7-A26-10101', '46-14-7-A25-10101')
       AND d.peri_exercice >= '2023'
       AND valid = '1'
       AND t.numero_titre = virement.titrenumero (+)
--and a2.CAISSE = cais.cais_code 
--and a2.num_chq = cais.cais_code||d.id
--and not exists (select 1 from virement.ctrlvir_view_dtl@dblccad where titrenumero=t.numero_titre)
--and not exists (select 1 from virement.vir_autorise@dblccad where infonumero=t.numero_titre) 

%WHERE%