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
<<<<<<< HEAD
        (yellow_cards+red_cards) as total_cards
        (goals+1) as goals_plus_one
=======
        (yellow_cards+red_cards) as total_cards,
        (goals+assists) as statist
>>>>>>> 4314eb4f5ad69af927ae78584528a479ec23775e

    from source

)

select * from renamed
