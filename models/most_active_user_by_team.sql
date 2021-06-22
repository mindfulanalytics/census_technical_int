with events as (

    select
        id,
        time,
        name,
        user_id,
        team_id,
        count(id) over(partition by user_id) as count_user_events
    from events -- analytical events, events taken in the platform

),

aggregate as (

select 
    *,
    max(count_user_events) over(partition by team_id) as max_events_user_team
from events

)

select 
    distinct team_id,
    user_id
from aggregate
where count_user_events = max_events_user_team
order by team_id asc