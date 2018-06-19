--# -path=.:../Common:prelude

concrete TramUserSem of TramUser = GodisUserSem, StopsSem ** 
    open Prolog, GodisApp, TramSystemSem in {

oper 

tram : App = app "tram";

-------------------------------------------------------------
-- Predicates and questions

lin

shortest_route = tram ** pm1 (ask shortest_route_Q);

shortest_route__from x = tram ** pm2 (ask shortest_route_Q) (answer (dept_stop_P x));
shortest_route__to   x = tram ** pm2 (ask shortest_route_Q) (answer (dest_stop_P x));

shortest_route__from_to x y = tram ** 
    pm3 (ask shortest_route_Q) (answer (dept_stop_P x)) (answer (dest_stop_P y));

shortest_route__to_from x y = tram ** 
    pm3 (ask shortest_route_Q) (answer (dest_stop_P x)) (answer (dept_stop_P y));

to_stop   x = tram ** pm1 (answer (dest_stop_P x));
from_stop x = tram ** pm1 (answer (dept_stop_P x));

from_to_stop x y = tram ** pm2 (answer (dept_stop_P x)) (answer (dest_stop_P y));
to_from_stop x y = tram ** pm2 (answer (dest_stop_P x)) (answer (dept_stop_P y));


--------------------------------------------------
-- Short answers

lin

stop x = tram ** pm1 (shortAns (stop x));

stop_to_stop   x y = tram ** pm2 (shortAns(stop x)) (answer(dest_stop_P y));
stop_from_stop x y = tram ** pm2 (shortAns(stop x)) (answer(dept_stop_P y));


------------------------------------------------------
-- Actions

lin

top  = tram ** pm1 (request top);
help = tram ** pm1 (request help);


----------------------------------------------------------------------
-- action answers

lincat SysAction = PStr;
lin 
top_AA  = top;
help_AA = help;

answerAction    act = tram ** pm1 (request act);
answerNegAction act = tram ** pm1 (answer (not (action act)));

----------------------------------------------------------------------
-- predicate/issue answers

not_shortest_route = tram ** pm1 (answer (not (issue shortest_route_Q)));


lincat SysProp = PStr;
lin
stop_P s = stop s;
from_stop_P s = dept_stop_P s;
to_stop_P s = dest_stop_P s;

answerProp    p = tram ** pm1 (answer p);
answerNegProp p = tram ** pm1 (answer (not p));

}

