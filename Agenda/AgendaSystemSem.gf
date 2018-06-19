--# -path=.:../Common:prelude

concrete AgendaSystemSem of AgendaSystem = GodisSystemSem, BookingSem ** open Prolog in {

lin

-- focus

focus_Date  = pp1 "focus";
focus_Time  = pp1 "focus";
focus_Event = pp1 "focus";

-- Short answers

event = pp1 "event";
time = pp1 "time";
date = pp1 "date";
month = pp1 "month";
time_of_day = pp1 "am_or_pm";

-- Predicates


date_to_add_Q = pWhQ "date_to_add";
date_to_add_P = pp1 "date_to_add";


time_to_add_Q = pWhQ "time_to_add";
time_to_add_P = pp1 "time_to_add";


event_to_add_Q = pWhQ "event_to_add";
event_to_add_P = pp1 "event_to_add";



-- Actions

agenda_add = pp0 "add_event";

agenda_delete = pp0 "delete_event";

agenda_change = pp0 "change";

agenda_goto_month = pp0 "goto";
agenda_goto_date = pp0 "goto";

}
