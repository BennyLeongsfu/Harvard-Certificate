create table "Users" (
    "first name" text not null,
    "last name" text not null,
    "username" text not null,
    "password" text not null,
    primary key ("username")
);

create table "Schools and Universities" (
    "student first name" text not null,
    "student last name" text not null,
    "name of the school" text not null,
    "type of school" text not null,
    "school’s location" text not null,
    "year founded" integer not null,
    primary key ("name of the school"),
    foreign key ("student first name") references "Users" ("first name"),
    foreign key ("student last name") references "Users" ("last name")
);

create table "Companies" (
    "worker first name" text not null,
    "worker last name" text not null,
    "company name" text not null,
    "company industry" text not null,
    "company location" text not null,
    primary key ("company name"),
    foreign key ("worker first name") references "Users" ("first name"),
    foreign key ("worker last name") references "Users" ("last name")
);
