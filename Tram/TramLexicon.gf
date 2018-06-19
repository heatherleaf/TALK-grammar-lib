--# -path=.:../Common:prelude:present

abstract TramLexicon = Cat ** {

fun

-- The functions should be in alphabetical order
-- within each category

-- Adjectives
short_A : A;

-- Adverbs
there,
from_there,
to_there : Adv;

-- Conjunctions
and_then_Conj : Conj;

-- Nouns
help_N,
route_N,
stop_N,
way_N : N;

-- Prepositiona
from_Prep, 
to_Prep : Prep;

-- Verbs-1
go_V,
help_V  : V;

restart_VP : VP;

-- Verbs-2
get_V2,
go_from_V2,
go_to_V2,
find_V2,
findout_V2,
take_V2 : V2;

the_shortest_route : NP ;

}





