-- Query for ex7 --

select customer.nfc_id, customer.first_name, customer.last_name, visited.entry_date_time
from
  (
    customer join visited
    on customer.nfc_id = visited.customer_id
  ) join place
    on visited.place_id = place.place_id
where place_name = "Gym"

-- Query for ex9 --

select customer_id, place_id, entry_date_time, exit_date_time
from visited
where customer_id = <Nikitas>
order by entry_date_time

-- Query for ex10 --

WITH
          infected_person_visits(
            customer_id,
            place_id,
            entry_date_time,
            exit_date_time
            ) AS(
              SELECT
              customer_id,
              place_id,
              entry_date_time,
              exit_date_time
              FROM
              visited
              WHERE
              visited.customer_id =".$customer_id."
            ),
            all_person_visits(
              customer_id,
              first_name,
              last_name,
              place_id,
              entry_date_time,
              exit_date_time
              ) AS(
                SELECT
                customer.nfc_id,
                customer.first_name,
                customer.last_name,
                visited.place_id,
                visited.entry_date_time,
                visited.exit_date_time
                FROM
                customer
                JOIN visited ON customer.nfc_id = visited.customer_id
                )
                SELECT DISTINCT
                all_person_visits.customer_id,
                all_person_visits.first_name,
                all_person_visits.last_name
                FROM
                infected_person_visits
                JOIN all_person_visits ON infected_person_visits.place_id = all_person_visits.place_id
                WHERE
                (
                  (
                    all_person_visits.entry_date_time BETWEEN infected_person_visits.entry_date_time AND DATE_ADD(
                      infected_person_visits.exit_date_time,
                      INTERVAL 1 HOUR
                      )
                      ) OR(
                        all_person_visits.exit_date_time BETWEEN infected_person_visits.entry_date_time AND DATE_ADD(
                          infected_person_visits.exit_date_time,
                          INTERVAL 1 HOUR
                          )
                          )
                        ) AND all_person_visits.customer_id <>".$customer_id;"

-- Query for ex11 --

<age_low> in years
<age_high> in years
<time_interval> (is 1 or 12 months)

-- Πιο πολυσύχναστοι χώροι, not done yet --

select visited.place_id, count(*) as visit_count
from customer join visited on customer.nfc_id = visited.customer_id
where (
        (timestampdiff(year, customer.date_of_birth, curdate()) between <age_low> and <age_high>)
        and
        (timestampdiff(month, visited.entry_date_time, curdate()) <= <time_interval>)
      )
group by visited.place_id

-- Συχνότερα χρησιμοποιούμενες υπηρεσίες, not done yet --

/* select offered_in.service_id, count(*) as use_count
from (customer join visited
      on customer.nfc_id = visited.customer_id
     ) join offered_in
      on offered_in.place_id = visited.place_id
where (
        (timestampdiff(year, customer.date_of_birth, curdate()) between <age_low> and <age_high>)
        and
        (timestampdiff(month, visited.entry_date_time, curdate()) <= <time_interval>)
      )
group by offered_in.service_id */

-- NEW VERSION --

select service_charge.charge_description, count(*) as use_count
from service_charge join customer on service_charge.customer_id = customer.nfc_id
where
  (service_charge.charge_description <> "Room") and
  (timestampdiff(year, customer.date_of_birth, curdate()) between <age_low> and <age_high>) and
  (timestampdiff(month, charge.date_time, curdate()) <= <time_interval>)
group by service_id
order by use_count desc



-- Υπηρεσίες που χρησιμοποιούνται από τους περισσότερους πελάτες, not done yet --

select offered_in.service_id, count(*) as use_count
from (select distinct
  from (customer join visited
        on customer.nfc_id = visited.customer_id
       ) join offered_in
        on offered_in.place_id = visited.place_id
  where (
          (timestampdiff(year, customer.date_of_birth, curdate()) between <age_low> and <age_high>)
          and
          (timestampdiff(month, visited.entry_date_time, curdate()) <= <time_interval>)
        )
group by offered_in.service_id
