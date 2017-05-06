\echo 'Create Schema'

CREATE SCHEMA eldb 

\echo 'Create tables'

CREATE TABLE eldb.cp_product_feature_facts
(
  fact_did bigserial NOT NULL,
  product_def bigserial NOT NULL,
  user_def bigserial NOT NULL, -- user_id
  session_def bigserial NOT NULL,
  license_def bigserial NOT NULL,
  data_category text NOT NULL,
  data_name text NOT NULL,
  data_value text NOT NULL,
  feature_time text NOT NULL,
  sequence_no numeric NOT NULL,
  doc_id text NOT NULL,
  touch_points text NOT NULL,
  continuous_count text NOT NULL,
  year_info text NOT NULL,
  month_info text NOT NULL,
  month_key text NOT NULL,
  insert_time timestamp without time zone DEFAULT now(),
  project_id text NOT NULL DEFAULT 'No Project'::text,
  isevent text NOT NULL DEFAULT 0,
  description text NOT NULL DEFAULT 'NO DESCRIPTION'::text
);

CREATE TABLE eldb.cp_session_dimension
(
  dimension_did serial NOT NULL,
  session_id text NOT NULL,
  session_duration numeric NOT NULL,
  session_time text NOT NULL,
  log_type text NOT NULL,
  encrypt_edsn text NOT NULL,
  machine_id text NOT NULL,
  processor_info text NOT NULL,
  num_processor text NOT NULL,
  processor_model text NOT NULL,
  processor_name text NOT NULL,
  is_prerelease text NOT NULL,
  hbreceive_time text NOT NULL,
  hbinsert_time text NOT NULL,
  exit_status text NOT NULL,
  default_browser text,
  insert_time timestamp without time zone DEFAULT now()
);




CREATE TABLE eldb.cp_user_dimension
(
  dimension_did serial NOT NULL,
  user_id text NOT NULL,
  user_language text NOT NULL,
  os_version text NOT NULL,
  country_name text NOT NULL,
  os_language text NOT NULL,
  os_name text NOT NULL,
  memory_info text NOT NULL,
  speed_info text NOT NULL,
  system_infokey text NOT NULL,
  insert_time timestamp without time zone DEFAULT now()
);



CREATE TABLE eldb.cp_product_dimension
(
  dimension_did serial NOT NULL,
  product_name text NOT NULL,
  product_family text NOT NULL,
  product_version text NOT NULL,
  product_build text NOT NULL,
  product_laungauge text NOT NULL,
  executable_version text NOT NULL,
  executable_language text NOT NULL,
  executable_build text NOT NULL,
  executable_name text NOT NULL,
  product_infokey text NOT NULL,
  insert_time timestamp without time zone DEFAULT now()
);


CREATE TABLE eldb.cp_license_dimension
(
  dimension_did serial NOT NULL,
  need_license text NOT NULL,
  license_status text NOT NULL,
  license_type text NOT NULL,
  encrypted_licensemd5 text NOT NULL,
  insert_time timestamp without time zone DEFAULT now()
);
