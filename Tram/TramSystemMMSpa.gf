--# -path=.:../Common:prelude:present

concrete TramSystemMMSpa of TramSystem = 
    GodisSystemMMSpa, StopsMMSpa, LinesMMSpa ** TramSystemMMI with 
    (Grammar=GrammarSpa), (GodisLexicon=GodisLexiconSpa), (TramLexicon=TramLexiconSpa), (TramSystemI=TramSystemSpa);

