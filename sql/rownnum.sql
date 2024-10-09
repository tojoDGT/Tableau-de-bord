SELECT  COUNT(*) over () found_rows,norm.*
) norm  
%WHERE%
AND rn between %DEBUT% and %FIN%