psql -h localhost -U postgres -d postgres -p 5432 -f ".\sql\1_1_extract_cp_data.sql"
pause
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_product_feature_facts FROM '.\data\Captivate_data\Captivate_data\cp_product_feature_facts.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
::psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_agg_feature_facts FROM '.\data\Captivate_data\Captivate_data\cp_agg_feature_facts.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
::psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_agg_product_feature_fact_vector_score FROM '.\data\Captivate_data\Captivate_data\cp_agg_product_feature_fact_vector_score.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_product_dimension FROM '.\data\Captivate_data\Captivate_data\cp_product_dimension.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_session_dimension FROM '.\data\Captivate_data\Captivate_data\cp_session_dimension.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_user_dimension FROM '.\data\Captivate_data\Captivate_data\cp_user_dimension.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.cp_license_dimension FROM '.\data\Captivate_data\Captivate_data\cp_license_dimension.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
pause

::Loaded the raw data 
echo "\nClick anywhere to proceed"
pause
psql -h localhost -U postgres -d postgres -p 5432 -f ".\sql\1_2_initial_feature_filter.sql"
psql -d postgres -h localhost -U postgres -p 5432  -c "\COPY eldb.cp_initial_feature_filter FROM '.\tables\Feature_Optimizer_Table.csv' DELIMITER ',' CSV ENCODING 'UTF8';"
::removed meaningless features 
pause
psql -h localhost -U postgres -d postgres -p 5432 -f ".\sql\1_3_version_filter.sql"
::version filtering
pause
psql -h localhost -U postgres -d postgres -p 5432 -f ".\sql\1_4_create_rename_table.sql"
::created a rename table for renaming process
pause
psql -h localhost -U postgres -d postgres -p 5432  -c "\COPY eldb.distinct_features TO '.\tables\new_rename_rule_table.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"
::exported distinct_features in order to manually edit Rename Table "..\global\tables\rename_rule_table.csv"
echo "We are already packaging a Rename Rule Table. If you wish to edit and use the new one, please change the file name in the next step"
pause
