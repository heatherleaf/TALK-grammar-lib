--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

concrete TramGodisUserSem of TramGodisUser = 
    GodisUserSem, TramGodisDataSem ** 
    open Prolog, TramGodisSystemSem in {


-- Answers
lin destination_1 x_destination = (pm1 (answer (destination x_destination)));
lin destination_2 x_destination x_departure = (pm2 (answer (destination x_destination)) (answer (departure x_departure)));
lin departure_3 x_departure = (pm1 (answer (departure x_departure)));
lin departure_4 x_departure x_destination = (pm2 (answer (departure x_departure)) (answer (destination x_destination)));

-- Questions
lin shortest_route_5  = (pm1 (ask shortest_route'));
lin shortest_route_6 x_departure = (pm2 (ask shortest_route') (answer (departure x_departure)));
lin shortest_route_7  = (pm1 (ask shortest_route'));
lin shortest_route_8 x_destination = (pm2 (ask shortest_route') (answer (destination x_destination)));
lin shortest_route_9  = (pm1 (ask shortest_route'));

-- Short answers
lin stop_10 x_stop x_destination = (pm2 (shortAns (stop x_stop)) (answer (destination x_destination)));
lin stop_11 x_stop x_departure = (pm2 (shortAns (stop x_stop)) (answer (departure x_departure)));
lin stop_12 x_stop = (pm1 (shortAns (stop x_stop)));
lin location_13 x_location = (pm1 (shortAns (location x_location)));

-- Actions
lin help_14  = (pm1 (request help));
lin top_15  = (pm1 (request top));
}
