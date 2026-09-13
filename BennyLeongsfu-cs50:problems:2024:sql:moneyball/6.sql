select name, sum(H) as "total hits" from(
    select * from performances
    join teams
    on teams.id = performances.team_id
)
where year = 2001
group by team_id
order by total(H) DESC
limit 5;
