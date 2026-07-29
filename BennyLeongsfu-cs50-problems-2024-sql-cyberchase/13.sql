select * from episodes
where (episode_in_season = 1 AND strftime('%Y', air_date) = '2023') OR (episode_in_season = 2 AND strftime('%Y', air_date) = '2022')
c
