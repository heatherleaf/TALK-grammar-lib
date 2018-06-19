--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

concrete TramGodisSystemSem of TramGodisSystem = 
    GodisSystemSem, TramGodisDataSem ** 
    open Prolog in {


-- Short answers
lin stop  = (pp1 ["stop"]);
lin route  = (pp1 ["route"]);
lin location  = (pp1 ["location"]);

-- Actions
lin help  = (pp0 ["help"]);
lin top  = (pp0 ["top"]);

-- Predicates
lin destination  = (pp1 ["destination"]);
lin destination'  = (pWhQ ["destination"]);
lin departure  = (pp1 ["departure"]);
lin departure'  = (pWhQ ["departure"]);
lin shortest_route  = (pp1 ["shortest_route"]);
lin shortest_route'  = (pWhQ ["shortest_route"]);
}
