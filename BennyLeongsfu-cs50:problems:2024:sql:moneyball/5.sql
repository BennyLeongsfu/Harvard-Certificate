-- Where first_name like "% Satchel %" and last_nam like "% Paige %"

select name from teams
where id in(
select team_id from(
    select * from performances
    join players
    on players.id = performances.player_id
)
where first_name like "%Satchel%" and last_name like "%Paige%"
)
