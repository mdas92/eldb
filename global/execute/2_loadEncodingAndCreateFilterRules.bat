psql -h localhost -U postgres -d postgres -p 5432 -f ".\sql\5_create_encoding_rule.sql"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.workflow_encoding_rule FROM '.\tables\encoding_rule.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
pause