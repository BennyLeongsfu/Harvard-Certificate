select city, count(city) as count from schools
where type = 'Public School'
group by city
order by count DESC, city
limit 10
