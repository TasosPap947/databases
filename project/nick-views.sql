create view sales_per_service as
  select charge_description, sum(charge_amount) as total_service_sales
  from service_charge
  group by charge_description;


-- customer info also needs customer phones and emails --
create view customer_info as
  select first_name,
         last_name,
         date_of_birth,
         document_number,
         document_type,
         document_authority
  from customer
