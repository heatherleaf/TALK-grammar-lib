--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

-- This file was automatically created by owl_godis.pl

concrete TramGodisUserSwe of TramGodisUser = 
    GodisUserSwe, TramGodisDataSwe ** 
    TramGodisUserI with 
    (TramGodisSystem=TramGodisSystemSwe), 
    (Grammar=GrammarSwe), 
    (GodisLang=GodisLangSwe), 
    (TramGodisLexicon=TramGodisLexiconSwe); 
