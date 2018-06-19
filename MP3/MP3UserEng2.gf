--# -path=.:../Common:prelude:alltenses

concrete MP3UserEng2 of MP3User = 
    MP3GlobalEng2 ** MP3UserI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), 
    (MP3System=MP3SystemEng), (MP3Lexicon=MP3LexiconEng);

