--# -path=.:../Common:prelude:alltenses

concrete DeluxSystemSwe of DeluxSystem = 
    GodisSystemSwe, SocketSwe, RoomsSwe, LampsSwe ** DeluxSystemI with
    (Grammar=GrammarSwe), (GodisLang=GodisLangSwe), (DeluxLexicon=DeluxLexiconSwe);

-- lincat
-- Socket = NP;

-- lin
-- socket1 = sing_NP ["taklampan i vardagsrummet"];
-- socket2 = sing_NP ["golvlampan i vardagsrummet"];
-- socket3 = sing_NP ["skrivbordslampan i vardagsrummet"];
-- socket4 = sing_NP ["taklampan i hallen"];
-- socket5 = sing_NP ["taklampan i köket"];
-- socket6 = sing_NP ["taklampan i sovrummet"];
-- socket7 = sing_NP ["skrivbordslampan i sovrummet"];


