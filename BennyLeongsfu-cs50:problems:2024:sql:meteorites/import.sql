CREATE TABLE "meteorites_temp" (
    "name" text,
    "id" integer primary key,
    "nametype" text,
    "class" text,
    "mass" real,
    "discovery" text,
    "year" integer,
    "lat" real,
    "long" real
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';


update "meteorites_temp"
set "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);


CREATE TABLE "meteorites" (
    "id" integer primary key,
    "name" text,
    "class" text,
    "mass" real,
    "discovery" text,
    "year" integer,
    "lat" real,
    "long" real
);

insert into "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")

SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name";


