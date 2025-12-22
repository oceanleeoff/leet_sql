# Write your MySQL query statement below
SELECT 
    machine_id,
    ROUND(AVG(end_time - start_time), 3) processing_time
FROM (
    SELECT 
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) end_time,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) start_time
    FROM Activity
    GROUP BY machine_id, process_id
) process_times
GROUP BY machine_id
;