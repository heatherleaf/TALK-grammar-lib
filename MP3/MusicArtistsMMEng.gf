--# -path=.:../Common:prelude:alltenses

concrete MusicArtistsMMEng of MusicArtists = MusicArtistsMMI with
    (MusicArtists=MusicArtistsEng), (Cat=CatEng);

