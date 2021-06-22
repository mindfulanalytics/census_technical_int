with events as (

    select
        id,
        time,
        name,
        user_id,
        team_id
    from events -- analytical events, events taken in the platform

)

select * from events