--# -path=.:../Common:prelude:present

concrete TramSystemEng of TramSystem = GodisSystemEng, StopsEng, LinesEng ** TramSystemI with 
    (Grammar=GrammarEng), (GodisLexicon=GodisLexiconEng), (TramLexicon=TramLexiconEng);

