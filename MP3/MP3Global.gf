--# -path=.:../Common:prelude

abstract MP3Global = GodisUser, Music ** {

fun

------------------------------------------------------------------------
-- Predicates
-- Questions used by the User

-- U: what is the name of the current song?
current_song : Question;
not_current_song : Answer;

medialib_click : Song -> Artist -> Answer;

playlist_click : Song -> Artist -> Answer;


-------------------------------------------------------------------------
-- Actions
-- User utterances to trigger Actions

-- U: control the playback
control_playback : Action; -- ActionOrAnswer;

-- U: stop
pause : Action; -- ActionOrAnswer;

-- U: play a song / play Song / play Artist / play Song by Artist
play_item              : Action; -- ActionOrAnswer;
play_item__song        : Song -> Action;
play_item__artist      : Artist -> Action;
play_item__song_artist : Song -> Artist -> Action;

-- U: play this ; click Song Artist -- in MP3GUI 
play_medialib__song_artist : Song -> Artist -> Action;
play_playlist__song_artist : Song -> Artist -> Action;

-- U: wind forward 
fast_forward : Action; -- ActionOrAnswer;

-- U: rewind
rewind : Action; -- ActionOrAnswer;

-- U: control the volume
control_volume : Action; -- ActionOrAnswer;

-- U: lower the volume
vol_down : Action; -- ActionOrAnswer;
  
-- U: raise the volume
vol_up : Action; -- ActionOrAnswer;

-- U: manage the playlist
manage_playlist : Action; -- ActionOrAnswer;

-- U: add a song / add Song / add Artist / add Song by Artist
playlist_add              : Action; -- ActionOrAnswer;
playlist_add__song        : Song -> Action;
playlist_add__artist      : Artist -> Action;
playlist_add__song_artist : Song -> Artist -> Action;

-- U: add this ; click Song Artist
add_medialib__song_artist : Song -> Artist -> Action;

-- U: remove a song / remove Song / remove Artist / remove Song by Artist
playlist_delete              : Action; -- ActionOrAnswer;
playlist_delete__song        : Song -> Action;
playlist_delete__artist      : Artist -> Action;
playlist_delete__song_artist : Song -> Artist -> Action;

-- U: delete this ; click Song Artist
delete_playlist__song_artist : Song -> Artist -> Action;

-- U: clear the playlist
playlist_clear : Action; -- ActionOrAnswer;

-- U: shuffle the playlist
playlist_shuffle : Action; -- ActionOrAnswer;


----------------------------------------------------------------------
-- action answers

cat SysAction;
fun
top_mp3_AA,
help_AA,
control_playback_AA,
play_AA,
pause_AA,
play_item_AA,
fast_forward_AA,
rewind_AA,
control_volume_AA,
vol_down_AA,
vol_up_AA,
manage_playlist_AA,
playlist_add_AA,
playlist_delete_AA,
playlist_clear_AA,
playlist_shuffle_AA : SysAction;

answerAction, answerNegAction : SysAction -> Answer;

----------------------------------------------------------------------
-- predicate answers

cat SysProp;
fun
song_to_play_P,
song_to_add_P,
song_to_delete_P,
song_available_artist_P : Song -> SysProp;
artist_to_play_P,
artist_to_add_P,
artist_to_delete_P,
artist_available_song_P : Artist -> SysProp;

answerProp, answerNegProp : SysProp -> Answer;

}

