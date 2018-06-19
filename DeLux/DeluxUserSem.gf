--# -path=.:../Common:prelude

concrete DeluxUserSem of DeluxUser = DeluxGlobalSem ** 
    open Prolog, GodisApp, DeluxSystemSem in {


oper 

delux2 : App = app "domain_delux";


------------------------------------------------------
-- Actions

lin
top = delux2 ** pm1 (request top);
-- help = delux2 ** pm1 (request help);


--------------------------------------------------
-- Short answers

lin
room x = delux2 ** pm1 (shortAns (room x)); 
lamp x = delux2 ** pm1 (shortAns (lamp x));

room_lamp x y = delux2 ** pm2 (shortAns (room x)) (shortAns (lamp y));

not_room x = delux2 ** pm1 (shortAns (not (room x)));
not_lamp x = delux2 ** pm1 (shortAns (not (lamp x)));

}

