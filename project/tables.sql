
/* USE THIS ONLY IF YOU WANT TO CHANGE THE RELATIONAL SCHEMA */

/*

drop database `db-ntua`;
create database `db-ntua`;
use `db-ntua`;

*/

create table customer (
  nfc_id int,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  date_of_birth date not null,
  document_number varchar(20) not null,
  document_type enum("Passport", "ID") not null,
  document_authority varchar(20) not null,

  primary key (nfc_id)
);

create table customer_phone (
  customer_id int,
  /*country_code int(4),*/
  phone_number int(10) not null,

  primary key (phone_number),

  foreign key (customer_id) references customer(nfc_id)
);

create table customer_email (
  customer_id int,
  email varchar(20) not null, /* add constraint like %@% */

  primary key (email),

  foreign key (customer_id) references customer(nfc_id)
);

create table place (
  place_id int,
  number_of_beds int not null,
  place_name varchar(20) not null,
  place_description enum (
                      "Room",
                      "Elevator",
                      "Bar",
                      "Restaurant",
                      "Conference Room",
                      "Gym",
                      "Sauna",
                      "Hair Salon"
                    ) not null,
  floor_number int,
  corridor enum("North", "East", "South", "West"),

  primary key (place_id)
);

create table service (
  service_id int,
  service_description enum(
                        "Drink at bar",
                        "Food and drink at restaurant",
                        "Hair salon",
                        "Gym",
                        "Sauna",
                        "Use conference room"
                      ) not null,

  primary key (service_id)
);

create table service_with_subscription (
  service_id int,
  service_description enum(
                        "Gym",
                        "Sauna",
                        "Use conference room"
                      ) not null,

  primary key (service_id),

  foreign key (service_id) references service(service_id)
);

create table subscribes (
  customer_id int,
  service_id int,
  subscription_date_time timestamp,

  primary key (customer_id, service_id),

  foreign key (customer_id) references customer(nfc_id),
  foreign key (service_id) references service_with_subscription(service_id)
);

create table service_charge (
  charge_date_time timestamp not null,
  charge_description varchar(50),
  charge_amount int not null,
  service_id int not null,
  customer_id int not null,

  primary key (customer_id, service_id, charge_date_time),

  foreign key (customer_id) references customer(nfc_id),
  foreign key (service_id) references service(service_id),
  foreign key (customer_id, service_id) references subscribes(customer_id, service_id)
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
);

create table has_access_to (
  customer_id int,
  place_id int,
  start_date_time timestamp not null,
  end_date_time timestamp,

  primary key (customer_id, place_id),

  foreign key (customer_id) references customer(nfc_id),
  foreign key (place_id) references place(place_id)
);

create table visits (
  customer_id int,
  place_id int,
  entry_date_time timestamp not null,
  exit_date_time timestamp,

  primary key (customer_id, place_id, entry_date_time),

  foreign key (customer_id) references customer(nfc_id),
  foreign key (place_id) references place(place_id),
  foreign key (customer_id, place_id) references has_access_to(customer_id, place_id)
);

create table offered_in (
  place_id int,
  service_id int,

  primary key (service_id, place_id),

  foreign key (place_id) references place(place_id),
  foreign key (service_id) references service(service_id)
);
