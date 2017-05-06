@echo off
call .\execute\1_loadDataAndFilterVersion.bat

echo "If you wish to use the existing Rename Rule, please process. If not, manually edit the Rename Rule table and then proceed."
pause

call .\execute\1_loadRenameTable.bat
call .\execute\2_loadEncodingAndCreateFilterRules.bat

call 2_Choice.bat
