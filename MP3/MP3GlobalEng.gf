--# -path=.:../Common:prelude:alltenses

concrete MP3GlobalEng of MP3Global = GodisUserEng, MusicMMEng ** 
    open Prelude, GodisLangEng, MP3SystemEng, ResEng, Prolog, 
         MP3LexiconEng, (P=MP3SystemSem), GodisMM in {

oper

S_by_A : NP -> NP -> Str
    = \s,a -> variants{s.s!Nom ++ variants{"with";"by"} ++ a.s!Nom;
		       a.s!Nom ++ "with" ++ s.s!Nom;
		       "the" ++ a.s!Nom ++ "song" ++ s.s!Nom;
		       a.s!Gen ++ optStr "song" ++ s.s!Nom};



-- predicates 
lin

current_song = issueClick P.current_song_Q
    (variants{askQS current_song_Q;
	      ss ["what is the name of the current song"];
	      ss ["which song is this"]});

not_current_song = issueNegClick P.current_song_Q;

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
    (variants{reqVP control_playback;
	      req1 ["handle the player"]});

pause = noClick -- actionClick P.pause
    (variants{reqVP pause;
	      req1 (stop ++ optStr (variants{["the music"]; 
					     ["the player"]; 
					     "playing"}))});

play_item = noClick -- actionClick P.play_item
    (variants{reqVP play_item; 
	      req1 ["turn on the player"];
	      req1 ["listen to a song"]; 
	      req1 ("play" ++ optStr music)});
play_item__song x = 
    maybeClick (req1x "play" (x.s!Nom))
    (req1 ("play" ++ thisSong)) (P.answer (P.song_to_play_P x.sem));
play_item__artist y = 
    maybeClick (req1x "play" (y.s!Nom))
    (req1 ("play" ++ thisArtist)) (P.answer (P.artist_to_play_P y.sem));
play_item__song_artist x y = 
    noClick (req1x "play" (S_by_A x y));

play_medialib__song_artist x y = justClick2
    (variants{reqVP play_item; 
	      req1 ("play" ++ variants { music; thisSong; [] })})
    (medialib_artist y.sem)
    (medialib_song x.sem);

play_playlist__song_artist x y = justClick2
    (variants{reqVP play_item; 
	      req1 ("play" ++ variants { music; thisSong; [] })}) 
    (playlist_artist y.sem)
    (playlist_song x.sem);

fast_forward = noClick -- actionClick P.fast_forward
    (reqVP fast_forward);

rewind = noClick -- actionClick P.rewind
   (reqVP rewind);

control_volume = noClick -- actionClick P.control_volume
    (reqVP control_volume);

vol_down = noClick -- actionClick P.vol_down
    (variants{reqVP vol_down;
	      req1 ["turn down the volume"];
	      req1 ["turn the volume down"]});

vol_up = noClick -- actionClick P.vol_up
    (reqVP vol_up);

manage_playlist = noClick -- actionClick P.manage_playlist
    (reqVP manage_playlist);

playlist_add = noClick -- actionClick P.playlist_add
    (variants{reqVP playlist_add;
	      req1x "add" (optStr (["a song"] ++ to_playlist))});
playlist_add__song   x = 
    maybeClick (req1x "add" (x.s!Nom ++ to_playlist))
    (req1x "add" (thisSong ++ toPlaylist)) (P.answer x.sem);
playlist_add__artist y = 
    maybeClick (req1x "add" (optStr ["a song by"] ++ 
				 variants{y.s!Nom ++ to_playlist;
					  to_playlist ++ "by" ++ y.s!Nom}))
    (req1x "add" (thisArtist ++ toPlaylist)) (P.answer y.sem);
playlist_add__song_artist x y = noClick (req1x "add" (S_by_A x y ++ to_playlist));

add_medialib__song_artist x y = justClick2 (req1 ("add" ++ thisSong))
                                           (medialib_artist y.sem)
                                           (medialib_song x.sem);

playlist_delete = noClick -- actionClick P.playlist_delete
    (variants{reqVP playlist_delete;
	      req1x delete (optStr (["a song"] ++ from_playlist))});
playlist_delete__song   x = 
    maybeClick (req1x delete (x.s!Nom ++ from_playlist))
    (req1x "delete" (thisSong ++ fromPlaylist)) (P.answer x.sem);
playlist_delete__artist y = 
    maybeClick (req1x delete (y.s!Nom ++ from_playlist))
    (req1x "delete" (thisArtist ++ fromPlaylist)) (P.answer y.sem);
playlist_delete__song_artist x y = noClick (req1x delete (S_by_A x y ++ from_playlist));

delete_playlist__song_artist x y = justClick2 (req1 (variants{"delete"; "remove"} ++ thisSong))
                                              (playlist_artist y.sem)
                                              (playlist_song x.sem);

playlist_clear = noClick -- actionClick P.playlist_clear
    (reqVP playlist_clear);
                           
playlist_shuffle = noClick -- actionClick P.playlist_shuffle
    (variants{reqVP playlist_shuffle;
	      req1 ["shuffle"]});

oper 
    to_playlist   : Str = optStr ["to the playlist"];
    from_playlist : Str = optStr ["from the playlist"];
    delete        : Str = variants{"delete";"remove"};
    stop          : Str = variants{"pause";"stop"};
    music         : Str = variants{["the playlist"];["the player"];["the music"]};
    thisSong      : Str = optStr (this_that_Str ++ optStr "song");
    thisArtist    : Str = optStr (this_that_Str ++ optStr "artist");
    toPlaylist    : Str = optStr ["to the playlist"];
    fromPlaylist  : Str = optStr ["from the playlist"];


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

