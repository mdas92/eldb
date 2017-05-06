psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb_cp6.cp6_feature_filter_rule FROM '..\Cp6\tables\feature_filter_rule_cp6.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
