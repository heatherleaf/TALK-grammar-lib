--# -path=.:../Common:prelude

abstract MP3User = MP3Global ** {

fun

------------------------------------------------------------------------
-- Predicates
-- Questions used by the User
 
-- U: what songs are available
available_song : Question;
-- U: what songs are there by Artist
available_song__artist : Artist -> Question;
 
-- U: what artists are available
available_artist : Question;
-- U: what artists have made Song
available_artist__song : Song -> Question;

not_available_song,
not_available_artist : Answer;



--medialib_song,  
--playlist_song   : Song -> Answer;


-------------------------------------------------------------------------
-- Sorts
-- Used for Short Answers by the User

-- U: Artist == U: it is Artist i want to ...
artist : Artist -> ShortAns;
-- U: Song == U: it is Song i want to ...
song : Song -> ShortAns;
-- U: Song by Artist == U: it is Song by Artist i want to ...
song_artist : Song -> Artist -> ShortAns;

not_artist : Artist -> ShortAns; 
not_song   : Song -> ShortAns;

-------------------------------------------------------------------------
-- Actions
-- we use Question since we do not want coordination

-- U: return to the top menu
top : Question; -- ActionOrAnswer;

-- U: help
help : Question; -- ActionOrAnswer;

}
