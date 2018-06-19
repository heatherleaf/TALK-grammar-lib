--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

incomplete concrete TramGodisUserI of TramGodisUser = 
    GodisUserI, TramGodisDataI ** 
    open Grammar, GodisLang, TramGodisSystem, TramGodisLexicon in {


-- Answers
lin destination_1 x_destination = (use_Adv (Prep_NP to_Prep x_destination));
lin destination_2 x_destination x_departure = (use_Adv (Prep_NP to_Prep (NP_Adv x_destination (Prep_NP from_Prep x_departure))));
lin departure_3 x_departure = (use_Adv (Prep_NP from_Prep x_departure));
lin departure_4 x_departure x_destination = (use_Adv (Prep_NP from_Prep (NP_Adv x_departure (Prep_NP to_Prep x_destination))));

-- Questions
lin shortest_route_5  = (use_VP (V2_NP find_V2 (indef_N_sg route_N)));
lin shortest_route_6 x_departure = (use_QCl (what_is_NP (NP_Adv (the_A_super_N_sg short_A route_N) (Prep_NP from_Prep x_departure))));
lin shortest_route_7  = (use_VP (V2_NP find_V2 (the_A_super_N_sg short_A route_N)));
lin shortest_route_8 x_destination = (use_QCl (what_is_NP (NP_Adv (the_A_super_N_sg short_A route_N) (Prep_NP to_Prep x_destination))));
lin shortest_route_9  = (use_QCl (what_is_NP (the_A_super_N_sg short_A route_N)));

-- Short answers
lin stop_10 x_stop x_destination = (use_NP (NP_Adv x_stop (Prep_NP to_Prep x_destination)));
lin stop_11 x_stop x_departure = (use_NP (NP_Adv x_stop (Prep_NP from_Prep x_departure)));
lin stop_12 x_stop = (use_NP x_stop);
lin location_13 x_location = (use_NP x_location);

-- Actions
lin help_14  = (use_VP (use_V help_V));
lin top_15  = (use_VP (use_V restart_V));
}
