


-- select *,  count(date), strftime('%Y', date) as 'year', strftime('%m', date) as 'month', strftime('%d', date) as 'day' from availabilities
-- where available = "TRUE" and year = '2023' and month = '06'
-- group by date

create view june_vacancies as
    select id, property_type, host_name, days_vacant from (
        select listing_id, count(listing_id) as "days_vacant", strftime('%Y', date) as 'year', strftime('%m', date) as 'month', strftime('%d', date) as 'day' from availabilities
        where available = "TRUE" and year = "2023" and month = "06"
        group by listing_id) as june_vacancies
    join listings
    on listings.id = june_vacancies.listing_id
;

