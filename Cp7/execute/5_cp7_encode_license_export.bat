psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp7\sql\4_cp7_encode_license_export.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp7\sql\3_cp7_users_tables_licenses.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp7\sql\4_cp7_wa_tables_by_license.sql"

echo "Exporting.."
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_wa_nct TO '..\Cp7\tables\cp7_wa_nct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_wa_ct TO '..\Cp7\tables\cp7_wa_ct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_wa_pct TO '..\Cp7\tables\cp7_wa_pct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"

