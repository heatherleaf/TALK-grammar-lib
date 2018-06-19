--# -path=.:../Common:prelude:alltenses

concrete DeluxGlobalSwe of DeluxGlobal = 
    GodisUserSwe, RoomsMMSwe, LampsMMSwe ** DeluxGlobalI with 
    (Grammar=GrammarSwe), (GodisLang=GodisLangSwe), 
    (DeluxSystem=DeluxSystemSwe), (DeluxLexicon=DeluxLexiconSwe);

