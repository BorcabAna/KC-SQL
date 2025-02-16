-- 8. Generar campo " masiva_lg"

with unique_registers as (
  select *,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
)
select ivr_id,
       module_name,
       case
        when module_name = 'AVERIA_MASIVA' then 1
        else 0
      end as masiva_lg
from unique_registers
where registers_id = 1; 