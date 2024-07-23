{{
    config(
        materialized='table'
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
select *
from appearances_data
inner join player_valuations_data on appearances_data.appearances_player_id=player_valuations_data.player_valuations_player_id