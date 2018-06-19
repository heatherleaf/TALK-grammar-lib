--# -path=.:../Common:prelude:present

concrete TramSystemSpa of TramSystem = 
    GodisSystemSpa, StopsSpa, LinesSpa ** TramSystemI with 
    (Grammar=GrammarSpa), (GodisLexicon=GodisLexiconSpa), (TramLexicon=TramLexiconSpa);

