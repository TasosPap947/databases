/* a */

select place.place_name, visited.place_id, count(*) as visit_count
from customer join visited on customer.nfc_id = visited.customer_id
where (
(timestampdiff(year, customer.date_of_birth, curdate()) between <age_low> and <age_high>)
and
(timestampdiff(month, visited.entry_date_time, curdate()) <= <time_interval>)
)
join place on place.place_id = visited.place_id
group by visited.place_id


/* b */

select service_charge.charge_description, count(*) as use_count
from service_charge join customer
on service_charge.customer_id = customer.nfc_id
where
(service_charge.charge_description <> "Room") and
(timestampdiff(year, customer.date_of_birth, curdate())
between <age_low> and <age_high>) and
(timestampdiff(month, visited.entry_date_time, curdate()) <= <time_interval>)
group by service_id
order by use_count desc


-- c
with aux as (
  select distinct service_charge.customer_id, service_charge.charge_description
  from customer join service_charge on service_charge.customer_id = customer.nfc_id
  where(
  (service_charge.charge_description <> 'Room') and
  (timestampdiff(year, customer.date_of_birth, curdate())
  between 0 and 100) and
  (timestampdiff(month, service_charge.charge_date_time, curdate()) <= 100))
)
select charge_description, count(*) as use_count
  from aux
  group by aux.charge_description
  order by use_count desc;
