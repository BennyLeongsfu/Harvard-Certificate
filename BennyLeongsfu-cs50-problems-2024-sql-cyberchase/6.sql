select title from episodes
where season = 6 and strftime('%Y', air_date) = '2007'
