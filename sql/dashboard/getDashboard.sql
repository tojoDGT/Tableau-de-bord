SELECT * FROM (

	select ROW_NUMBER() OVER (ORDER BY PSTP_LIBELLE ASC) AS r__,
						COUNT(*) OVER () AS found_rows,t.* from EXECUTION%ANNEE%.ECRITURE@dblcca2 t where 1=1
) niv1
WHERE r__ BETWEEN %DEBUT% AND %FIN%