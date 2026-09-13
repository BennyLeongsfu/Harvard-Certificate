select name, evaluated, exemplary, proficient, needs_improvement, unsatisfactory from(
select * from districts
join staff_evaluations
on staff_evaluations.district_id = districts.id
)
group by district_id
order by unsatisfactory DESC
limit 3
