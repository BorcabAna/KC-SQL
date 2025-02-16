-- 3. Crear Tabla de ivr_detail

create table `keepcoding.ivr_detail` as
select
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    ivr_calls.start_date,
    format_date('%Y%m%d', date(ivr_calls.start_date)) as calls_start_date_id, -- Convierte el formato de fecha en "YYYYMMDD"
    ivr_calls.end_date,
    format_date('%Y%m%d', date(ivr_calls.end_date)) as calls_end_date_id, -- Convierte el formato de fecha en "YYYYMMDD"
    ivr_calls.total_duration,
    ivr_calls.customer_segment,
    ivr_calls.ivr_language,
    ivr_calls.steps_module,
    ivr_calls.module_aggregation,
    ivr_modules.module_sequence,
    ivr_modules.module_name,
    ivr_modules.module_duration,
    ivr_modules.module_result,
    ivr_steps.step_sequence,
    ivr_steps.step_name,
    ivr_steps.step_result,
    ivr_steps.step_description_error,
    ivr_steps.document_type,
    ivr_steps.document_identification,
    ivr_steps.customer_phone,
    ivr_steps.billing_account_id
  from
    `keepcoding-ana-borrero.keepcoding.ivr_calls` as ivr_calls
    inner join `keepcoding-ana-borrero`.`keepcoding`.`ivr_modules` as ivr_modules 
     on ivr_calls.ivr_id = ivr_modules.ivr_id
    inner join `keepcoding-ana-borrero`.`keepcoding`.`ivr_steps` as ivr_steps 
     on ivr_calls.ivr_id = ivr_steps.ivr_id;

