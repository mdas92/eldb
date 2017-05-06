\echo 'Get distinct features.'
--Create rename rule table from distinct(data_category,data_name) of cp_product_feature_facts
create table eldb.distinct_features as
(select distinct data_category,data_name from eldb.cp_product_feature_facts);


\echo 'Create Rename Rule table'

create table eldb.rename_rule
( data_category text NOT NULL,
  data_name text NOT NULL,
  data_value text NOT NULL,
  compressed_name text NOT NULL
);

--export this edit and load it back into rename_rule
\echo 'PLEASE EDIT THIS AND ADD THE RENAMED CATEGORIES BEFORE PROCEEDING'
