-- select district_id, per_pupil_expenditure from expenditures
-- order by per_pupil_expenditure DESC
-- limit 10

select name, per_pupil_expenditure from(
    select * from districts
    left join expenditures
    on districts.id = expenditures.district_id
)
where type = 'Public School District'
order by per_pupil_expenditure DESC
limit 10

