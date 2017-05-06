psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp8\sql\4_cp8_encode_license_export.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp8\sql\3_cp8_users_tables_licenses.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp8\sql\4_cp8_wa_tables_by_license.sql"

echo "Exporting.."
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_wa_nct TO '..\Cp8\tables\cp8_wa_nct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_wa_ct TO '..\Cp8\tables\cp8_wa_ct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_wa_pct TO '..\Cp8\tables\cp8_wa_pct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"

pause