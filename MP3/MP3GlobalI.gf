
incomplete concrete MP3GlobalI of MP3Global = 
    open Prelude, GodisLang, MP3System, Prolog, Grammar,
         MP3Lexicon, (P=MP3SystemSem), GodisMM in {


-- predicates 
lin

current_song = issueClick P.current_song_Q
    (askQS current_song_Q);

not_current_song = issueNegClick P.current_song_Q;

medialib_click x y = justClick2 (ansNP thisthat)
                                (medialib_artist y.sem)
                                (medialib_song x.sem);

playlist_click x y = justClick2 (ansNP thisthat)
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

control_playback = noClick
    (reqVP control_playback);

pause = noClick
    (reqVP pause);

fast_forward = noClick
    (reqVP fast_forward);

rewind = noClick
   (reqVP rewind);

control_volume = noClick
    (reqVP control_volume);

vol_down = noClick
    (reqVP vol_down);

vol_up = noClick
    (reqVP vol_up);

manage_playlist = noClick
    (reqVP manage_playlist);

playlist_clear = noClick
    (reqVP playlist_clear);
                           
playlist_shuffle = noClick
    (variants{reqVP playlist_shuffle; reqVP (UseV shuffle_V)});


play_item = noClick
    (reqVP play_item);
play_item__song x = 
    maybeClick (playNP x)
    (variants{playNP thisthatSong; playNP thisthat}) (P.answer x.sem);
play_item__artist y = 
    maybeClick (variants{playNP y; playNP (NP_Prep_NP by_Prep aSong y)})
    (variants{playNP thisthatArtist; playNP thisthat}) (P.answer y.sem);
play_item__song_artist s a = 
    {sNone  = variants{playNP (NP_Prep_NP by_Prep s a);
		       playNP (NP_Prep_NP with_Prep a s)};
     sLeft  = variants{playNP a;
		       playNP (NP_Prep_NP by_Prep thisthatSong a);
		       playNP (NP_Prep_NP by_Prep thisthat a);
		       playNP (NP_Prep_NP with_Prep a thisthatSong);
		       playNP (NP_Prep_NP with_Prep a thisthat)};
     sRight = variants{playNP s;
		       playNP (NP_Prep_NP by_Prep s thisthatArtist);
		       playNP (NP_Prep_NP by_Prep s thisthat);
		       playNP (NP_Prep_NP with_Prep thisthatArtist s);
		       playNP (NP_Prep_NP with_Prep thisthat s)};
     sBoth  = variants{playNP (NP_Prep_NP by_Prep thisthatSong thisthatArtist);
		       playNP (NP_Prep_NP by_Prep thisthatSong thisthat);
		       playNP (NP_Prep_NP by_Prep thisthat thisthatArtist);
		       playNP (NP_Prep_NP by_Prep thisthat thisthat);
		       playNP (NP_Prep_NP with_Prep thisthatArtist thisthatSong);
		       playNP (NP_Prep_NP with_Prep thisthatArtist thisthat);
		       playNP (NP_Prep_NP with_Prep thisthat thisthatSong);
		       playNP (NP_Prep_NP with_Prep thisthat thisthat)};
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};


playlist_add = noClick
    (variants{reqVP playlist_add; addNP aSong});
playlist_add__song   x = 
    maybeClick (addNP x)
    (variants{addNP thisthatSong; addNP thisthat}) (P.answer x.sem);
playlist_add__artist y = 
    maybeClick (variants{addNP y; addNP (NP_Prep_NP by_Prep aSong y)})
    (variants{addNP thisthatArtist; addNP thisthat}) (P.answer y.sem);
playlist_add__song_artist s a = 
    {sNone  = variants{addNP (NP_Prep_NP by_Prep s a);
		       addNP (NP_Prep_NP with_Prep a s)};
     sLeft  = variants{addNP a;
		       addNP (NP_Prep_NP by_Prep thisthatSong a);
		       addNP (NP_Prep_NP by_Prep thisthat a);
		       addNP (NP_Prep_NP with_Prep a thisthatSong);
		       addNP (NP_Prep_NP with_Prep a thisthat)};
     sRight = variants{addNP s;
		       addNP (NP_Prep_NP by_Prep s thisthatArtist);
		       addNP (NP_Prep_NP by_Prep s thisthat);
		       addNP (NP_Prep_NP with_Prep thisthatArtist s);
		       addNP (NP_Prep_NP with_Prep thisthat s)};
     sBoth  = variants{addNP (NP_Prep_NP by_Prep thisthatSong thisthatArtist);
		       addNP (NP_Prep_NP by_Prep thisthatSong thisthat);
		       addNP (NP_Prep_NP by_Prep thisthat thisthatArtist);
		       addNP (NP_Prep_NP by_Prep thisthat thisthat);
		       addNP (NP_Prep_NP with_Prep thisthatArtist thisthatSong);
		       addNP (NP_Prep_NP with_Prep thisthatArtist thisthat);
		       addNP (NP_Prep_NP with_Prep thisthat thisthatSong);
		       addNP (NP_Prep_NP with_Prep thisthat thisthat)};
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};


playlist_delete = noClick
    (variants{reqVP playlist_delete; delNP aSong});
playlist_delete__song   x = 
    maybeClick (delNP x)
    (variants{delNP thisthatSong; delNP thisthat}) (P.answer x.sem);
playlist_delete__artist y = 
    maybeClick (variants{delNP y; delNP (NP_Prep_NP by_Prep aSong y)})
    (variants{delNP thisthatArtist; delNP thisthat}) (P.answer y.sem);
playlist_delete__song_artist s a = 
    {sNone  = variants{delNP (NP_Prep_NP by_Prep s a);
		       delNP (NP_Prep_NP with_Prep a s)};
     sLeft  = variants{delNP a;
		       delNP (NP_Prep_NP by_Prep thisthatSong a);
		       delNP (NP_Prep_NP by_Prep thisthat a);
		       delNP (NP_Prep_NP with_Prep a thisthatSong);
		       delNP (NP_Prep_NP with_Prep a thisthat)};
     sRight = variants{delNP s;
		       delNP (NP_Prep_NP by_Prep s thisthatArtist);
		       delNP (NP_Prep_NP by_Prep s thisthat);
		       delNP (NP_Prep_NP with_Prep thisthatArtist s);
		       delNP (NP_Prep_NP with_Prep thisthat s)};
     sBoth  = variants{delNP (NP_Prep_NP by_Prep thisthatSong thisthatArtist);
		       delNP (NP_Prep_NP by_Prep thisthatSong thisthat);
		       delNP (NP_Prep_NP by_Prep thisthat thisthatArtist);
		       delNP (NP_Prep_NP by_Prep thisthat thisthat);
		       delNP (NP_Prep_NP with_Prep thisthatArtist thisthatSong);
		       delNP (NP_Prep_NP with_Prep thisthatArtist thisthat);
		       delNP (NP_Prep_NP with_Prep thisthat thisthatSong);
		       delNP (NP_Prep_NP with_Prep thisthat thisthat)};
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};


play_medialib__song_artist x y = justClick2
    (variants{reqVP play_item; playNP thisthatSong; playNP thisthat})
    (medialib_artist y.sem)
    (medialib_song x.sem);

play_playlist__song_artist x y = justClick2
    (variants{reqVP play_item; playNP thisthatSong; playNP thisthat})
    (playlist_artist y.sem)
    (playlist_song x.sem);

add_medialib__song_artist x y = justClick2
    (variants{addNP thisthatSong; addNP thisthat})
    (medialib_artist y.sem)
    (medialib_song x.sem);

delete_playlist__song_artist x y = justClick2
    (variants{delNP thisthatSong; delNP thisthat})
    (playlist_artist y.sem)
    (playlist_song x.sem);

oper 

aSong          : NP = indef_N_sg song_N;
thisthatSong   : NP = variants{this_N_sg song_N; that_N_sg song_N};
thisthatArtist : NP = variants{this_N_sg artist_N; that_N_sg artist_N};
thisthat       : NP = variants{this_NP; that_NP};

playNP : NP -> SS = \x -> reqVP (ComplV2 play_V2 x);
addNP  : NP -> SS = \x -> variants{reqVP (ComplV2 add_V2 x);
				   reqVP (AdvVP (ComplV2 add_V2 x) (Prep_NP to_Prep (the_N_sg playlist_N)))};
delNP  : NP -> SS = \x -> variants{reqVP (ComplV2 delete_V2 x);
				   reqVP (AdvVP (ComplV2 delete_V2 x) (Prep_NP from_Prep (the_N_sg playlist_N)))};


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

