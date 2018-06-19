--# -path=.:../Common:prelude:present

concrete TramSystemFre of TramSystem = 
    GodisSystemFre, StopsFre, LinesFre ** TramSystemI with 
    (Grammar=GrammarFre), (GodisLexicon=GodisLexiconFre), (TramLexicon=TramLexiconFre);

