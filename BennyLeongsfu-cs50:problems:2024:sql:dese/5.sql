select * from(
    select city, count(type) as "numberof public schools" from schools
    where type = 'Public School'
    group by city
    order by count(type) DESC, city
)
where "numberof public schools" <= 3
