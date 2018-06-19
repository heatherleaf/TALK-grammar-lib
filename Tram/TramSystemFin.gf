--# -path=.:../Common:prelude:present

concrete TramSystemFin of TramSystem = GodisSystemFin, StopsFin, LinesFin ** TramSystemI with 
    (Grammar=GrammarFin), (GodisLexicon=GodisLexiconFin), (TramLexicon=TramLexiconFin);

