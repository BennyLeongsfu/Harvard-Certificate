-- select * from graduation_rates
-- left join expenditures
-- on expenditures.id

-- WITH pupil_expenditure AS(
-- select district_id, name, per_pupil_expenditure from(
--     select * from schools
--     left join expenditures
--     on expenditures.district_id = schools.district_id
-- ) where per_pupil_expenditure is not null),
-- graduation AS(
-- select school_id, district_id, graduated from(
--     select * from graduation_rates
--     left join schools
--     on schools.id = graduation_rates.school_id
-- ) where graduated is not NULL )

-- select count(*) from(
-- select pupil_expenditure.name, pupil_expenditure.per_pupil_expenditure, graduation.graduated from pupil_expenditure
-- left join graduation
-- on graduation.district_id = pupil_expenditure.district_id
-- order by pupil_expenditure.per_pupil_expenditure DESC, pupil_expenditure.name
-- )

-- select count(*) from(
-- select schools.name, schools.district_id, expenditures.per_pupil_expenditure from schools
-- left join expenditures
-- on expenditures.district_id = schools.district_id
-- left join graduation_rates
-- on graduation_rates.school_id = schools.id
-- where expenditures.per_pupil_expenditure is not NULL
-- order by expenditures.per_pupil_expenditure DESC, schools.name

-- )


-- WITH expenditure_and_school AS(
-- select expenditures.district_id, per_pupil_expenditure, name from expenditures
-- left join schools
-- on expenditures.district_id = schools.district_id
-- ),
-- graduation_and_school AS(
-- select school_id, district_id, graduated from graduation_rates
-- left join schools
-- on schools.id = graduation_rates.school_id
-- )

-- select name, per_pupil_expenditure, graduated from expenditure_and_school
-- left join graduation_and_school
-- on expenditure_and_school.district_id = graduation_and_school.district_id
-- where per_pupil_expenditure is not null and graduated is not null
-- order by per_pupil_expenditure DESC, name
-- limit 3

select name, per_pupil_expenditure, graduated from (
    select name, per_pupil_expenditure, schools.id from expenditures
    left join schools
    on expenditures.district_id = schools.district_id
) as expenditure_school
left join graduation_rates
on expenditure_school.id = graduation_rates.school_id
where graduated is not NULL
order by per_pupil_expenditure DESC, name
