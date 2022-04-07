-- What are the first and last names of the players who 
-- played for the 2020 Chicago Cubs?

-- Hint: combine WHERE clauses using AND, e.g.
-- WHERE column1 = expression1
-- AND column2 = expression2

-- Expected result: 47 rows starting with
--
-- +------------+-----------+
-- | Jason      | Adam      |
-- | Albert     | Almora    |
-- | Adbert     | Alzolay   |
-- | Javier     | Baez      |
-- | David      | Bote      |
-- | Rex        | Brothers  |
-- | Kris       | Bryant    |
-- | Victor     | Caratini  |
-- | Andrew     | Chafin    |
-- | Tyler      | Chatwood  |
-- | Willson    | Contreras |
-- | Yu         | Darvish   |
-- | Matt       | Dermody   |
-- | Billy      | Hamilton  |
-- | Ian        | Happ      |

SELECT first_name, last_name
FROM
    (SELECT id FROM teams WHERE year = 2020 AND name = 'Chicago Cubs') team
INNER JOIN
    (SELECT DISTINCT player_id, team_id FROM stats) stats on (team.id = stats.team_id)
INNER JOIN
    (SELECT DISTINCT id, first_name, last_name FROM players) players on (stats.player_id = players.id)
ORDER BY last_name;

-- SELECT
--     count(1)
-- FROM (
-- SELECT first_name, last_name
--     FROM
--         (SELECT id FROM teams WHERE year = 2020 AND name = 'Chicago Cubs') team
--     INNER JOIN
--         (SELECT DISTINCT player_id, team_id FROM stats) stats on (team.id = stats.team_id)
--     INNER JOIN
--         (SELECT DISTINCT id, first_name, last_name FROM players) players on (stats.player_id = players.id)
--     ORDER BY last_name
-- ) t;