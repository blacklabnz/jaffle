{% test max_amount_value(model, column_name) %}

with validation as (

    select
        {{ column_name }} as amount

    from {{ model }}

),

validation_errors as (

    select
        amount

    from validation
    -- if this is true, then even_field is actually odd!
    where amount >= 59

)

select *
from validation_errors

{% endtest %}