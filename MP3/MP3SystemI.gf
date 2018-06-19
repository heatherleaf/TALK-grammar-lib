
incomplete concrete MP3SystemI of MP3System = 
    open Grammar, GodisLang, MP3Lexicon in {

lin

-- reraise_top     = fullStop  ** UttNP (the_N_sg top_menu_N); 
-- icm_und_int_top = questMark ** cncUtt (UttS (useCl (you_want_to_VP 
--                                        (V2_the_N return_to_V2 top_menu_N)  
--                                         ** isDoing))) 
--                                       is_that_correct_Post; 

-- Predicates and Questions 

song_to_play_Q       = isDoing ** which_N_do_you_want_to_V2 song_N play_V2;
song_to_play_P     x = isDoing ** you_want_to_VP (ComplV2 play_V2 x);

artist_to_play_Q     = isDoing ** which_N_do_you_want_to_V2 artist_N play_V2;
artist_to_play_P   x = isDoing ** you_want_to_VP (ComplV2 play_V2 x);

song_to_add_Q        = isDoing ** which_N_do_you_want_to_V2 song_N add_V2;
song_to_add_P      x = isDoing ** you_want_to_VP (ComplV2 add_V2 x);

artist_to_add_Q      = isDoing ** which_N_do_you_want_to_V2 artist_N add_V2;
artist_to_add_P    x = isDoing ** you_want_to_VP (ComplV2 add_V2 x);

song_to_delete_Q     = isDoing ** which_N_do_you_want_to_V2 song_N delete_V2;
song_to_delete_P   x = isDoing ** you_want_to_VP (ComplV2 delete_V2 x);

artist_to_delete_Q   = isDoing ** which_N_do_you_want_to_V2 artist_N delete_V2;
artist_to_delete_P x = isDoing ** you_want_to_VP (ComplV2 delete_V2 x);

available_song_Q     = isDoing ** which_N_are_AP song_N (PositA available_A);
available_song_P   x = isDoing ** NP_Cl x;
-- NP_is_AP x (PositA available_A);
-- PredVP (UsePron they_Pron) (ComplV2 made_V2 x);

available_artist_Q   = isDoing ** which_N_are_AP artist_N (PositA available_A);
available_artist_P x = isDoing ** NP_Cl x;

current_song_Q       = isDoing ** what_is_NP (NP_of_NP (the_N_sg name_N) (this_N_sg song_N));
current_song_P     x = isDoing ** you_are_VPing (ComplV2 listen_to_V2 x);

artist_available_song_Q   = hasDone ** who_VP (ComplV2 write_V2 (this_N_sg song_N));
artist_available_song_P x = isDoing ** it_is_NP_who_VP x 
    (hasDone ** ComplV2 write_V2 (this_N_sg song_N));

song_available_artist_Q   = hasDone ** which_N_has_NP_V2 song_N (this_N_sg artist_N) write_V2;
song_available_artist_P x = hasDone ** PredVP (this_N_sg artist_N) (ComplV2 write_V2 x);


medialib_artist_P x = isDoing ** NP_Cl x;
playlist_artist_P x = isDoing ** NP_Cl x;
medialib_song_P   x = isDoing ** NP_Cl x;
playlist_song_P   x = isDoing ** NP_Cl x;


-- Short answers

artist x = x;
song   x = x;


-- Actions

top              = isDoing ** UseV restart_V;

help             = isDoing ** ComplV2 get_V2 (DetCN (DetSg MassDet NoOrd) (UseN help_N));

control_playback = isDoing ** ComplV2 control_V2 (mass_N playback_N);
    -- V2_the_N handle_V2 player_N;

play             = isDoing ** ComplV2 start_V2 (the_N_sg player_N);

pause            = hasDone ** V2_the_N stop_V2 music_N;

play_item        = isDoing ** ComplV2 play_V2 (indef_N_sg song_N);

fast_forward     = isDoing ** AdvVP (UseV wind_V) forward_Adv;

rewind           = isDoing ** UseV rewind_V; 

control_volume   = isDoing ** V2_the_N control_V2 volume_N;

vol_down         = isDoing ** V2_the_N lower_V2 volume_N;

vol_up           = isDoing ** V2_the_N increase_V2 volume_N;

manage_playlist  = isDoing ** V2_the_N manage_V2 playlist_N;

playlist_add     = hasDone ** ComplV3 add_to_V3 (indef_N_sg song_N) (the_N_sg playlist_N);

playlist_delete  = hasDone ** ComplV3 delete_from_V3 (indef_N_sg song_N) (the_N_sg playlist_N);

playlist_clear   = hasDone ** V2_the_N clear_V2 playlist_N;

playlist_shuffle = hasDone ** V2_the_N shuffle_V2 playlist_N;

}
