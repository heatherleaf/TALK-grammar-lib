--# -path=.:../Common:prelude:present

concrete TramUserIta of TramUser = GodisUserIta, StopsMMIta ** TramUserI
    with (Grammar=GrammarIta), (GodisLexicon=GodisLexiconIta), (TramLexicon=TramLexiconIta);


