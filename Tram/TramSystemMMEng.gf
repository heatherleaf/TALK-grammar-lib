--# -path=.:../Common:prelude:present

concrete TramSystemMMEng of TramSystem = 
    GodisSystemMMEng, StopsMMEng, LinesMMEng ** TramSystemMMI with 
    (Grammar=GrammarEng), (GodisLexicon=GodisLexiconEng), 
    (TramLexicon=TramLexiconEng), (TramSystemI=TramSystemEng);

