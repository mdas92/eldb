@echo off
Rscript Sun_lib.r
Rscript Sun_main_ct.r
echo "Generating CSV for converted users"
Rscript Sun_main_nct.r
echo "Generating CSV for non-converted users"
Rscript Sun_main_pct.r
echo "Generating CSV for pre-converted users"
pause