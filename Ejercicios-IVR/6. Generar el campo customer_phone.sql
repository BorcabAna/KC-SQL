-- 6. Generar campo "customer_phone"

with unique_registers as (
  select *,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
  where phone_number IS NOT NULL
)
select ivr_id,
       phone_number as customer_phone
from unique_registers
where registers_id = 1;