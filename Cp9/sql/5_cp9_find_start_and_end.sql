    
\echo '--Find the count of all start & end features for each version'
-- using:

create table eldb_cp9.cp9_start_feature as
 (   select start_feature,count(start_feature)
    from
        (SELECT split_part(event_list, ',', 1)
            as start_feature
            from eldb_cp9.cp9_workflow_analysis) 
        as start_list
    group by start_feature
    order by count desc
);
--End feature count
create table eldb_cp9.cp9_end_feature as
(    select end_feature,count(end_feature)
    from
    (SELECT reverse(split_part(reverse(event_list), ',', 1))
    as end_feature
    from eldb_cp9.cp9_workflow_analysis) as end_list
    group by end_feature
    order by count desc
  );