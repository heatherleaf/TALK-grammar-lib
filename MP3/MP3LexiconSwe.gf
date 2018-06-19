--# -path=.:../Common:prelude:alltenses

concrete MP3LexiconSwe of MP3Lexicon = CatSwe ** 
    open Prelude, ParadigmsSwe, LexiconSwe, IrregSwe in {

lin

-- Adjectives
available_A = regA "tillgänglig";

-- Adverbs
forward_Adv = mkAdv "framåt";

-- Nouns
artist_N    = regGenN "artist" utrum;
help_N      = regGenN "hjälp" utrum;
music_N     = music_N;
name_N      = name_N;
playback_N  = regGenN "uppspelning" utrum;
player_N    = regGenN "spelare" utrum;
playlist_N  = regGenN "spellista" utrum;
song_N      = regGenN "låt" utrum;
top_menu_N  = regGenN "huvudmeny" utrum;
volume_N    = regGenN "volym" utrum;

-- Prepositions
by_Prep     = variants{mkPrep "av"; mkPrep "med"};

-- Verbs-1
help_V      = mk2V "hjälpa" "hjälpte";
play_V      = regV "spela";
restart_V   = partV (regV "startar") "om";
rewind_V    = partV (regV "spolar") "bakåt";
shuffle_V   = regV "blandar";
stop_V      = stop_V;
wind_V      = partV (regV "spolar") "framåt";

-- Verbs-2
add_V2       = dirV2 (partV lägga_V "till");
clear_V2     = dirV2 (regV "rensar");
control_V2   = dirV2 (regV "hanterar"); -- "kontrollerar");
delete_V2    = dirV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "bort");
get_V2       = variants {have_V2; dirV2 (irregV "få" "fick" "fått")};
handle_V2    = dirV2 (regV "hanterar");
increase_V2  = dirV2 (regV "ökar");
listen_to_V2 = dirV2 (partV (regV "lyssnar") "på");
lower_V2     = dirV2 (regV "minskar");
made_V2      = dirV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord");
manage_V2    = dirV2 (regV "hanterar");
play_V2      = play_V2;
return_to_V2 = dirV2 (partV (regV "återgår") "till");
shuffle_V2   = dirV2 (regV "blandar");
start_V2     = dirV2 (regV "startar");
stop_V2      = dirV2 stop_V;
switchon_V2  = switch8on_V2;
turnon_V2    = dirV2 (partV (mkV "sätta" "sätter" "sätt" "satte" "satt" "satt") "på");
write_V2     = write_V2;

-- Verbs-3
add_to_V3      = add_V3;
delete_from_V3 = dirV3 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "bort") (mkPrep "från");

}
