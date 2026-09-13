WITH salary_per_hit AS (
    select player_id, first_name, last_name from(
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
    limit 10),
salary_per_RBI as (
    select player_id, first_name, last_name from(
        select * from (
            select * from players
            join performances
            on performances.player_id = players.id
            where year = 2001 and RBI != 0
        ) as players_performances
    join salaries
    on salaries.player_id = players_performances.id
    where salaries.year = 2001
    )
    order by salary/RBI ASC, first_name, last_name
    limit 10)

select r.first_name, r.last_name from salary_per_RBI as r
join salary_per_hit as h
on h.player_id = r.player_id
order by r.last_name
