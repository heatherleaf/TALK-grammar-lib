--# -path=.:../Common:prelude:present

concrete TramSystemIta of TramSystem = 
    GodisSystemIta, StopsIta, LinesIta ** TramSystemI with 
    (Grammar=GrammarIta), (GodisLexicon=GodisLexiconIta), (TramLexicon=TramLexiconIta);

