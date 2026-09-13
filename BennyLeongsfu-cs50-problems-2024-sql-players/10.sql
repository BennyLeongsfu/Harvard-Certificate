select concat("first_name"," ", "last_name") AS player_name from players
where strftime("%Y", "final_game") = "1872"
order by "first_name", "last_name"
