--# -path=.:../Common:../MP3:prelude:alltenses

concrete DeluxSystemMMSwe of DeluxSystem =
    GodisSystemMMSwe, SocketMMSwe, RoomsMMSwe, LampsMMSwe ** DeluxSystemMMI with
    (Grammar=GrammarSwe), (GodisLang=GodisLangSwe), (GodisLexicon=GodisLexiconSwe), 
    (DeluxLexicon=DeluxLexiconSwe), (DeluxSystemI=DeluxSystemSwe);

