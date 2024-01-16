/* Write your T-SQL query statement below */
-- Common Table Expression (CTE) to find the first login date for each player
WITH PlayerFirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login
    FROM 
        Activity
    GROUP BY 
        player_id
)

-- Selecting the fraction of players who logged in on the day after their first login
SELECT 
    -- Using ROUND to round the fraction to 2 decimal places
    ROUND(COUNT(CASE WHEN a.event_date = DATEADD(DAY, 1, pfl.first_login) THEN 1 END) * 1.0 / NULLIF(COUNT(DISTINCT pfl.player_id), 0), 2) AS fraction
FROM 
    PlayerFirstLogin pfl
JOIN 
    Activity a ON pfl.player_id = a.player_id;
