

\echo '--create feature_renamed table'

SELECT * INTO eldb_cp9.cp9_features_renamed FROM eldb_cp9.cp9_optimized_feature_facts;

\echo '--alter tables to add a new column to each with default value'
ALTER TABLE eldb_cp9.cp9_features_renamed ADD column_renamed text;

update eldb_cp9.cp9_features_renamed set column_renamed = 'NoRename';



\echo '--Rename the features for each version'

        drop function if exists isnumeric(text);
        -- Function: public.isnumeric(text)
        CREATE OR REPLACE FUNCTION public.isnumeric(text)
          RETURNS boolean AS
        $BODY$
        DECLARE x NUMERIC;
        BEGIN
            x = $1::NUMERIC;
            RETURN TRUE;
        EXCEPTION WHEN others THEN
            RETURN FALSE;
        END;
        $BODY$
          LANGUAGE plpgsql IMMUTABLE
          COST 100;

\echo 'Update cp9'     
        update eldb_cp9.cp9_features_renamed nf
        set column_renamed = af.compressed_name 
        from eldb.rename_rule af 
        where nf.data_category = af.data_category 
        and 
        nf.data_name = af.data_name 
        and 
        case
            when 
          af.data_value = '%STRING_VALUE%'   
          then case 
            when isnumeric(nf.data_value) 
              then 0  
              else 1 
            end 
          else 1
            end
         = 1;


\echo '--Delete NoRename category entries'

delete from eldb_cp9.cp9_features_renamed where column_renamed = 'NoRename';

\echo 'Done.'