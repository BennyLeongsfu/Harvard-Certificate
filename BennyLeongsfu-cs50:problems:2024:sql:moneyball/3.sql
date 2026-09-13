select year, HR from performances
where player_id =(
    select id from players
    where first_name Like '%Ken%' and last_name like 'Griffey'
    and birth_year = 1969)
order by year DESC
