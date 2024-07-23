{{
    config(
        materialized='view'
    )
}}

with appearances_data as (
    select *
    from {{ ref('stg_appearances') }}
),
player_valuations_data as (
    select *
    from {{ ref('stg_player_valuations') }}
)
select 
    a.player_name,
    extract(year from p.date_player_valuations) as year,
    avg(p.market_value_in_eur) as avg_market_value_in_eur
from appearances_data a
inner join player_valuations_data p 
    on a.appearances_player_id = p.player_valuations_player_id
group by 
    a.player_name,
    year