--# -path=.:../Common:prelude:present

concrete TramSystemMMIta of TramSystem = 
    GodisSystemMMIta, StopsMMIta, LinesMMIta ** TramSystemMMI with 
    (Grammar=GrammarIta), (GodisLexicon=GodisLexiconIta), (TramLexicon=TramLexiconIta), (TramSystemI=TramSystemIta);

