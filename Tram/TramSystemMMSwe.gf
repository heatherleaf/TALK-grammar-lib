--# -path=.:../Common:prelude:present

concrete TramSystemMMSwe of TramSystem = 
    GodisSystemMMSwe, StopsMMSwe, LinesMMSwe ** TramSystemMMI with 
    (Grammar=GrammarSwe), (GodisLexicon=GodisLexiconSwe), (TramLexicon=TramLexiconSwe), (TramSystemI=TramSystemSwe);

