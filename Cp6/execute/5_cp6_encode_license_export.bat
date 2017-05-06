psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp6\sql\4_cp6_encode_license_export.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp6\sql\3_cp6_users_tables_licenses.sql"
psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp6\sql\4_cp6_wa_tables_by_license.sql"

echo "Exporting.."
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_wa_nct TO '..\Cp6\tables\cp6_wa_nct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_wa_ct TO '..\Cp6\tables\cp6_wa_ct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_wa_pct TO '..\Cp6\tables\cp6_wa_pct.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
