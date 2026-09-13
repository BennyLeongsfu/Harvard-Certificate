-- select * from schools
-- where district_id = 'Cambridge'

-- select * from districts
-- where city = 'Cambridge' and name = 'Cambridge'

select name from schools
where district_id = (
    select id from districts
    where city = 'Cambridge' and name = 'Cambridge'
                    )
