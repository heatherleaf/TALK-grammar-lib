--# -path=.:../Common:prelude:present

concrete TramLexiconFin of TramLexicon = CatFin ** 
    open Prelude, ParadigmsFin, ParamX, (Lex=LexiconFin), GrammarFin in {

lin

-- Adjectives
short_A = Lex.short_A;

-- Adverbs
there      = variants{here_Adv; there_Adv};
from_there = variants{here7from_Adv; there7from_Adv};
to_there   = variants{here7to_Adv; there7to_Adv};

-- Conjunctions
and_then_Conj = {s = ["ja sitten"]; n = Pl; lock_Conj = <>};

-- Nouns
help_N      = regN "apu";
route_N     = regN "reitti";
stop_N      = regN "pys‰kki";
way_N       = regN "tie";

-- Prepositions
from_Prep   = casePrep from_Case ; ----
to_Prep     = casePrep to_Case ; ----

-- Verb-1
go_V        = Lex.go_V;
help_V      = regV "auttaa";

restart_VP  = AdvVP (UseV (regV "aloittaa")) (mkAdv "alusta");

-- Verb-2
get_V2       = caseV2 (reg3V "saada" "saan" "sai") partitive ;
go_from_V2   = caseV2 Lex.go_V from_Case ;
go_to_V2     = caseV2 Lex.go_V to_Case ;
find_V2      = Lex.find_V2;
findout_V2   = dirV2 (regV "selvitt‰‰");
take_V2      = dirV2 (regV "ottaa") ;

the_shortest_route = 
    DetCN (DetSg (SgQuant DefArt) (OrdSuperl Lex.short_A)) (UseN (variants{regN "reitti"})) ;

oper

to_Case   : Case = variants {allative ; illative} ;
from_Case : Case = variants {ablative ; elative} ;

}
