-- Who hit the most home runs in 2019, and what team did they play for?

-- Expected result:
--
-- +---------------+------------+-----------+-----------+
-- | New York Mets | Pete       | Alonso    | 53        |
-- +---------------+------------+-----------+-----------+

SELECT team_name, first_name, last_name, home_runs
FROM
    (SELECT id, name as team_name FROM teams WHERE year = 2019) teams
INNER JOIN
    (SELECT DISTINCT player_id, team_id, home_runs FROM stats) stats on (teams.id = stats.team_id)
INNER JOIN
    (SELECT DISTINCT id, first_name, last_name FROM players) players on (stats.player_id = players.id)
ORDER BY home_runs DESC LIMIT 1;