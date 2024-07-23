with 

source as (

    select * from {{ source('staging', 'appearances') }}

),

renamed as (

    select
        appearance_id,
        game_id,
        player_id as appearances_player_id,
        player_club_id,
        player_current_club_id,
        cast(date as date) as date_appearances,
        extract(year from cast(date as date)) as year_appearances,
        player_name,
        competition_id,
        yellow_cards,
        red_cards,
        goals,
        assists,
        minutes_played,
        (yellow_cards+red_cards) as total_cards,
        (goals+assists) as player_statistics

    from source

)

select * from renamed

