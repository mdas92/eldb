psql -d postgres -h localhost -U postgres -p 5432  -c "\COPY eldb.rename_rule FROM '.\tables\rename_rule_table.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
pause