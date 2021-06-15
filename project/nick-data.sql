delete from customer;
delete from customer_email;
delete from customer_phone;
delete from has_access_to;
delete from offered_in;
delete from place;
delete from service;
delete from service_charge;
delete from service_without_subscription;
delete from service_with_subscription;
delete from subscribes;
delete from visited;

/*
How to insert:
insert into <table>(attr1, attr2, ...) values(value1, value2, ...)
*/

/* customer */

insert into customer(date_of_birth, document_authority, document_number, document_type, first_name, last_name, nfc_id)
values("1970-01-01", "Α.Τ. Αθηνών", "ΑΑ000000", "ID", "Γιώργος", "Παπαδόπουλος", 1);

/* customer_email */

insert into customer_email(customer_id, email)
values(1, "georgepapad@gmail.com");

/* customer_phone */

insert into customer_phone(customer_id, phone_number)
values(1, "0000000000");

/* place */

insert into place(corridor, floor_number, number_of_beds, place_name, number, place_id)
values
("North", 0, 0, "Bar", 1, 1),
("East", 1, 1, "Room", 101, 2);

/* service */

insert into service(service_description, service_id, service_cost)
values
("Drink at bar", 1, 8),
("Sauna", 2, 20),
("Room", 3, 150);

/* service_with_subscription */

insert into service_with_subscription(service_description, service_id, service_cost)
values
("Sauna", 2, 20), /* Try sauna with id = 3 while sauna has id = 2 at service table */
("Room", 3, 150);

/* subscribes */

insert into subscribes(customer_id, service_id, subscription_date_time)
values
(1, 2, "2000-01-01 00:00:00"),
(1, 3, "2000-01-01 00:00:00");

/* service_charge */

insert into service_charge(charge_amount, charge_date_time, charge_description, customer_id, service_id, charge_id)
values(100, "2000-01-02 13:40:00", "Strawberry Daquiri", 1, 1, 1);

/* service_without_subscription */

insert into service_without_subscription(service_description, service_id, service_cost)
values("Drink at bar", 1);

/* has_access_to */

/* TODO: Add trigger that gives access to those who have subscribed */

/* NO TRIVIAL ACCESSES!!! */

insert into has_access_to(customer_id, place_id, start_date_time, end_date_time)
values(1, 2, "2000-01-01 00:00:00", null);

/* visited */


insert into visited(customer_id, entry_date_time, exit_date_time, place_id, visit_id)
values(1, "2000-01-02 10:00:00", "2000-01-02 11:00:00", 1, 1);

/* offered_in */

insert into offered_in(place_id, service_id)
values(1, 1);
