--# -path=.:../Common:prelude

concrete MP3UserSem of MP3User = MP3GlobalSem ** 
    open Prolog, GodisApp, MP3SystemSem in {

oper

mp3a : App = app "domain_player";

lin

-- Predicates

available_song = mp3a ** pm1 (ask available_song_Q);

available_song__artist x = mp3a ** pm2 (ask available_song_Q) (shortAns (artist x));

available_artist = mp3a ** pm1 (ask available_artist_Q);

available_artist__song x = mp3a ** pm2 (ask available_artist_Q) (shortAns (song x));

not_available_song = mp3a ** pm1 (answer (not (issue available_song_Q)));

not_available_artist = mp3a ** pm1 (answer (not (issue available_artist_Q)));



--medialib_song x = mp3a ** pm1 (answer (pp1 "medialib_song" x));

--playlist_song x = mp3a ** pm1(answer (pp1 "playlist_song" x)); 

-- Short answers

artist x = mp3a ** pm1 (shortAns (artist x));

song   x = mp3a ** pm1 (shortAns (song x));

song_artist x y = mp3a ** pm2 (shortAns (song x)) (shortAns (artist y));

not_song x = mp3a ** pm1 (shortAns (not (song x)));

not_artist x = mp3a ** pm1 (shortAns (not (artist x)));


-- Actions

top  = mp3a ** pm1 (request (pp0 "top"));

help = mp3a ** pm1 (request help);

}

