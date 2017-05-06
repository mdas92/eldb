
\echo 'filtering cp8..'

--cp8
create table eldb_cp8.cp8_optimized_feature_facts as
(select fact_did,product_def,user_def,session_def,license_def,pff.data_category,pff.data_name,data_value,feature_time,sequence_no,continuous_count,month_key,product_version
from eldb_cp8.cp8_product_feature_facts pff,eldb.cp_initial_feature_filter fo 
where pff.data_category=fo.data_category and pff.data_name=fo.data_name and fo.in_out = 1);

\echo 'Done filtering'
