select name, pupils from(
    select * from districts
    left join expenditures
    on districts.id = expenditures.district_id
                        )
where pupils is not NULL
order by pupils DESC
