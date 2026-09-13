-- select * from addresses
-- select * from drivers
-- select * from packages
-- select * from scans

-- *** The Lost Letter ***
-- Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. Not long ago, I sent out a special letter.
-- It’s meant for my friend Varsha. She’s starting a new chapter of her life at 2 Finnegan Street, uptown.
-- (That address, let me tell you: it was a bit tricky to get right the first time.)
-- The letter is a congratulatory note—a cheery little paper hug from me to her, to celebrate this big move of hers.
-- Can you check if it’s made its way to her yet?

-- id that's delivered from 900 Somerville Avenue --> 432
-- select * from addresses
-- where "address" like "900 Somerville Avenue%"

-- package info that's from 900 Somerville Avenue --> Congratulatory letter
-- select * from packages
-- where "from_address_id" = 432
-- and contents LIKE "%Congratulatory%"

-- package's address and id
-- select * from scans
-- where package_id = 384

-- select * from "addresses"
-- where "id" = (
--     select "address_id" from scans                               -- select * from scans
--     where "action" = "Drop" and "package_id" = (                 -- where package_id = 384               --> packages(Congratulatory letter) id
--          select id from packages                                     -- select * from packages
--          where "from_address_id" = (                                 -- where "from_address_id" = 432    --> Congratulatory letter
--                 select id from addresses                                 -- select * from addresses
--                 where "address" like "%900 Somerville Avenue%"
--                                    )                                     -- where "address" like "900 Somerville Avenue%"
--          and  "contents" like "%Congratulatory letter%"                  -- and contents LIKE "%Congratulatory%"
--                                                   )
--               )



-- *** The Devious Delivery ***
-- Good day to you, deliverer of the mail. You might remember that not too long ago I made my way over from the town of Fiftyville.
-- I gave a certain box into your reliable hands and asked you to keep things low.
-- My associate has been expecting the package for a while now. And yet, it appears to have grown wings and flown away. Ha!
-- Any chance you could help clarify this mystery? Afraid there’s no “From” address.
-- It’s the kind of parcel that would add a bit more… quack to someone’s bath times, if you catch my drift.

-- select * from packages
-- where from_address_id is NULL

-- select * from scans
-- where package_id = 5098

-- select * from addresses
-- where id = 50 or id = 348

-- select * from addresses
-- where id =  (select address_id from scans
--             where package_id = (select id from packages
--                                 where from_address_id is NULL
--                                 )
--             order by timestamp DESC
--             limit 1
--             )


-- *** The Forgotten Gift ***
-- Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place.
-- That was about two weeks ago. Now the delivery date has passed by seven whole days and I hear she still waits,
-- her hands empty and heart filled with anticipation. I’m a bit worried wondering where my package has gone.
-- I cannot for the life of me remember what’s inside, but I do know it’s filled to the brim with my love for her.
-- Can we possibly track it down so it can fill her day with joy? I did send it from my home at 109 Tileston Street.

-- select * from addresses
-- where address = '728 Maple Place'

-- select * from packages
-- where to_address_id = 4983

-- select * from scans
-- where package_id = 9523

-- select * from drivers
-- where id = 17

-- select * from drivers
-- where id = (
--             select driver_id from scans
--             where package_id = (select id from packages
--                                 where to_address_id = (select id from addresses
--                                                     where address = '728 Maple Place'
--                                                     )
--                                 )
--             order by timestamp DESC
--             limit 1
--             )

