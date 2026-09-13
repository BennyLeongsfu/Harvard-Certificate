create table "triplets" (
    "sentence_number" integer,
    "character_number" integer,
    "message_length" integer
);

insert into "triplets" ("sentence_number", "character_number", "message_length") values
            (14, 98, 4),
            (114, 3, 5),
            (618, 72, 9),
            (630, 7, 3),
            (932, 12, 5),
            (2230, 50, 7),
            (2346, 44, 10),
            (3041, 14, 5);

create view "message" as
    select substr("sentence", "character_number", "message_length") as "phrase" from triplets
    join sentences
    on sentences.id = triplets.sentence_number
;
