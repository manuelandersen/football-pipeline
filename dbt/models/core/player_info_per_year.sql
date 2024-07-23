{{
    config(
        materialized='table'
    )
}}

with stats_per_year as (
    select *
    from {{ ref('player_stats_per_year') }}
), 
market_value_per_year as (
    select *
    from {{ ref('players_market_values_per_year') }}
)
select
    m.player_name as player_name, 
    m.year as year_date,
    m.avg_market_value_in_eur as avg_market_value_in_eur,
    s.total_goals as total_goals, 
    s.total_assists as total_assists,
    s.total_player_statistics as total_player_statistics

from
    market_value_per_year m
    inner join stats_per_year s 
        on m.player_name = s.player_name and m.year = s.year