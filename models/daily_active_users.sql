with events as (

    select
        id,
        time,
        name,
        user_id,
        team_id
    from events -- analytical events, events taken in the platform

),

aggregate_daily as (

    select 
        concat( extract(year from time) , '-', extract(month from time),'-', extract(day from time)  ) as event_at,
        count(distinct user_id) as daily_active_users
    from events
    group by 1

)

select *
from aggregate_daily
order by event_at asc