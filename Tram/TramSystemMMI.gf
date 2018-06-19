
incomplete concrete TramSystemMMI of TramSystem = 
    open TramSystemI, (Sem=TramSystemSem), (MM=GodisMM), Grammar in {

lincat

Route = NP ** MM.Semantics;
Leg = NP ** MM.Semantics;
[Leg] = [NP] ** MM.Semantics;


lin

-----------------------------------------------------------------------------
-- Route 

lineLeg line from to = lineLeg line from to ** MM.sem (Sem.lineLeg line.sem from.sem to.sem);

oneLeg  leg  = oneLeg  leg  ** MM.sem (Sem.oneLeg  leg.sem);
mkRoute legs = mkRoute legs ** MM.sem (Sem.mkRoute legs.sem);
BaseLeg x xs = BaseLeg x xs ** MM.sem (Sem.BaseLeg x.sem xs.sem);
ConsLeg x xs = ConsLeg x xs ** MM.sem (Sem.ConsLeg x.sem xs.sem);

-------------------------------------------------------------------------------
-- Predicates and Questions 

shortest_route_Q     = shortest_route_Q ** MM.sem (Sem.shortest_route_Q);
shortest_route_P   x = shortest_route_P x ** MM.sem (Sem.shortest_route_P x.sem) **
    MM.longForm;

dest_stop_Q          = dest_stop_Q ** MM.sem (Sem.dest_stop_Q);
dest_stop_P        x = dest_stop_P x ** MM.sem (Sem.dest_stop_P x.sem) **
    MM.shortForm (shortAns (stop x)) x.sem;

dept_stop_Q          = dept_stop_Q ** MM.sem (Sem.dept_stop_Q);
dept_stop_P        x = dept_stop_P x ** MM.sem (Sem.dept_stop_P x.sem) **
    MM.shortForm (shortAns (stop x)) x.sem;


---------------------------------------------------------------------------
-- Short Answers

stop x = stop x ** MM.sem (Sem.stop x.sem);


-----------------------------------------------------------------------
-- Actions

top  = top ** MM.sem (Sem.top);

help = help ** MM.sem (Sem.help);

}
