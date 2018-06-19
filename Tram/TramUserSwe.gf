--# -path=.:../Common:prelude:present

concrete TramUserSwe of TramUser = GodisUserSwe, StopsMMSwe ** TramUserI
    with (Grammar=GrammarSwe), (GodisLexicon=GodisLexiconSwe), (TramLexicon=TramLexiconSwe);

