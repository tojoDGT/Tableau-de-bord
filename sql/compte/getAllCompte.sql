select distinct compte_num,compte_lib from COMPTE p
 WHERE compte_num IN (SELECT distinct lecr_cpt_general from EXECUTION%ANNEE%.lgecriture)
 AND p.compte_owner='01' 
%WHERE%
 GROUP BY compte_num,compte_lib
ORDER BY compte_num