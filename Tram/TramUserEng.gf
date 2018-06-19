--# -path=.:../Common:prelude:present

concrete TramUserEng of TramUser = GodisUserEng, StopsMMEng ** TramUserI
    with (Grammar=GrammarEng), (GodisLexicon=GodisLexiconEng), (TramLexicon=TramLexiconEng);

