--# -path=.:../Common:prelude:present

concrete TramUserSpa of TramUser = GodisUserSpa, StopsMMSpa ** TramUserI
    with (Grammar=GrammarSpa), (GodisLexicon=GodisLexiconSpa), (TramLexicon=TramLexiconSpa);

