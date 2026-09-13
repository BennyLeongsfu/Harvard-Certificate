select first_name, last_name from(
    select * from salaries
    join players
    on players.id = salaries.player_id
)
Order by salary DESC
limit 1
