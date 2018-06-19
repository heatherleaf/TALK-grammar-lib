--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

-- This file was automatically created by owl_godis.pl

concrete TramGodisUserEng of TramGodisUser = 
    GodisUserEng, TramGodisDataEng ** 
    TramGodisUserI with 
    (TramGodisSystem=TramGodisSystemEng), 
    (Grammar=GrammarEng), 
    (GodisLang=GodisLangEng), 
    (TramGodisLexicon=TramGodisLexiconEng); 
