--# -path=.:../Common:prelude:alltenses

concrete MP3UserSwe2 of MP3User = 
    MP3GlobalSwe2 ** MP3UserI with 
    (Grammar=GrammarSwe), (GodisLang=GodisLangSwe), 
    (MP3System=MP3SystemSwe), (MP3Lexicon=MP3LexiconSwe);

