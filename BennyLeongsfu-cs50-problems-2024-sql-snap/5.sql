with lovelytrust487_friend as (select friend_id from friends
where user_id in (
    select id from users
    where username = 'lovelytrust487'
)), exceptionalinspiration482 as (
select friend_id from friends
where user_id in (
    select id from users
    where username = 'exceptionalinspiration482'
))

select lovelytrust487_friend.friend_id from lovelytrust487_friend
inner join exceptionalinspiration482
on lovelytrust487_friend.friend_id =exceptionalinspiration482.friend_id
;
