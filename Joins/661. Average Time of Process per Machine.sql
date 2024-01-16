/* Write your T-SQL query statement below */

SELECT S.machine_id, ROUND(AVG(E.timestamp - S.timestamp ),3) AS processing_time
FROM Activity S
INNER JOIN Activity E
ON S.machine_id = E.machine_id
AND S.process_id = E.process_id
AND E.activity_type = 'end' AND S.activity_type = 'start'
GROUP BY S.machine_id;