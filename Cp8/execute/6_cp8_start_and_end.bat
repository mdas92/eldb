psql -h localhost -U postgres -d postgres -p 5432 -f "..\cp8\sql\5_cp8_find_start_and_end.sql"

psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_start_feature TO '..\cp8\tables\cp8_start_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_end_feature TO '..\cp8\tables\cp8_end_feature.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
