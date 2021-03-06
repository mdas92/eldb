\echo '--Add Event Code column to the tables for each version'

   alter table eldb_cp9.cp9_features_renamed add event_code text;
        update eldb_cp9.cp9_features_renamed set event_code = encoded_string from eldb.workflow_encoding_rule 
        where column_renamed=event_name;
        
\echo '--create a new table with ordered sessions for each version'
--Create table eldb_cpX.cpX_ordered_sessions as (select * from eldb_cpX.cpX_features_renamed order by session_def,sequence_no);
    
        create table eldb_cp9.cp9_ordered_sessions as (select * from eldb_cp9.cp9_features_renamed order by session_def,sequence_no); --55424059 rows affected


\echo '--Add License Data'
    
    alter table eldb_cp9.cp9_ordered_sessions add status_license text NOT NULL default 'None';
    alter table eldb_cp9.cp9_ordered_sessions add type_license text NOT NULL default 'None';
    
    update eldb_cp9.cp9_ordered_sessions
    set status_license=license_status, type_license=license_type 
    from eldb.cp_license_dimension x 
    where license_def=x.dimension_did;

	
 \echo '--filter out the features to use before workflow analysis'


        create table eldb_cp9.cp9_ordered_sessions_filtered as
            ( select * from eldb_cp9.cp9_ordered_sessions s,eldb_cp9.cp9_feature_filter_rule f
              where f.encoded_string = s.event_code
              and in_out_50 = 1
            );
      

\echo '--create event workflow tables (with consecutive duplicates) and add a launch entry in case of cp9 only'

        create table eldb_cp9.cp9_workflow_analysis_all as 
        ( select user_def,session_def,concat('launch,',string_agg((event_code),',')) as event_list
          from eldb_cp9.cp9_ordered_sessions
         group by user_def,session_def
         );

        
         
\echo '--delete the workflows which are less than two levels (they are meaningless)'

    create table eldb_cp9.cp9_workflow_analysis_all_refined as
         (select user_def,session_def,event_list from eldb_cp9.cp9_workflow_analysis_all
           where 
               ( SELECT count(*)
                    FROM regexp_matches(event_list, ',', 'g')
                           ) > 1
               );   
     