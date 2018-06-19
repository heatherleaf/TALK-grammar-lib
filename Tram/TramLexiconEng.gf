--# -path=.:../Common:prelude:present

concrete TramLexiconEng of TramLexicon = CatEng ** 
    open Prelude, ParadigmsEng, ParamX, GrammarEng, 
         (Lex=LexiconEng), (Irr=IrregEng), (Res=ResEng) in {

lin

-- Adjectives
short_A = Lex.short_A;

-- Adverbs
there      = mkAdv (variants{"here";"there"}); 
from_there = mkAdv ("from" ++ variants{"here";"there"});
to_there   = mkAdv ("to" ++ variants{"here";"there"});

-- Conjunctions
and_then_Conj = {s = ["and then"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "help";
route_N     = regN "route";
stop_N      = regN "stop";
way_N       = regN "way";


-- Prepositions
from_Prep   = ss "from";
to_Prep     = ss "to";

-- Verb-1
go_V        = Lex.go_V;
help_V      = regV "help";

restart_VP  = UseV (regV "restart");

-- Verb-2
get_V2       = dirV2 Irr.get_V;
go_from_V2   = dirV2 (partV Lex.go_V "from");
go_to_V2     = dirV2 (partV Lex.go_V "to");
find_V2      = Lex.find_V2;
findout_V2   = dirV2 (partV Irr.find_V "out");
take_V2      = dirV2 Irr.take_V;

the_shortest_route = 
    DetCN (DetSg (SgQuant DefArt) (OrdSuperl (regA "short"))) (UseN (variants{regN "way";regN "route"})) ;

}
