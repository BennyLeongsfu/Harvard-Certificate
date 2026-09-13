-- create view frequently_reviewed as
--     select id, property_type, host_name, count(comments) from(
--         select * from listings
--         join reviews on reviews.listing_id = listings.id)
--     group by id
--     order by property_type, host_name DESC
--     limit 100
-- ;

-- create view frequently_reviewed as
--     select id, property_type, host_name, count(comments) as reviews from(
--         select * from reviews
--         join listings
--         on listings.id = reviews.listing_id
--     )
--     group by id
--     order by reviews DESC, property_type, host_name
--     limit 100
-- ;

create view frequently_reviewed as
    select id, property_type, host_name, reviews  from (
        select listing_id, count(comments) as reviews from reviews
        group by listing_id
        order by reviews DESC
        limit 100
    ) as top_100
    join listings
    on listings.id = top_100.listing_id
;
