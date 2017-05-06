psql -h localhost -U postgres -d postgres -p 5432 -f "..\Cp7\sql\5_cp7_find_start_and_end.sql"

psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_start_feature TO '..\Cp7\tables\cp7_start_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_end_feature TO '..\Cp7\tables\cp7_end_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
