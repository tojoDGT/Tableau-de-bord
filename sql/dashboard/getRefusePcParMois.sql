SELECT  COUNT(m.MAND_DT_RJT) as NOMBRE,to_char(MAND_DT_RJT, 'MM') as MOIS
from EXECUTION%ANNEE%.ECRITURE t,EXECUTION%ANNEE%.MANDAT m WHERE t.ECRI_NUM(+) = m.ECRI_NUM
%WHERE%
AND MAND_VISA_VALIDE = 0 
GROUP BY to_char(MAND_DT_RJT, 'MM')
ORDER BY to_char(MAND_DT_RJT, 'MM') ASC