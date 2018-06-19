--# -path=.:../Common:prelude:alltenses

concrete DeluxUserSwe of DeluxUser = 
    DeluxGlobalSwe ** DeluxUserI with 
    (Grammar=GrammarSwe), (GodisLang=GodisLangSwe), 
    (DeluxSystem=DeluxSystemSwe), (DeluxLexicon=DeluxLexiconSwe);


