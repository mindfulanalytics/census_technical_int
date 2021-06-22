with users as (
    select 
        id,
        first_name,
        last_name,
        email,
        created_at,
        team_id -- can be null, no mulitple teams
    from users

)

select
    *
from users


