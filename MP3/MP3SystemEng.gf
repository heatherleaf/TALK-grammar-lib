--# -path=.:../Common:prelude:alltenses

concrete MP3SystemEng of MP3System = GodisSystemEng, MusicEng ** MP3SystemI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), (MP3Lexicon=MP3LexiconEng);

