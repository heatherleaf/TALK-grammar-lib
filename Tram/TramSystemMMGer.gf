--# -path=.:../Common:prelude:present

concrete TramSystemMMGer of TramSystem = 
    GodisSystemMMGer, StopsMMGer, LinesMMGer ** TramSystemMMI with 
    (Grammar=GrammarGer), (GodisLexicon=GodisLexiconGer), (TramLexicon=TramLexiconGer), (TramSystemI=TramSystemGer);

