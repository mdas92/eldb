       
\echo  '--based on license separate export into three tables'       
        
        --cp9_wa_nct.csv
      create table eldb_cp9.cp9_wa_nct as 
      select *
          from eldb_cp9.cp9_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp9.cp9_nonconverted_trial_users); --185999
       
        --cp9_wa_ct.csv
        create table eldb_cp9.cp9_wa_ct as 
   select *
          from eldb_cp9.cp9_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp9.cp9_converted_trial_users); --96422
       
        --cp9_wa_pct.csv
        create table eldb_cp9.cp9_wa_pct as 
   select *
          from eldb_cp9.cp9_workflow_analysis_refined
          where session_def in (select distinct session_def from eldb_cp9.cp9_preconversion_trial_users); --29013
       

       --Do for all versions.
       
\echo 'Done.'       
        
--This is the final table "cpX_workflow_analysis" which is sent to the R code.(In R code, we will remove duplicates)
