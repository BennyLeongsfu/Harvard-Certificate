create table "Passengers" (
    "first name" text not null,
    "last name" text not null,
    "age" integer not null,
    "passenger id" integer not null unique,
    primary key ("passenger id")
);

create table "Check-Ins" (
    "date and time" DATETIME not null,
    "fight id" text not null,
    "passenger id" integer not null unique,
    primary key ("fight id")
);

create table "Airlines" (
    "airline id" integer not null unique,
    "airline name" text not null,
    "concourses" text not null,
    primary key ("airline id")
);

create table "Flights" (
    "flight number" integer not null,
    "airline name" text not null,
    "airport departure code" text not null,
    "airport destination code" text not null,
    "departure date and time" DATETIME not null,
    "arrival date and time" DATETIME not null,
    foreign key ("flight number") references "Airlines"("airline id")
);
