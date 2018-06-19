--# -path=.:../Common:prelude:present

concrete TramUserGer of TramUser = GodisUserGer, StopsMMGer ** TramUserI
    with (Grammar=GrammarGer), (GodisLexicon=GodisLexiconGer), (TramLexicon=TramLexiconGer);

