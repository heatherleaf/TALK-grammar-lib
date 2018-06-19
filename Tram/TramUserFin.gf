--# -path=.:../Common:prelude:present

concrete TramUserFin of TramUser = GodisUserFin, StopsMMFin ** TramUserI
    with (Grammar=GrammarFin), (GodisLexicon=GodisLexiconFin), (TramLexicon=TramLexiconFin);

