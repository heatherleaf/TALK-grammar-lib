--# -path=.:../Common:prelude:alltenses

abstract MP3Lexicon = Cat ** {

fun

-- Adjectives
available_A : A;

-- Adverbs
forward_Adv : Adv;

-- Nouns
artist_N,
help_N,
music_N,
name_N,
playback_N,
player_N,
playlist_N,
song_N,
top_menu_N,
volume_N    : N;

-- Prepositions
by_Prep : Prep;
-- with_Prep

-- Verbs-1
help_V,
play_V,
restart_V,
rewind_V,
shuffle_V,
stop_V,
wind_V         : V;

-- Verbs-2
add_V2,
clear_V2,
control_V2,
delete_V2,
get_V2,
handle_V2,
increase_V2,
listen_to_V2,
lower_V2,
made_V2,
manage_V2,
play_V2,
return_to_V2,
shuffle_V2,
start_V2,
stop_V2,
switchon_V2,
turnon_V2,
write_V2    : V2;

-- Verbs-3
add_to_V3,
delete_from_V3   : V3;

}
