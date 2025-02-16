-- 11. Generar campos " repeated_phone_24H" y "cause_recall_phone_24H"

with unique_registers as (
  select *,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
)
select a.ivr_id,
       a.phone_number,
       a.start_date,

    case 
        when exists(
          select 1
          from `keepcoding.ivr_detail` d 
          where d.phone_number = a.phone_number
          and d.start_date between timestamp_sub(a.start_date, INTERVAL 24 HOUR)
           and a.start_date
          and d.ivr_id <> a.ivr_id
        ) then 1
      else 0
    end as repeated_phone_24H,

    case 
      when exists(
          select 1
          from `keepcoding.ivr_detail` d 
          where d.phone_number = a.phone_number
          and d.start_date between timestamp_add(a.start_date, INTERVAL 24 HOUR)
           and a.start_date
          and d.ivr_id <> a.ivr_id
      ) then 1
      else 0
    end as cause_recall_phone_24H
from unique_registers a
where registers_id = 1;

