SELECT 
	player_name,
	(UNNEST(season_stats)::season_stats).* AS season_stats
FROM players
WHERE current_season = 1996
;
