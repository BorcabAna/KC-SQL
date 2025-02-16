-- 9. Generar campo "info_by_phone_lg"

with unique_registers as (
  select *,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
)
select ivr_id,
       step_name,
       step_result,
      case
        when step_name = 'CUSTOMERINFOBYPHONE.TX' and step_result = 'OK' then 1
        else 0
      end as info_by_phone_lg
from unique_registers
where registers_id = 1
order by info_by_phone_lg DESC, calls_start_date_id DESC;