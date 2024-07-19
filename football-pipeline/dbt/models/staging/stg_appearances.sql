with 

source as (

    select * from {{ source('staging', 'appearances') }}

),

renamed as (

    select
        appearance_id,
        game_id,
        player_id,
        player_club_id,
        player_current_club_id,
        date,
        player_name,
        competition_id,
        yellow_cards,
        red_cards,
        goals,
        assists,
        minutes_played,
        (yellow_cards+red_cards) as total_cards

    from source

)

select * from renamed
