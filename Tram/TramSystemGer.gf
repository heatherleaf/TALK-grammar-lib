--# -path=.:../Common:prelude:present

concrete TramSystemGer of TramSystem = 
  GodisSystemGer, StopsGer, LinesGer ** TramSystemI with
  (Grammar=GrammarGer), (GodisLexicon=GodisLexiconGer), (TramLexicon=TramLexiconGer);
