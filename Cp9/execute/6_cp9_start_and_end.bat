psql -h localhost -U postgres -d postgres -p 5432 -f "..\cp9\sql\5_cp9_find_start_and_end.sql"

psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_start_feature TO '..\cp9\tables\cp9_start_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_end_feature TO '..\cp9\tables\cp9_end_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
