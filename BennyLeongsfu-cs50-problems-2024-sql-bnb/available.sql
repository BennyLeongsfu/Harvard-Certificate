create view available as
select id, property_type, host_name, date from(
    select listing_id, date from availabilities
    where available = "TRUE") as "availabilities_update"
join listings
on listings.id = availabilities_update.listing_id
;
