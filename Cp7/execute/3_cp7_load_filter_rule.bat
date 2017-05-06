psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp7.cp7_feature_filter_rule FROM '..\Cp7\tables\feature_filter_rule_cp7.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
