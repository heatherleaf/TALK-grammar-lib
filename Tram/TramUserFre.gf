--# -path=.:../Common:prelude:present

concrete TramUserFre of TramUser = GodisUserFre, StopsMMFre ** TramUserI
    with (Grammar=GrammarFre), (GodisLexicon=GodisLexiconFre), (TramLexicon=TramLexiconFre);
