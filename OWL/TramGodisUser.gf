--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

abstract TramGodisUser = 
    GodisUser, TramGodisData ** {


-- Answers
fun destination_1 : Stop -> Answer;
fun destination_2 : Stop -> Stop -> Answer;
fun departure_3 : Stop -> Answer;
fun departure_4 : Stop -> Stop -> Answer;

-- Questions
fun shortest_route_5 : Question;
fun shortest_route_6 : Stop -> Question;
fun shortest_route_7 : Question;
fun shortest_route_8 : Stop -> Question;
fun shortest_route_9 : Question;

-- Short answers
fun stop_10 : Stop -> Stop -> ShortAns;
fun stop_11 : Stop -> Stop -> ShortAns;
fun stop_12 : Stop -> ShortAns;
fun location_13 : Location -> ShortAns;

-- Actions
fun help_14 : Action;
fun top_15 : Action;
}
