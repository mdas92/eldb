\echo 'Version Filtering'

create schema eldb_cp6;
create schema eldb_cp7;
create schema eldb_cp8;
create schema eldb_cp9;

\echo 'Filtering Cp9..'
select fact_did,product_def,user_def,session_def,license_def,data_category,data_name,data_value,feature_time,sequence_no,continuous_count,month_key,project_id,isevent,product_version
into eldb_cp9.cp9_product_feature_facts
from (eldb.cp_product_feature_facts left join eldb.cp_product_dimension on eldb.cp_product_feature_facts.product_def=eldb.cp_product_dimension.dimension_did)
where product_version in ('9.0.0','9.0.1','9.0.2','9.1.1');

\echo 'Filtering Cp8..'
select fact_did,product_def,user_def,session_def,license_def,data_category,data_name,data_value,feature_time,sequence_no,continuous_count,month_key,project_id,isevent,product_version
into eldb_cp7.cp7_product_feature_facts
from (eldb.cp_product_feature_facts left join eldb.cp_product_dimension on eldb.cp_product_feature_facts.product_def=eldb.cp_product_dimension.dimension_did)
where product_version in ('7.0.0','7.0.1');

\echo 'Filtering Cp7..'
select fact_did,product_def,user_def,session_def,license_def,data_category,data_name,data_value,feature_time,sequence_no,continuous_count,month_key,project_id,isevent,product_version
into eldb_cp6.cp6_product_feature_facts
from (eldb.cp_product_feature_facts left join eldb.cp_product_dimension on eldb.cp_product_feature_facts.product_def=eldb.cp_product_dimension.dimension_did)
where product_version in ('6.0.0','6.0.1','6.0.2','6.1.0');

\echo 'Filtering Cp6..'
select fact_did,product_def,user_def,session_def,license_def,data_category,data_name,data_value,feature_time,sequence_no,continuous_count,month_key,project_id,isevent,product_version
into eldb_cp8.cp8_product_feature_facts
from (eldb.cp_product_feature_facts left join eldb.cp_product_dimension on eldb.cp_product_feature_facts.product_def=eldb.cp_product_dimension.dimension_did)
where product_version in ('8.0.0','8.0.1','8.0.2','8.0.3');

\echo 'Filtering Completed.'
--total rows in cp_product_feature_facts : 94875449
--Cp9: 91610091
--cp8:  2345437
--cp7:   531393
--cp6:   386600

--Total versioning rows : 94,8733,521
--useless rows (cp10) : 1928