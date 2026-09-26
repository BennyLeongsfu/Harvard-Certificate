-- DROP INDEX IF EXISTS "search_users_by_last_login";
-- CREATE INDEX "search_users_by_last_login"
-- ON "users"("last_login_date")
-- where last_login_date > "2024-01-01";

select username from users
where last_login_date > "2024-01-01"
;
