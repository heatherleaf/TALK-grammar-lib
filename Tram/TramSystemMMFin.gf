--# -path=.:../Common:prelude:present

concrete TramSystemMMFin of TramSystem = 
    GodisSystemMMFin, StopsMMFin, LinesMMFin ** TramSystemMMI with 
    (Grammar=GrammarFin), (GodisLexicon=GodisLexiconFin), (TramLexicon=TramLexiconFin), (TramSystemI=TramSystemFin);

