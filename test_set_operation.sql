WITH last_year AS (
	SELECT
		ty.*
	FROM
		player_seasons AS ty
	LEFT JOIN player_seasons AS ly
		ON ty.player_name = ly.player_name AND ly.season = 1997
	WHERE
		ty.season = 1996 AND ly.player_name IS NULL
),
	this_year AS (
		SELECT
			ty_1.*
		FROM
			player_seasons AS ty_1
		LEFT JOIN player_seasons AS ly_1
			ON ty_1.player_name = ly_1.player_name
			AND ly_1.season = 1996
		WHERE
			ty_1.season = 1997 AND ly_1.player_name IS NULL
	),
	both_years AS (
		SELECT
			ty_2.*,
			ly_2.*
		FROM
			player_seasons AS ty_2
		JOIN player_seasons AS ly_2
			ON ty_2.player_name = ly_2.player_name
			AND ly_2.season = 1996
		WHERE
			ty_2.season = 1997
	)

SELECT
	*
FROM
	both_years
UNION ALL
SELECT
	*
FROM
	last_year AS lty
FULL OUTER JOIN this_year AS tsy
	ON lty.player_name = tsy.player_name
;



