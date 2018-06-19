--# -path=.:../Common:../MP3:prelude:alltenses

concrete DeluxSystemMMEng of DeluxSystem =
    GodisSystemMMEng, SocketMMEng, RoomsMMEng, LampsMMEng ** DeluxSystemMMI with
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), (GodisLexicon=GodisLexiconEng), 
    (DeluxLexicon=DeluxLexiconEng), (DeluxSystemI=DeluxSystemEng);

