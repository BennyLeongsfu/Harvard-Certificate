create table "Donuts"(
    "donut name" text not null unique,
    "gluten-free Y/N" text,
    "price" numeric not null,
    primary key ("donut name")
);

create table "Customers"(
    "id" integer not null unique,
    "first name" text not null,
    "last name" text not null,
    "order history" text,
    primary key ("id")
);

create table "Orders"(
    "customer id" integer not null unique,
    "order number" integer,
    "order donut list" text,
    primary key ("order number"),
    foreign key ("customer id") references "Customers"("id")
);
