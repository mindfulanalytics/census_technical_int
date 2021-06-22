with events as (

    select
        id,
        time,
        name,
        user_id,
        team_id,
        lag(time) over(partition by user_id order by time asc) as previous_event_time
    from events -- analytical events, events taken in the platform

),

intermediate as (

select 
    *,
    extract(epoch from time - previous_event_time ) as events_time_difference
 from events
 where user_Id is not null
 order by user_id desc, time 
 
),

final as (

select 
    *,
    case 
        when events_time_difference < 3600
        then 1
        else 0 
    end as session_grouping
from intermediate

)

select
    user_id,
    count(id) as total_number_of_sessions_by_user
from final
where session_grouping = 0
group by 1
order by user_id desc