{{
    config(
        materialized='view'
    )
}}

with appearances_data as (
    select *
    from {{ ref('stg_appearances') }}
)

select 
    player_name,
    extract(year from date_appearances) as year,
    sum(goals) as total_goals, 
    sum(assists) as total_assists,
    sum(player_statistics) as total_player_statistics
from    
    appearances_data
group by 
    player_name,
    year