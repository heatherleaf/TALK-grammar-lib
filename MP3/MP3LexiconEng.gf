--# -path=.:../Common:prelude:alltenses

concrete MP3LexiconEng of MP3Lexicon = CatEng ** 
    open Prelude, ParadigmsEng, LexiconEng, (Irr=IrregEng) in {

lin

-- Adjectives
available_A = regA "available";

-- Adverbs
forward_Adv = mkAdv "forward";

-- Nouns
artist_N    = regN "artist";
help_N      = regN "help";
music_N     = music_N;
name_N      = name_N;
playback_N  = regN "playback";    
player_N    = regN "player";
playlist_N  = regN "playlist";
song_N      = song_N;
top_menu_N  = compoundN "top" (regN "menu");
volume_N    = regN "volume";

-- Prepositions
by_Prep     = variants{mkPrep "by"; mkPrep "with"};

-- Verb-1
help_V      = regV "help";
play_V      = play_V;
restart_V   = regV "restart";
rewind_V    = irregV "rewind" "rewound" "rewound";
shuffle_V   = regV "shuffle";
stop_V      = stop_V;
wind_V      = irregV "wind" "wound" "wound";

-- Verb-2
add_V2       = dirV2 (regV "add");
clear_V2     = dirV2 (regV "clear");
control_V2   = dirV2 (regV "control");
delete_V2    = dirV2 (regV "delete");
get_V2       = dirV2 Irr.get_V;
handle_V2    = dirV2 (regV "handle");
increase_V2  = dirV2 (regV "increase");
listen_to_V2 = dirV2 (partV (regV "listen") "to");
lower_V2     = dirV2 (regV "lower");
made_V2      = dirV2 (irregV "make" "made" "made");
manage_V2    = dirV2 (regV "manage");
play_V2      = play_V2;
return_to_V2 = dirV2 (partV (regV "return") "to" );
shuffle_V2   = dirV2 (regV "shuffle");
start_V2     = dirV2 (regV "start");
stop_V2      = dirV2 stop_V;
switchon_V2  = switch8on_V2;
turnon_V2    = dirV2 (partV turn_V "on");
write_V2     = write_V2;


-- Verb-3
add_to_V3      = add_V3;
delete_from_V3 = dirV3 (regV "delete") (mkPrep "from");
 
}
