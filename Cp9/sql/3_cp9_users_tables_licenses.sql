       
    /*    REQUIREMENTS:
        Find all users who were ever on trial
        Find all sessions of above users- create a table with user_def,session_def and license_type
        create 3 tables now
        	1. table 1 consists of users, sessions and workflows of users who were on trial and moved to license
        	2. table 2 consists of entries from table but before they moved to license
        	3. table 3 consists of users, sessions and workflows of users who were on trial and stayed on trial */
	
        	
        --Below query gives us users, sessions and workflows of users who were ever on trial across any of the sessions
        --create a table with data for all users who were ever on trial across any of the sessions:

 \echo 'Divide users based on license types..'       
        create table eldb_cp9.ordered_sessions_ever_on_trial as 
        (select * from eldb_cp9.cp9_ordered_sessions where user_def in 
        (select distinct user_def from eldb_cp9.cp9_ordered_sessions where type_license='Trial') 
        );
        
        --create a table with data for all trial users who converted:
        create table eldb_cp9.cp9_converted_trial_users as 
        (select distinct user_def,session_def,type_license from eldb_cp9.ordered_sessions_ever_on_trial where user_def in 
        (select distinct user_def from eldb_cp9.ordered_sessions_ever_on_trial 
            where type_license = 'Retail' or type_license = 'Volume'));
        
        
        --create a table with data for all trial users who did not convert:
        create table eldb_cp9.cp9_nonconverted_trial_users as 
        (select distinct user_def,session_def,type_license from eldb_cp9.ordered_sessions_ever_on_trial where user_def not in 
        (select distinct user_def from eldb_cp9.cp9_converted_trial_users));
        
        
        --create a table with data for all trial users who converted but before their conversion:
        create table eldb_cp9.cp9_preconversion_trial_users as 
        (select * from eldb_cp9.cp9_converted_trial_users where type_license='Trial');
    --delete rows with license = "novalue"
    
        
        delete from eldb_cp9.cp9_nonconverted_trial_users where type_license in ('NOVALUE','NoValue','NoLicenseType');
	\echo 'Done..'