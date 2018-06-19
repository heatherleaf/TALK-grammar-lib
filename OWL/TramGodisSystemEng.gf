--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

-- This file was automatically created by owl_godis.pl

concrete TramGodisSystemEng of TramGodisSystem = 
    GodisSystemEng, TramGodisDataEng ** 
    TramGodisSystemI with 
    (Grammar=GrammarEng), 
    (GodisLang=GodisLangEng), 
    (TramGodisLexicon=TramGodisLexiconEng); 
