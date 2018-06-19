--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

incomplete concrete TramGodisSystemI of TramGodisSystem = 
    GodisSystemI, TramGodisDataI ** 
    open Grammar, GodisLang, TramGodisLexicon in {


-- Short answers
lin stop x_stop = x_stop;
lin route x_route = x_route;
lin location x_location = x_location;

-- Actions
lin help  = isDoing ** (use_V help_V);
lin top  = isDoing ** (use_V restart_V);

-- Predicates
lin destination x_destination = isDoing ** (you_want_to_VP (V2_NP go_to_V2 x_destination));
lin destination'  = isDoing ** (which_N_do_you_want_to_V2 stop_N go_to_V2);
lin departure x_departure = isDoing ** (you_want_to_VP (V2_NP go_from_V2 x_departure));
lin departure'  = isDoing ** (which_N_do_you_want_to_V2 stop_N go_from_V2);
lin shortest_route x_shortest_route = isDoing ** (generic_VP (V2_NP take_V2 x_shortest_route));
lin shortest_route'  = isDoing ** (what_is_NP (the_A_super_N_sg short_A route_N));
}
