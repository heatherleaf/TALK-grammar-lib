--# -path=.:../Common:prelude:alltenses

concrete DeluxSystemEng of DeluxSystem = 
    GodisSystemEng, SocketEng, RoomsEng, LampsEng ** DeluxSystemI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), (DeluxLexicon=DeluxLexiconEng);

-- lincat
-- Socket = NP;

-- lin
-- socket1 = sing_NP ["livingroom ceiling light"];
-- socket2 = sing_NP ["livingroom floor light"];
-- socket3 = sing_NP ["livingroom desktop light"];
-- socket4 = sing_NP ["hall ceilling light"];
-- socket5 = sing_NP ["kitchen ceiling light"];
-- socket6 = sing_NP ["bedroom ceiling light"];
-- socket7 = sing_NP ["bedroom desktop light"];

