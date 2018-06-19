--# -path=.:../Common:prelude

concrete MP3GlobalSem of MP3Global = GodisUserSem, MusicSem ** 
    open Prolog, GodisApp, MP3SystemSem in {

oper

mp3 : App = app "domain_player";

lin

-- Predicates

current_song = mp3 ** pm1 (ask current_song_Q);
not_current_song = mp3 ** pm1 (answer (not (issue current_song_Q)));

medialib_click x y = mp3 ** pm2
    (answer (medialib_artist_P y))
    (answer (medialib_song_P x));

playlist_click x y = mp3 ** pm2 
    (answer (playlist_artist_P y))
    (answer (playlist_song_P x));

-- Actions

control_playback = mp3 ** pm1 (request control_playback);

pause = mp3 ** pm1 (request pause);

play_item = mp3 ** pm1 (request play_item);
play_item__song x = mp3 ** pm2 (request play_item) (answer (song_to_play_P x));
play_item__artist y = mp3 ** pm2 (request play_item) (answer (artist_to_play_P y));
play_item__song_artist x y
    = mp3 ** pm3 (request play_item) (answer (song_to_play_P x)) (answer (artist_to_play_P y));

play_medialib__song_artist x y
    = mp3 ** pm3 (request play_item) (answer (medialib_song_P x)) (answer (medialib_artist_P y));
play_playlist__song_artist x y
    = mp3 ** pm3 (request play_item) (answer (playlist_song_P x)) (answer (playlist_artist_P y));

fast_forward = mp3 ** pm1 (request fast_forward);

rewind = mp3 ** pm1 (request rewind);

control_volume = mp3 ** pm1 (request control_volume);

vol_down = mp3 ** pm1 (request vol_down);
  
vol_up = mp3 ** pm1 (request vol_up);

manage_playlist = mp3 ** pm1 (request manage_playlist);

playlist_add = mp3 ** pm1 (request playlist_add);
playlist_add__song x = mp3 ** pm2 (request playlist_add) (answer (song_to_add_P x));
playlist_add__artist y = mp3 ** pm2 (request playlist_add) (answer (artist_to_add_P y));
playlist_add__song_artist x y
    = mp3 ** pm3 (request playlist_add) (answer (song_to_add_P x)) (answer (artist_to_add_P y));

add_medialib__song_artist x y
    = mp3 ** pm3 (request playlist_add) (answer (medialib_song_P x)) (answer (medialib_artist_P y));

playlist_delete = mp3 ** pm1 (request playlist_delete);
playlist_delete__song x = mp3 ** pm2 (request playlist_delete) (answer (song_to_delete_P x));
playlist_delete__artist y = mp3 ** pm2 (request playlist_delete) (answer (artist_to_delete_P y));
playlist_delete__song_artist x y
    = mp3 ** pm3 (request playlist_delete) (answer (song_to_delete_P x)) (answer (artist_to_delete_P y));

delete_playlist__song_artist x y
    = mp3 ** pm3 (request playlist_delete) (answer (playlist_song_P x)) (answer (playlist_artist_P y));

playlist_clear = mp3 ** pm1 (request playlist_clear);

playlist_shuffle = mp3 ** pm1 (request playlist_shuffle);


oper medialib_song_P   = pp1 "medialib_song";
     medialib_artist_P = pp1 "medialib_artist";
     playlist_song_P   = pp1 "playlist_song";
     playlist_artist_P = pp1 "playlist_artist";    


----------------------------------------------------------------------
-- action answers

lincat SysAction = PStr;
lin
top_mp3_AA = top;
help_AA = help;
control_playback_AA = control_playback;
play_AA = play;
pause_AA = pause;
play_item_AA = play_item;
fast_forward_AA = fast_forward;
rewind_AA = rewind;
control_volume_AA = control_volume;
vol_down_AA = vol_down;
vol_up_AA = vol_up;
manage_playlist_AA = manage_playlist;
playlist_add_AA = playlist_add;
playlist_delete_AA = playlist_delete;
playlist_clear_AA = playlist_clear;
playlist_shuffle_AA = playlist_shuffle;

answerAction    act = mp3 ** pm1 (request act);
answerNegAction act = mp3 ** pm1 (answer (not (action act)));

----------------------------------------------------------------------
-- predicate answers

lincat SysProp = PStr;
lin
song_to_play_P s = song_to_play_P s;
song_to_add_P s = song_to_add_P s;
song_to_delete_P  s= song_to_delete_P s;
song_available_artist_P s = song_available_artist_P s;
artist_to_play_P a = artist_to_play_P a;
artist_to_add_P a = artist_to_add_P a;
artist_to_delete_P a = artist_to_delete_P a;
artist_available_song_P a = artist_available_song_P a;

answerProp    p = mp3 ** pm1 (answer p);
answerNegProp p = mp3 ** pm1 (answer (not p));

}

