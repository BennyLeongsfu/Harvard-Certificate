select name from schools
where id IN (
    select school_id from graduation_rates
    where graduated = 100)
