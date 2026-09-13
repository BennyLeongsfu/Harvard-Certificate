-- WITH expenditures_id AS(
--     select district_id, avg(per_pupil_expenditure) as avg_expenditure from expenditures
--     where per_pupil_expenditure is not null
--     group by district_id
--     ),
-- staff_evaluations_id as(
--     select district_id, avg(exemplary) as avg_exemplary from staff_evaluations
--     where exemplary is not null
--     group by district_id
--     )

-- select * from (
-- select expenditures_id.district_id, expenditures_id.avg_expenditure, staff_evaluations_id.avg_exemplary from expenditures_id
-- left join staff_evaluations_id
-- on expenditures_id.district_id = staff_evaluations_id.district_id)
-- where avg_expenditure > (
--     select avg(per_pupil_expenditure) from expenditures
-- )
-- and avg_exemplary is not null
-- and avg_exemplary > (
--     select avg(exemplary) from staff_evaluations
-- )
-- order by avg_exemplary DESC, avg_expenditure DESC


-- 2nd
-- select name, per_pupil_expenditure, staff_evaluations.exemplary from(
--     select * from districts
--     left join expenditures
--     on districts.id = expenditures.district_id
-- ) as districts_expenditures left join staff_evaluations
-- on districts_expenditures.id = staff_evaluations.district_id
-- where per_pupil_expenditure is not null
-- and per_pupil_expenditure > (select avg(per_pupil_expenditure) from expenditures)
-- and exemplary > (select avg(exemplary) from staff_evaluations)
-- order by exemplary DESC, per_pupil_expenditure DESC

--3rd

-- select name, exemplary, per_pupil_expenditure from(
-- select * from expenditures
-- left join staff_evaluations
-- on expenditures.district_id = staff_evaluations.district_id
-- left join districts
-- on districts.id = expenditures.district_id
-- where districts.type = "Public School District"
-- and staff_evaluations.exemplary > (select avg(exemplary) from staff_evaluations)
-- and expenditures.per_pupil_expenditure > (select avg(per_pupil_expenditure) from expenditures)
-- )
-- order by per_pupil_expenditure DESC, exemplary DESC
-- limit 3

--4th
select name, per_pupil_expenditure, exemplary from(
    select * from districts
    left join expenditures
    on expenditures.district_id = districts.id
    left join staff_evaluations
    on staff_evaluations.district_id = districts.id
)
where type = "Public School District"
and per_pupil_expenditure > (select avg(per_pupil_expenditure) from expenditures)
and exemplary > (select avg(exemplary) from staff_evaluations)
order by exemplary DESC, per_pupil_expenditure DESC

