-- 5. Generar los campos "document_type" y "document_identification"

-- Comprobar registros duplicados a partir de las llamadas

select ivr_id, count(*) as registros
from `keepcoding.ivr_detail`
group by ivr_id
having count(*) > 1;

-- Como vemos que existen registros duplicados, vamos a asignarle un ID a cada grupo de registros con el mismo "ivr_id", para seleccionar un solo registro por llamada y creando los campos document_type y document_identification.


with unique_registers as (
  select ivr_id,
         document_type,
         document_identification,
         calls_start_date_id,
         row_number() over (partition by cast(ivr_id as INT64) order by calls_start_date_id DESC) as registers_id
  from `keepcoding.ivr_detail`
  where document_type IS NOT NULL
)
select ivr_id,
       document_type,
       document_identification
from unique_registers
where registers_id = 1;
