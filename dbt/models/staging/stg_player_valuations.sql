{{
    config(
        materialized='view'
    )
}}

with 

source as (

    select * from {{ source('staging', 'player_valuations') }}

),

renamed as (

    select
        player_id as player_valuations_player_id,
        cast(date as date) as date_player_valuations,
        market_value_in_eur,
        current_club_id,
        player_club_domestic_competition_id
    from source
    
)

select * from renamed


