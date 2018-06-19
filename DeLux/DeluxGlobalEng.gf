--# -path=.:../Common:prelude:alltenses

concrete DeluxGlobalEng of DeluxGlobal = 
    GodisUserEng, RoomsMMEng, LampsMMEng ** DeluxGlobalI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), 
    (DeluxSystem=DeluxSystemEng), (DeluxLexicon=DeluxLexiconEng);

