--# -path=.:../Common:prelude:alltenses

concrete DeluxUserEng of DeluxUser = 
    DeluxGlobalEng ** DeluxUserI with 
    (Grammar=GrammarEng), (GodisLang=GodisLangEng), 
    (DeluxSystem=DeluxSystemEng), (DeluxLexicon=DeluxLexiconEng);

