--# -path=.:../Common:prelude:present

concrete TramSystemSwe of TramSystem = GodisSystemSwe, StopsSwe, LinesSwe ** TramSystemI with
    (Grammar=GrammarSwe), (GodisLexicon=GodisLexiconSwe), (TramLexicon=TramLexiconSwe);
