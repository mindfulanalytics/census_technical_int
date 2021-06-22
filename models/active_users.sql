with events as (

    select
        id,
        time,
        name,
        user_id,
        team_id
    from events -- analytical events, events taken in the platform

),

users as (
    select 
        id,
        first_name,
        last_name,
        email,
        created_at,
        team_id -- can be null, no mulitple teams
    from users

),

distict_user_id as (

select
    distinct user_id
from events

)

select 
    count(user_id)
from distict_user_id