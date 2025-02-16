-- 4. Generar el campo vdn_aggregation

select 
    ivr_id,
    case
      when starts_with(vdn_label, 'ATC') then 'FRONT'
      when starts_with(vdn_label, 'TECH') then 'TECH'
      when vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
      else 'RESTO'
    end as vdn_aggregation
 from `keepcoding.ivr_calls`