--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete AgendaSystemSwe of AgendaSystem = GodisSystemSwe, BookingSwe ** AgendaSystemI with
    (GodisLang=GodisLangSwe), (Grammar=GrammarSwe), (AgendaLexicon=AgendaLexiconSwe);
