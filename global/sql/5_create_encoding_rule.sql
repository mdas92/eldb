
\echo '--Create encoding rule Table & import csv'

     create table eldb.workflow_encoding_rule
         (
            event_name text not null,
            encoded_string text not null
         );

--Create a table having feature filter rules for a particular threshold of avg feature_vector_score (for each version)
--in_out_50 is avg score > 0.5 , in_out_100 is avg score > 1.0 etc

\echo '--Create feature filter rules & import csv'

create table eldb_cp6.cp6_feature_filter_rule 
         (
    	    encoded_string text not null,
            in_out_50 numeric not null
         );
         
create table eldb_cp7.cp7_feature_filter_rule 
         (
    	    encoded_string text not null,
            in_out_50 numeric not null
         );
         
create table eldb_cp8.cp8_feature_filter_rule 
         (
    	    encoded_string text not null,
            in_out_50 numeric not null
         );
         
create table eldb_cp9.cp9_feature_filter_rule 
         (
    	    encoded_string text not null,
            in_out_50 numeric not null
         );
         