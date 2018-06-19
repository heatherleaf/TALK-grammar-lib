--# -path=.:../Common:prelude:alltenses

concrete MP3GlobalEng2 of MP3Global = 
    GodisUserEng, MusicMMEng ** MP3GlobalI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), 
    (MP3System=MP3SystemEng), (MP3Lexicon=MP3LexiconEng);

