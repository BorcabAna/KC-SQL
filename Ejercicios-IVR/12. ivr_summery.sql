-- 12. CREAR TABLA DE ivr_summary

create table `keepcoding.ivr_summary` as
select
    ivr_id,
    phone_number,
    ivr_result,
    vdn_aggregation,
    min(start_date) as start_date,
    max(end_date) as end_date,
    max(total_duration) as total_duration,
    customer_segment,
    ivr_language,
    count(distinct(module_sequence)) as steps_module,
    string_agg(distinct module_name, ',') as module_aggregation,
    document_type,
    document_identification,
    customer_phone,
    billing_account_id,
    max(masiva_lg) as massiva_lg,
    max(info_by_phone_lg) as info_by_phone_lg,
    max(info_by_dni_lg) as info_by_dni_lg,
    max(repeated_phone_24h) as repeated_phone_24h,
    max(cause_recall_phone_24h) as cause_recall_phone_24h,
  from `keepcoding.ivr_detail` as ivr_detail
  group by ivr_id, phone_number, ivr_result, customer_segment, ivr_language, document_type, document_identification, customer_phone, billing_account_id;