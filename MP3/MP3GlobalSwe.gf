--# -path=.:../Common:prelude:alltenses

concrete MP3GlobalSwe of MP3Global = GodisUserSwe, MusicMMSwe ** 
    open Prelude, GrammarSwe, GodisLangSwe, MP3LexiconSwe, Prolog,
         MP3SystemSwe, CommonScand, (P=MP3SystemSem), GodisMM in {

oper S_by_A : NP -> NP -> Str
    = \s,a -> variants{s.s!NPNom ++ variants{"med";"av"} ++ a.s!NPNom;
		       a.s!NPNom ++ "med" ++ s.s!NPNom;
		       a.s!(NPPoss SgUtr) ++ optStr "låt" ++ s.s!NPNom};


-- predicates 

lin

current_song = issueClick P.current_song_Q
    (variants{askQS current_song_Q;
 	      ss ["vilken låt är det här"]});

not_current_song = issueNegClick P.current_song_Q;

oper vilka_finns : Str = ["vilka låtar finns det"];
oper vilka_har   : Str = ["vilka låtar har"];
oper honhan      : Str = variants{"de";"hon";"han"};
oper gjort       : Str = variants{"gjort";"skrivit"};
oper någon_låt   : Str = variants{["något"];["någonting"];["nånting"];["någon låt"];["några låtar"]};

lin 

medialib_click x y = justClick2 (ss (optStr this_that_Str)) 
                                (medialib_artist y.sem)
                                (medialib_song x.sem);

playlist_click x y = justClick2 (ss (optStr this_that_Str)) 
                                (playlist_artist y.sem)
                                (playlist_song x.sem);


oper

medialib_artist : PStr -> PStr = \ x ->
  P.answer (P.medialib_artist_P x);

medialib_song : PStr -> PStr = \ x ->  
  P.answer (P.medialib_song_P x);

playlist_artist : PStr -> PStr = \ x -> 
  P.answer (P.playlist_artist_P x);
                                
playlist_song : PStr -> PStr = \ x ->
  P.answer (P.playlist_song_P x);


-- actions

lin

control_playback = noClick -- actionClick P.control_playback
    (reqVP control_playback);

pause = noClick -- actionClick P.pause
    (variants{reqVP pause;
	      req2x "paus" "pausa" ""});   
                 
play_item = noClick -- actionClick P.play_item
    (variants{reqVP play; 
	      reqVP (UseV play_V); 
	      reqVP (V2_the_N
			 (variants{turnon_V2;switchon_V2}) 
			 (variants{music_N;player_N}))});

play_item__song x = 
    maybeClick (variants{spela (x.s!NPNom);
			 req1x "starta" (x.s!NPNom)})
    (req1 ("spela" ++ thisSong)) (P.answer x.sem);

play_item__artist y = 
    maybeClick (variants{spela (y.s!NPNom);
			 req1x "starta" (y.s!NPNom)})
    (req1 ("spela" ++ thisArtist)) (P.answer y.sem);

play_item__song_artist x y = 
    noClick (variants{spela (S_by_A x y);
                      req1x "starta" (y.s!NPNom)});
play_medialib__song_artist x y = justClick2 (variants{reqVP play_item; 
	                                              req1 "spela"})
                                            (medialib_artist y.sem)
                                            (medialib_song x.sem);

play_playlist__song_artist x y = justClick2 (variants{reqVP play_item; 
	                                              req1 "spela"}) 
                                            (playlist_artist y.sem)
                                            (playlist_song x.sem);

fast_forward = noClick -- actionClick P.fast_forward
    (reqVP fast_forward);

rewind = noClick -- actionClick P.rewind
    (reqVP rewind);

control_volume = noClick -- actionClick P.control_volume
    (reqVP control_volume);

vol_down = noClick -- actionClick P.vol_down
    (reqVP vol_down);

vol_up = noClick -- actionClick P.vol_up
    (reqVP vol_up);

manage_playlist = noClick -- actionClick P.manage_playlist
    (reqVP manage_playlist);

playlist_add = noClick -- actionClick P.playlist_add 
    (variants{lägg_till (optStr (["en låt"]));
	      utöka (optStr (["med en låt"]))});

playlist_add__song x = 
    maybeClick (variants{lägg_till (x.s!NPNom);
			 utöka ("med" ++ (x.s!NPNom))})
    (req1x ["lägg till"] (thisSong ++ toPlaylist)) (P.answer x.sem);

playlist_add__artist y = 
    maybeClick (variants{lägg_till (y.s!NPNom);
			 utöka ("med" ++ (y.s!NPNom))})
    (req1x ["lägg till"] (thisArtist ++ toPlaylist)) (P.answer y.sem);

playlist_add__song_artist x y = 
    noClick (variants{lägg_till (S_by_A x y);
                      utöka ("med" ++ S_by_A x y)});

add_medialib__song_artist x y = justClick2 (req1 (["lägg till"] ++ thisSong))
                                           (medialib_artist y.sem)
                                           (medialib_song x.sem);

playlist_delete = noClick -- actionClick P.playlist_delete
    (reqVP playlist_delete);

playlist_delete__song x =  
    maybeClick (ta_bort (x.s!NPNom))
    (req1x ["ta bort"] (thisSong ++ fromPlaylist)) (P.answer x.sem);

playlist_delete__artist y =  
    maybeClick (ta_bort (y.s!NPNom))
    (req1x ["ta bort"] (thisArtist ++ fromPlaylist)) (P.answer y.sem);

playlist_delete__song_artist x y = noClick (ta_bort (S_by_A x y));

delete_playlist__song_artist x y = justClick2 (req1 (["ta bort"] ++ thisSong))
                                              (playlist_artist y.sem)
                                              (playlist_song x.sem);

playlist_clear = noClick -- actionClick P.playlist_clear
    (reqVP playlist_clear);

playlist_shuffle = noClick -- actionClick P.playlist_shuffle
    (reqVP playlist_shuffle);

oper spela : Str -> UserAction = req1x "spela";
oper lägg_till : Str -> UserAction = \arg ->
	 req2x "lägg" "lägga" ("till" ++ arg ++ optStr (variants{"till";"i"} ++ "spellistan"));
oper utöka : Str -> UserAction = \arg ->
         req1x "utöka" ("spellistan" ++ arg);  
oper ta_bort : Str -> UserAction = \arg ->
         req1x ["ta bort"] (arg ++ optStr ["från spellistan"]);

oper
thisSong     : Str = optStr (this_that_Str ++ optStr "låten");
thisArtist   : Str = optStr (this_that_Str ++ optStr "artisten");
toPlaylist   : Str = optStr ["till spellistan"];
fromPlaylist : Str = optStr ["från spellistan"];


----------------------------------------------------------------------
-- action answers

lincat SysAction = PStr;
lin
top_mp3_AA = P.top;
help_AA = P.help;
control_playback_AA = P.control_playback;
play_AA = P.play;
pause_AA = P.pause;
play_item_AA = P.play_item;
fast_forward_AA = P.fast_forward;
rewind_AA = P.rewind;
control_volume_AA = P.control_volume;
vol_down_AA = P.vol_down;
vol_up_AA = P.vol_up;
manage_playlist_AA = P.manage_playlist;
playlist_add_AA = P.playlist_add;
playlist_delete_AA = P.playlist_delete;
playlist_clear_AA = P.playlist_clear;
playlist_shuffle_AA = P.playlist_shuffle;

answerAction    act = actionClick    act;
answerNegAction act = actionNegClick act;

----------------------------------------------------------------------
-- predicate answers

lincat SysProp = PStr;
lin
song_to_play_P x = P.song_to_play_P x.sem;
song_to_add_P x = P.song_to_add_P x.sem;
song_to_delete_P x = P.song_to_delete_P x.sem;
song_available_artist_P x = P.song_available_artist_P x.sem;
artist_to_play_P x = P.artist_to_play_P x.sem;
artist_to_add_P x = P.artist_to_add_P x.sem;
artist_to_delete_P x = P.artist_to_delete_P x.sem;
artist_available_song_P x = P.artist_available_song_P x.sem;

answerProp    p = propClick p;
answerNegProp p = propNegClick p;

}

