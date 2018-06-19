--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

abstract TramGodisSystem = 
    GodisSystem, TramGodisData ** {


-- Short answers
fun stop : Stop -> ShortAns;
fun route : Route -> ShortAns;
fun location : Location -> ShortAns;

-- Actions
fun help : Action;
fun top : Action;

-- Predicates
fun destination : Stop -> Proposition;
fun destination' : Question;
fun departure : Stop -> Proposition;
fun departure' : Question;
fun shortest_route : Route -> Proposition;
fun shortest_route' : Question;
}
