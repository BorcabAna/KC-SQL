-- 7. Generar campo " billing_account_id"

with unique_registers as (
  select *,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
  where billing_account_id IS NOT NULL
)
select ivr_id,
       billing_account_id
from unique_registers
where registers_id = 1;