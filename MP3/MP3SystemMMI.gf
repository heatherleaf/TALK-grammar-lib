
incomplete concrete MP3SystemMMI of MP3System =
	open MP3SystemI, (Sem=MP3SystemSem), (MM=GodisMM) in {

lin 

available_song_Q = available_song_Q ** MM.sem (Sem.available_song_Q);
available_song_P x1 = available_song_P x1 ** MM.sem (Sem.available_song_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

available_artist_Q = available_artist_Q ** MM.sem (Sem.available_artist_Q);
available_artist_P x1 = available_artist_P x1 ** MM.sem (Sem.available_artist_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);

current_song_Q = current_song_Q ** MM.sem (Sem.current_song_Q);
current_song_P x1 = current_song_P x1 ** MM.sem (Sem.current_song_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

song_to_play_Q = song_to_play_Q ** MM.sem (Sem.song_to_play_Q);
song_to_play_P x1 = song_to_play_P x1 ** MM.sem (Sem.song_to_play_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

song_to_add_Q = song_to_add_Q ** MM.sem (Sem.song_to_add_Q);
song_to_add_P x1 = song_to_add_P x1 ** MM.sem (Sem.song_to_add_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

song_to_delete_Q = song_to_delete_Q ** MM.sem (Sem.song_to_delete_Q);
song_to_delete_P x1 = song_to_delete_P x1 ** MM.sem (Sem.song_to_delete_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

artist_available_song_Q = artist_available_song_Q ** MM.sem (Sem.artist_available_song_Q);
artist_available_song_P x1 = artist_available_song_P x1 ** MM.sem (Sem.artist_available_song_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);

song_available_artist_Q = song_available_artist_Q ** MM.sem (Sem.song_available_artist_Q);
song_available_artist_P x1 = song_available_artist_P x1 ** MM.sem (Sem.song_available_artist_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);

artist_to_play_Q = artist_to_play_Q ** MM.sem (Sem.artist_to_play_Q);
artist_to_play_P x1 = artist_to_play_P x1 ** MM.sem (Sem.artist_to_play_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);

artist_to_add_Q = artist_to_add_Q ** MM.sem (Sem.artist_to_add_Q);
artist_to_add_P x1 = artist_to_add_P x1 ** MM.sem (Sem.artist_to_add_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);

artist_to_delete_Q = artist_to_delete_Q ** MM.sem (Sem.artist_to_delete_Q);
artist_to_delete_P x1 = artist_to_delete_P x1 ** MM.sem (Sem.artist_to_delete_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);


medialib_artist_P x1 = medialib_artist_P x1 ** MM.sem (Sem.medialib_artist_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);
playlist_artist_P x1 = playlist_artist_P x1 ** MM.sem (Sem.playlist_artist_P x1.sem) ** MM.shortForm (shortAns (artist x1)) (x1.sem);
medialib_song_P x1 = medialib_song_P x1 ** MM.sem (Sem.medialib_song_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);
playlist_song_P x1 = playlist_song_P x1 ** MM.sem (Sem.playlist_song_P x1.sem) ** MM.shortForm (shortAns (song x1)) (x1.sem);


artist x1 = artist x1 ** MM.sem (Sem.artist x1.sem);
song x1 = song x1 ** MM.sem (Sem.song x1.sem);


top = top ** MM.sem (Sem.top);
help = help ** MM.sem (Sem.help);
control_playback = control_playback ** MM.sem (Sem.control_playback);
play = play ** MM.sem (Sem.play);
pause = pause ** MM.sem (Sem.pause);
play_item = play_item ** MM.sem (Sem.play_item);
fast_forward = fast_forward ** MM.sem (Sem.fast_forward);
rewind = rewind ** MM.sem (Sem.rewind);
control_volume = control_volume ** MM.sem (Sem.control_volume);
vol_down = vol_down ** MM.sem (Sem.vol_down);
vol_up = vol_up ** MM.sem (Sem.vol_up);
manage_playlist = manage_playlist ** MM.sem (Sem.manage_playlist);
playlist_add = playlist_add ** MM.sem (Sem.playlist_add);
playlist_delete = playlist_delete ** MM.sem (Sem.playlist_delete);
playlist_clear = playlist_clear ** MM.sem (Sem.playlist_clear);
playlist_shuffle = playlist_shuffle ** MM.sem (Sem.playlist_shuffle);

}
