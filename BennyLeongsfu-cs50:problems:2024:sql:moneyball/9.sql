select name, round(avg(salary),2) from(
    select * from salaries
    join teams
    on teams.id = salaries.team_id
)
where year = 2001
group by team_id
order by avg(salary) ASC
limit 5



