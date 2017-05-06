psql -h localhost -U postgres -d postgres -p 5432 -f "..\cp6\sql\5_cp6_find_start_and_end.sql"

psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_start_feature TO '..\cp6\tables\cp6_start_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_end_feature TO '..\cp6\tables\cp6_end_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
