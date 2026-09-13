UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

Delete from "user_logs"
where old_username = "admin";

select * from user_logs;

INSERT INTO "user_logs" ("id", "type", "old_username", "new_username", "old_password", "new_password")
values(
    (select id+1 from "user_logs"
    order by id DESC
    Limit 1),
    "update",
    "admin",
    "admin",
    (select new_password from "user_logs"
    where new_username = 'admin'),
    (select new_password from "user_logs"
    where new_username = 'emily33')
);
