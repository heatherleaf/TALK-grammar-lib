--# -path=.:../Common:prelude

abstract MP3System = GodisSystem, Music ** {

fun 

-- reraise_top     : Move;
-- icm_und_int_top : Move;


-- Predicates
-- Questions and Propositions as they are intended to be used 
-- by either System or User

-- U: which songs are there?
available_song_Q : Question;
-- S: they have made Song
available_song_P : Song -> Proposition;

-- U: which artists are there?
available_artist_Q : Question;
-- S: Artist is available
available_artist_P : Artist -> Proposition;

-- U: what am i listening to?
current_song_Q : Question;
-- S: you are listening to Song
current_song_P : Song -> Proposition;

-- S: which song do you want to listen to?
song_to_play_Q : Question;
-- U: i want to listen to Song
song_to_play_P : Song -> Proposition;

-- S: which song do you want to add?
song_to_add_Q : Question;
-- U: i want to add Song
song_to_add_P : Song -> Proposition;

-- S: which song do you want to delete?
song_to_delete_Q : Question;
-- U: i want to delete Song
song_to_delete_P : Song -> Proposition;

-- S: for which artist do you want the available songs?
artist_available_song_Q : Question;
-- U: i want to know the available songs for Artist
artist_available_song_P : Artist -> Proposition;

-- S: for which song do you want the available artists?
song_available_artist_Q : Question;
-- U: i want to know the available artists for Song
song_available_artist_P : Song -> Proposition;

-- S: which artist to you want to play?
artist_to_play_Q : Question;
-- U: i want to play Artist
artist_to_play_P : Artist -> Proposition;

-- S: which artist do you want to add?
artist_to_add_Q : Question;
-- U: i want to add Artist
artist_to_add_P : Artist -> Proposition;

-- S: which artist do you want to delete?
artist_to_delete_Q : Question;
-- U: i want to delete Artist
artist_to_delete_P : Artist -> Proposition;


-- clicking in the GUI
medialib_artist_P : Artist -> Proposition;
playlist_artist_P : Artist -> Proposition;
medialib_song_P   : Song -> Proposition;
playlist_song_P   : Song -> Proposition;


-- Sorts
-- Used for Short Answers by the User

-- U: Artist == U: it is Artist i want to ...
artist : Artist -> ShortAns;
-- U: Song   == U: it is Song i want to ...
song : Song -> ShortAns;


-- Actions
-- System utterances for confirming Actions

-- S: returning to the top menu
top : Action;

-- S: dj-godis is an mp3-player
help : Action;

-- S: ready to handle the player
control_playback : Action;

-- S: starting the player
play : Action;

-- S: the music is stopped
pause : Action;

-- S: playing the song
play_item : Action;

-- S: winding forward
fast_forward : Action;

-- S: rewinding
rewind : Action;

-- S: controlling the volume
control_volume : Action;

-- S: lowering the volume
vol_down : Action;

-- S: increasing the volume
vol_up : Action;

-- S: ready to managing the playlist
manage_playlist : Action;

-- S: added a song to the playlist
playlist_add : Action;

-- S: deleted a song from the playlist
playlist_delete : Action;

-- S: the playlist is cleared
playlist_clear : Action;

-- S: the playlist is shuffled
playlist_shuffle  : Action;

}
