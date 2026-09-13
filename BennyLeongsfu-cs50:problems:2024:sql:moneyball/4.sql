select first_name, last_name, salary from(
    select * from players
    join salaries
    on players.id = salaries.player_id
)
where year = 2001
Order by salary ASC, first_name, last_name, player_id
Limit 50
