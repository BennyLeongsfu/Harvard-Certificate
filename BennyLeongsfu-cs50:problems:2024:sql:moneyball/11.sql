
-- select salaries.player_id, first_name, last_name, hit, year, salary from (
--     select players.id as 'player_id', first_name, last_name, performances.H as 'hit' from players
--     join performances
--     on performances.player_id = players.id
--     where H != 0
-- ) as performance_players
-- join salaries
-- on salaries.player_id = performance_players.player_id
-- where year = 2001
-- limit 100


select first_name, last_name, salary/H as 'dollars per hit' from(
    select * from (
        select * from players
        join performances
        on performances.player_id = players.id
        where year = 2001 and H != 0
    ) as players_performances
    join salaries
    on salaries.player_id = players_performances.id
    where salaries.year = 2001
)
order by salary/H ASC, first_name, last_name
limit 10

