psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp9.cp9_feature_filter_rule FROM '..\Cp9\tables\feature_filter_rule_cp9.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"
