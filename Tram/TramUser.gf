--# -path=.:../Common:prelude

abstract TramUser = GodisUser, Stops ** {

fun

------------------------------------------------------------------------
-- Predicates
-- Questions used by the User

-- "find a route"
shortest_route : Question;

-- "I want to go from chalmers"
shortest_route__from : Stop -> Question;

-- "I want to go to chalmers"
shortest_route__to : Stop -> Question;

-- "I want to go from chalmers to valand"
shortest_route__from_to,
shortest_route__to_from : Stop -> Stop -> Question;

------------------------------------------------------------------------
-- Answers

-- "from chalmers"
from_stop : Stop -> Answer;

-- "to chalmers"
to_stop : Stop -> Answer;

-- "from valand to chalmers"
from_to_stop, 
to_from_stop : Stop -> Stop -> Answer;

-----------------------------------------------------------------------
-- Short answers

-- "chalmers"
stop : Stop -> ShortAns;

-- "valand to chalmers"
stop_to_stop: Stop -> Stop -> ShortAns;

-- "valand from chalmers"
stop_from_stop: Stop -> Stop -> ShortAns;

-------------------------------------------------------------------------
-- Actions
-- we use Question since we do not want coordination

-- U: restart
top : Question;

-- U: help
help : Question;

-- print_info,
-- download_info,
-- read_info : Action;


----------------------------------------------------------------------
-- action answers

cat SysAction;
fun
top_AA,
help_AA : SysAction;

answerAction, answerNegAction : SysAction -> Answer;

----------------------------------------------------------------------
-- predicate/issue answers

not_shortest_route : Answer;

cat SysProp;
fun
stop_P, from_stop_P, to_stop_P : Stop -> SysProp;
answerProp, answerNegProp : SysProp -> Answer;

}
