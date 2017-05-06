psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp8.cp8_feature_filter_rule FROM '..\Cp8\tables\feature_filter_rule_cp8.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
