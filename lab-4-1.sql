-- How many lifetime hits does Barry Bonds have?

-- Expected result:
-- 2935

SELECT lifetime_hits
FROM
    (SELECT id FROM players WHERE first_name = 'Barry' AND last_name = 'Bonds') player
INNER JOIN
    (SELECT player_id, sum(hits) as lifetime_hits FROM stats GROUP BY player_id) stats on (player.id = stats.player_id);
