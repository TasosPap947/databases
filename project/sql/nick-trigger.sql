delimiter $$

create trigger add_access
after insert
on subscribes for each row
begin
  insert into has_access_to(customer_id, place_id, start_date_time, end_date_time)
  select subscribes.customer_id, offered_in.place_id, subscribes.subscription_date_time, null
  from (subscribes join offered_in
       on subscribes.service_id = offered_in.service_id)
  where subscribes.customer_id = new.customer_id and offered_in.service_id = new.service_id;
end$$

delimiter ;

delimiter $$

create trigger remove_access
before delete
on subscribes for each row
begin
  delete from has_access_to
    where (has_access_to.customer_id in
      (select subscribes.customer_id
        from (subscribes join offered_in
              on subscribes.service_id = offered_in.service_id)
       where subscribes.customer_id = old.customer_id and subscribes.service_id = old.service_id))
     and has_access_to.place_id in
     	(select offered_in.place_id
         from (subscribes join offered_in
               on subscribes.service_id = offered_in.service_id)
         where subscribes.customer_id = old.customer_id and subscribes.service_id = old.service_id);
end$$

delimiter ;
