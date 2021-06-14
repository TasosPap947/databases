
/* USE THIS ONLY IF YOU WANT TO CHANGE THE RELATIONAL SCHEMA */

drop database `db-ntua`;
create database `db-ntua`;
use `db-ntua`;

create table customer (
  nfc_id int,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  date_of_birth date not null,
  document_number varchar(20) not null,
  document_type enum("Passport", "ID") not null,
  document_authority varchar(20) not null,

  primary key (nfc_id),
  constraint document check (
                        (document_type = "ID" and (document_number like "________"))
                        or (document_type = "Passport" and document_number like "_________")
                      )
);

create table customer_phone (
  customer_id int,
  phone_number varchar(10) not null,

  primary key (phone_number),

  foreign key (customer_id) references customer(nfc_id)
    on delete cascade
    on update cascade,

  constraint phone_number check (phone_number like "__________")
);

create table customer_email (
  customer_id int,
  email varchar(30) not null,

  primary key (email),

  foreign key (customer_id) references customer(nfc_id)
    on delete cascade
    on update cascade,

  constraint email check (email like "%_@__%.__%")
);

create table place (
  place_id int,
  number_of_beds int not null,
  place_name enum (
               "Bar",
               "Conference Room",
               "Corridor",
               "Elevator",
               "Gym",
               "Hair Salon",
               "Restaurant",
               "Room",
               "Sauna"
             ) not null,
  number int,
  floor_number int,
  corridor enum("North", "East", "South", "West"),

  primary key (place_id)
);

create table service (
  service_id int,
  service_description enum(
                        "Drink at bar",
                        "Food and drink at restaurant",
                        "Gym",
                        "Hair salon",
                        "Room",
                        "Sauna",
                        "Use conference room"
                      ) not null,

  primary key (service_id)
);

create table service_with_subscription (
  service_id int,
  service_description enum(
                        "Gym",
                        "Room",
                        "Sauna",
                        "Use conference room"
                      ) not null,

  primary key (service_id),

  foreign key (service_id) references service(service_id)
    on delete cascade
    on update cascade
);

create table subscribes (
  customer_id int,
  service_id int,
  subscription_date_time timestamp,

  primary key (customer_id, service_id),

  foreign key (customer_id) references customer(nfc_id)
    on delete cascade
    on update cascade,
  foreign key (service_id) references service_with_subscription(service_id)
    on delete cascade
    on update cascade
);

create table service_charge (
  charge_date_time timestamp not null,
  charge_description varchar(50),
  charge_amount numeric(8,2) not null,
  service_id int,
  customer_id int,
  charge_id int,

  primary key (charge_id),

  foreign key (customer_id) references customer(nfc_id)
    on delete set null
    on update cascade,
  foreign key (service_id) references service(service_id)
    on delete set null
    on update cascade
);

create table service_without_subscription (
  service_id int,
  service_description enum(
                        "Drink at bar",
                        "Food and drink at restaurant",
                        "Hair salon"
                      ) not null,

  primary key (service_id),

  foreign key (service_id) references service(service_id)
    on delete cascade
    on update cascade
);

create table has_access_to (
  customer_id int,
  place_id int,
  start_date_time timestamp not null,
  end_date_time timestamp,

  primary key (customer_id, place_id),

  foreign key (customer_id) references customer(nfc_id)
    on delete cascade
    on update cascade,
  foreign key (place_id) references place(place_id)
    on delete cascade
    on update cascade
);

create table visited (
  customer_id int,
  place_id int not null,
  entry_date_time timestamp not null,
  exit_date_time timestamp,
  visit_id int,

  primary key (visit_id),

  foreign key (customer_id) references customer(nfc_id)
    on delete set null
    on update cascade,
  foreign key (place_id) references place(place_id)
    on delete cascade
    on update cascade
);

create table offered_in (
  place_id int,
  service_id int,

  primary key (service_id, place_id),

  foreign key (place_id) references place(place_id)
    on delete cascade
    on update cascade,
  foreign key (service_id) references service(service_id)
    on delete cascade
    on update cascade
);
