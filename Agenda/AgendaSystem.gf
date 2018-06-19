--# -path=.:../Common:prelude

abstract AgendaSystem = GodisSystem, Booking ** {

fun

-----------------------------------------------------
-- focus

focus_Date  : Date -> Date;
focus_Time  : Time -> Time;
focus_Event : Event -> Event;

-----------------------------------------------------
-- Predicates
-- Questions and Propositions as they are intended to be used 
-- by either System or User


-- S: What date?
date_to_add_Q : Question;
-- U: DATE
date_to_add_P : Date -> Proposition;


-- S: What time?
time_to_add_Q : Question;
-- U: TIME
time_to_add_P : Time -> Proposition;

-- S: What type of booking?
event_to_add_Q : Question;
-- U: EVENT
event_to_add_P : Event -> Proposition;



------------------------------------------------------

-- short anwers

event : Event -> ShortAns;
time : Time -> ShortAns;
date : Date -> ShortAns;
month : Month -> ShortAns;
time_of_day : Time_Of_Day -> ShortAns;


------------------------------------------------------


-- actions
agenda_add : Action;

agenda_delete : Action;

agenda_goto_date : Action;
agenda_goto_month : Action;

agenda_move : Action;

agenda_change : Action;

agenda_change_time : Action;
agenda_change_date : Action;
agenda_change_time__booking : Action;
agenda_change_date__booking : Action;

------------------------------------------------------

}
