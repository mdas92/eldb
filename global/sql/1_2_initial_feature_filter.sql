--Filter out meaningless features:

\echo 'create table eldb.cp_initial_feature_filter'
create table eldb.cp_initial_feature_filter
(
  data_category text NOT NULL,
  data_name text NOT NULL,
  in_out integer
);

--Load the csv & run the query to filter 
