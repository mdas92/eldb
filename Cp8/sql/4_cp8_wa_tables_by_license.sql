       
\echo  '--based on license separate export into three tables'       
        
        --cp8_wa_nct.csv
      create table eldb_cp8.cp8_wa_nct as 
      select *
          from eldb_cp8.cp8_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp8.cp8_nonconverted_trial_users); 
       
        --cp8_wa_ct.csv
        create table eldb_cp8.cp8_wa_ct as 
   select *
          from eldb_cp8.cp8_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp8.cp8_converted_trial_users); 
       
        --cp8_wa_pct.csv
        create table eldb_cp8.cp8_wa_pct as 
   select *
          from eldb_cp8.cp8_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp8.cp8_preconversion_trial_users); --29013
       

       --Do for all versions.
       
\echo 'Done.'       
        
--This is the final table "cpX_workflow_analysis" which is sent to the R code.(In R code, we will remove duplicates)
