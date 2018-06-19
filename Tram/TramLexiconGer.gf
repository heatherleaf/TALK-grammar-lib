--# -path=.:../Common:prelude:present

concrete TramLexiconGer of TramLexicon = CatGer ** 
    open Prelude, ParadigmsGer, ParamX, 
      (Lex=LexiconGer), (Irr=IrregGer), GrammarGer in {

lin

-- Adjectives
short_A = Lex.short_A;

-- Adverbs
there      = mkAdv (variants{"hier";"da"}); 
from_there = mkAdv (variants{"hieraus";"daher"});
to_there   = mkAdv (variants{"hierher";"dahin"});

-- Conjunctions
and_then_Conj = {s = ["und dann"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "Hilfe";
route_N     = regN "Weg" ; ----
stop_N      = regN "Haltestelle" ;
way_N       = regN "Weg" ;

-- Prepositions
from_Prep   = (mkPrep "von" dative) ;
to_Prep     = (mkPrep "nach" dative) ;

-- Verb-1
go_V        = Irr.fahren_V;
help_V      = Irr.helfen_V ;

restart_VP  = UseV (prefixV "wieder" (regV "starten")) ;

-- Verb-2
get_V2       = dirV2 haben_V;
go_from_V2   = mkV2 (seinV Irr.fahren_V) (mkPrep "von" dative) ;
go_to_V2     = mkV2 (seinV Irr.fahren_V) (mkPrep "nach" dative) ;
find_V2      = dirV2 Irr.finden_V ;
findout_V2   = dirV2 Irr.finden_V ;
take_V2      = dirV2 Irr.nehmen_V ;

the_shortest_route = 
    DetCN (DetSg (SgQuant DefArt) (OrdSuperl Lex.short_A)) (UseN (variants{regN "Weg"})) ;

}
