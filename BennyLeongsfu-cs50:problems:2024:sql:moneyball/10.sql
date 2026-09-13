
select first_name, last_name, salary, HR, year from(
    select * from performances
    join players
    on players.id = performances.player_id
    join salaries
    on salaries.player_id = performances.player_id
    where performances.year = salaries.year
)
order by player_id ASC, year DESC, HR DESC, salary DESC
