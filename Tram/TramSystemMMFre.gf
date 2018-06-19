--# -path=.:../Common:prelude:present

concrete TramSystemMMFre of TramSystem = 
    GodisSystemMMFre, StopsMMFre, LinesMMFre ** TramSystemMMI with 
    (Grammar=GrammarFre), (GodisLexicon=GodisLexiconFre), 
    (TramLexicon=TramLexiconFre), (TramSystemI=TramSystemFre);

