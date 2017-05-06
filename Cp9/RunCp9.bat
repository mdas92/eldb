call ..\Cp9\execute\1_cp9_filter.bat
call ..\Cp9\execute\2_cp9_rename.bat
call ..\Cp9\execute\3_cp9_load_filter_rule.bat

call ..\Cp9\execute\5_cp9_encode_license_export.bat

call ..\Cp9\execute\6_cp9_start_and_end.bat
pause

Rscript ..\Cp9\R\Sun_lib.r
Rscript ..\Cp9\R\Sun_main_ct.r
echo "Generating CSV for converted users"
Rscript ..\Cp9\R\Sun_main_nct.r
echo "Generating CSV for non-converted users"
Rscript ..\Cp9\R\Sun_main_pct.r
echo "Generating CSV for pre-converted users"
