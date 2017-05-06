psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp9\sql\4_cp9_encode_license_export.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp9\sql\3_cp9_users_tables_licenses.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp9\sql\4_cp9_wa_tables_by_license.sql"

echo "Exporting.."
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_wa_nct TO '..\Cp9\R\cp9_wa_nct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_wa_ct TO '..\Cp9\R\cp9_wa_ct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_wa_pct TO '..\Cp9\R\cp9_wa_pct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
