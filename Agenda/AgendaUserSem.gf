--# -path=.:../Common:prelude

concrete AgendaUserSem of AgendaUser = GodisUserSem, BookingSem ** 
    open Prolog, GodisApp, AgendaSystemSem in {

oper

agenda : App = app "domain_agenda";

lin 

-- specs

tod_spec                   tod     = agenda ** pm1 (answer (time_of_day tod));
time_spec                  t       = agenda ** pm1 (answer (time t));
date_spec                  d       = agenda ** pm1 (answer (date d));
time_tod_spec              t tod   = agenda ** pm2 (answer (time t)) (answer (time_of_day tod));
thattime_tod_spec          t tod   = agenda ** pm2 (answer (time t)) (answer (time_of_day tod));
date_tod_spec              d tod   = agenda ** pm2 (answer (date d)) (answer (time_of_day tod));
thatdate_tod_spec          d tod   = agenda ** pm2 (answer (date d)) (answer (time_of_day tod));
time_date_spec             t d     = agenda ** pm2 (answer (time t)) (answer (date d));
thattime_date_spec         t d     = agenda ** pm2 (answer (time t)) (answer (date d));
time_thatdate_spec         t d     = agenda ** pm2 (answer (time t)) (answer (date d));
time_date_tod_spec         t d tod = agenda ** pm3 (answer (time t)) (answer (date d)) (answer (time_of_day tod));
thattime_date_tod_spec     t d tod = agenda ** pm3 (answer (time t)) (answer (date d)) (answer (time_of_day tod));
time_thatdate_tod_spec     t d tod = agenda ** pm3 (answer (time t)) (answer (date d)) (answer (time_of_day tod));
thattime_thatdate_tod_Spec t d tod = agenda ** pm3 (answer (time t)) (answer (date d)) (answer (time_of_day tod));


-- short answers

event       x = agenda ** pm1 (shortAns (event x));
time        x = agenda ** pm1 (shortAns (time x));
date        x = agenda ** pm1 (shortAns (date x));
month       x = agenda ** pm1 (shortAns (month x));
time_of_day x = agenda ** pm1 (shortAns (time_of_day x));
newdate     x = agenda ** pm1 (shortAns ((pp1 "newdate") x));
language    l = agenda ** pm1 (shortAns ((pp1 "language") l));


date_Ref    d = agenda ** pm1 (shortAns d);
time_Ref    t = agenda ** pm1 (shortAns t);
general_Ref r = agenda ** pm1 (shortAns r);

both = agenda ** pm1 (answer (pp1 "info" (pp0 "both" )));
time_answer = agenda ** pm1 (answer (pp1 "info" (pp0 "time")));
date_answer = agenda ** pm1 (answer (pp1 "info" (pp0 "date")));

-- "meeting at five"
event_time   e t = agenda ** pm2 (shortAns (event e)) (shortAns (time t));
event_timePR e t = agenda ** pm2 (shortAns (event e)) (shortAns (t));


-- "meeting on friday"
event_date   e d = agenda ** pm2 (shortAns (event e)) (shortAns (date d));
event_datePR e d = agenda ** pm2 (shortAns (event e)) (shortAns (d));

-- "friday meeting"
weekday_event w e = agenda ** pm2 (shortAns (date w)) (shortAns (event e));


--"Friday afternoon"

date_timeOfDay d tod = agenda ** pm2 (shortAns (date d)) (shortAns (time_of_day tod));


-- "meeting on friday at five"
event_date_time     e d t = agenda ** pm3 (shortAns (event e)) (shortAns (date d)) (shortAns (time t));
event_datePR_time   e d t = agenda ** pm3 (shortAns (event e)) (shortAns (d))      (shortAns (time t));
event_date_timePR   e d t = agenda ** pm3 (shortAns (event e)) (shortAns (date d)) (shortAns (t));
event_datePR_timePR e d t = agenda ** pm3 (shortAns (event e)) (shortAns (d))      (shortAns (t));


-- "meeting on friday at five in the afternoon"

event_date_time_timeOfDay          e d t tod = agenda ** pm4 (shortAns (event e)) (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
event_thatdate_time_timeOfDay      e d t tod = agenda ** pm4 (shortAns (event e)) (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
event_date_thattime_timeOfDay      e d t tod = agenda ** pm4 (shortAns (event e)) (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
event_thattdate_thattime_timeOfDay e d t tod = agenda ** pm4 (shortAns (event e)) (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));



-- "at five that day"
time_date     t d = agenda ** pm2 (shortAns (time t)) (shortAns (date d));
time_datePR   t d = agenda ** pm2 (shortAns (time t)) (shortAns (d));
timePR_date   t d = agenda ** pm2 (shortAns (t))      (shortAns (date d));
timePR_datePR t d = agenda ** pm2 (shortAns (t))      (shortAns (d));

-- at five in the afternoon monday

time_date_timeOfDay     t d tod = agenda ** pm3 (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
time_datePR_timeOfDay   t d tod = agenda ** pm3 (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
timePR_date_timeOfDay   t d tod = agenda ** pm3 (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));
timePR_datePR_timeOfDay t d tod = agenda ** pm3 (shortAns (date d)) (shortAns (time t)) (shortAns (time_of_day tod));


-- predicates  

-- U: What can you do?
usage = agenda ** pm1 ( ask (pp0 "usage"));

-- U: How is the schedule for monday?
how_is_schedule          d = agenda ** pm2 (ask (pp0 "bookings")) (answer (date d));
how_is_schedule_thatdate d = agenda ** pm2 (ask (pp0 "bookings")) (answer (date d));

-- U: When is event on date?
when_is_event_day     e d = agenda ** pm3 (ask (pWhQ "time")) (answer (event e)) (answer (date d));
when_is_event_thatday e r = agenda ** pm3 (ask (pWhQ "time")) (answer (event e)) (answer (date r));
when_is_weekday_event w e = agenda ** pm3 (ask (pWhQ "time")) (answer (date w))  (answer (event e));

-- U: What time is event?
what_time_is_event e = agenda ** pm2 (ask (pWhQ "time")) (answer (event e));


-- U: What is the date today?
what_is_the_date = agenda ** pm1 (ask (pWhQ "current_date"));


-- U: Am I booked Date Time?
am_I_booked d t = agenda ** pm3 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t));
am_I_booked_thatdate d t = agenda ** pm3 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t));
am_I_booked_thattime d t = agenda ** pm3 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t));
am_I_booked_thattime_thatdate d t = agenda ** pm3 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t));

-- U: Am I booked Date Time TOD?
am_I_booked_tod d t tod = agenda ** pm4 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t)) (answer (time_of_day tod));
am_I_booked_thatdate_tod d t tod = agenda ** pm4 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t)) (answer (time_of_day tod)); 
am_I_booked_thattime_tod d t tod = agenda ** pm4 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t))(answer (time_of_day tod));
am_I_booked_thattime_thatdate_tod d t tod = agenda ** pm4 (ask (pWhQ "bookings")) (answer (date d)) (answer (time t)) (answer (time_of_day tod));

-- U: What day is the Event?
what_day_is_event e = agenda ** pm2 (ask (pWhQ "date")) (answer (event e));


-- U: What day is the Event at Time?
what_day_is_event_at_time e t = agenda ** pm3 (ask (pWhQ "date")) (answer (event e)) (answer (time t));
what_day_is_event_at_thattime e t = agenda ** pm3 (ask (pWhQ "date")) (answer (event e)) (answer (time t));


-- U: What day is the Event at Time TOD?
what_day_is_event_at_time_tod e t tod = agenda ** pm4 (ask (pWhQ "date")) (answer (event e)) (answer (time t)) (answer (time_of_day tod));
what_day_is_event_at_thattime_tod e t tod = agenda ** pm4 (ask (pWhQ "date")) (answer (event e)) (answer (time t)) (answer (time_of_day tod));






-- actions

-- action top
top = agenda ** pm1 (request (pp0 "top"));

-- action add

add = agenda ** pm1 (request agenda_add);

add__event          e    = agenda ** pm2 (request agenda_add) (answer ( event e ));
add__event_timespec e ts = agenda ** pm3 (request agenda_add) (answer (event e )) (ts);

add__reference          r    = agenda ** pm2 (request agenda_add) (answer ( event r ));




-- action delete

delete = agenda ** pm1 (request agenda_delete);

delete__event              e     = agenda ** pm2 (request agenda_delete) (answer (event e));
delete__event_timespec     e ts  = agenda ** pm3 (request agenda_delete) (answer (event e)) (ts);

delete__reference          r     = agenda ** pm2 (request agenda_delete) (answer (event r));
delete__reference_timespec r ts  = agenda ** pm3 (request agenda_delete) (answer (event r)) (ts);

delete__everything        = agenda ** pm1 (request (pp0 "delete_everything"));
delete__everything_date d = agenda ** pm2 (request (pp0 "delete_everything")) (answer (date d));



-- action change

change = agenda ** pm1 (request agenda_change);
                  
change__event e = agenda ** pm2 (request agenda_change) (answer ( event e ));
change__event_timespec e ts = agenda ** pm3 (request agenda_change) (answer (event e)) (ts);

change__reference r = agenda ** pm2 (request agenda_change) (answer ( event r ));

change__event_toDate e nd = agenda ** pm3 (request agenda_change) (answer(event e)) (answer((pp1 "newdate") nd));
change__event_timespec_toDate e ts nd = agenda ** pm4 (request agenda_change) (answer(event e)) (ts) (answer((pp1 "newdate") nd));
change__event_timespec_toTime e ts nt = agenda ** pm4 (request agenda_change) (answer(event e)) (ts) (answer((pp1 "newtime") nt));

change__reference_toDate r nd = agenda ** pm3 (request agenda_change) (answer(event r)) (answer((pp1 "newdate") nd)); 
change__reference_timespec_toDate r ts nd = agenda ** pm4 (request agenda_change) (answer(event r)) (ts) (answer((pp1 "newdate") nd));
change__reference_timespec_toTime r ts nt = agenda ** pm4 (request agenda_change) (answer(event r)) (ts) (answer((pp1 "newtime") nt));



change__weekday_event        w e   = agenda ** pm3 (request agenda_change) (answer (date w)) (answer (event e)); 
change__weekday_event_toDate w e d = agenda ** pm4 (request agenda_change) (answer (date w)) (answer (event e)) (answer ((pp1 "newdate") d));
change__weekday_event_toTime w e t = agenda ** pm4 (request agenda_change) (answer (date w)) (answer (event e)) (answer ((pp1 "newtime") t));



-- action change_date

change_date = agenda ** pm2 (request agenda_change) 
                  (answer (pp1 "info" (pp0 "date")));
                  
change_date__event e = agenda ** pm3 (request agenda_change) 
                           (answer (pp1 "info" (pp0 "date"))) 
                           (answer ( event e ));
change_date__event_timespec  e ts = agenda ** pm4 (request agenda_change) 
                                        (answer (pp1 "info" (pp0 "date"))) 
                                        (answer ( event e )) 
                                        (ts);

change_date__reference r = agenda ** pm3 (request agenda_change) 
                               (answer (pp1 "info" (pp0 "date"))) 
                               (answer ( event r )); 

change_date__event_toDate e nd = agenda ** pm4 (request agenda_change) 
                                     (answer (pp1 "info" (pp0 "date"))) 
                                     (answer(event e)) 
                                     (answer((pp1 "newdate") nd));
change_date__event_timespec_toDate e ts nd = agenda ** pm5 (request agenda_change) 
                                                 (answer (pp1 "info" (pp0 "date"))) 
                                                 (answer(event e)) 
                                                 (ts) 
                                                 (answer((pp1 "newdate") nd));


change_date__reference_toDate r nd = agenda ** pm4 (request agenda_change) 
                                          (answer (pp1 "info" (pp0 "date")))
                                          (answer(event r)) 
                                          (answer((pp1 "newdate") nd)); 


change_date__weekday_event        w e   = agenda ** pm4 (request agenda_change) (answer (pp1 "info" (pp0 "date"))) (answer (date w)) (answer (event e)); 
change_date__weekday_event_toDate w e d = agenda ** pm5 (request agenda_change) (answer (pp1 "info" (pp0 "date"))) (answer (date w)) (answer (event e)) (answer ((pp1 "newdate") d));



-- action change_time


change_time = agenda ** pm2 (request agenda_change) (answer (pp1 "info" (pp0 "time")));

change_time__event e = agenda ** pm3 (request agenda_change) 
                           (answer (pp1 "info" (pp0 "time")))
                           (answer ( event e ));

change_time__event_timespec  e ts = agenda ** pm4 (request agenda_change)
                                          (answer (pp1 "info" (pp0 "time")))
                                          (answer (event e)) 
                                          (ts);

change_time__reference r = agenda ** pm3 (request agenda_change) 
                               (answer (pp1 "info" (pp0 "time")))
                               (answer (time r));



change_time__event_toTime e nt = agenda ** pm4 (request agenda_change) 
                                     (answer (pp1 "info" (pp0 "time")))
                                     (answer ( event e )) 
                                     (answer ((pp1 "newtime") nt));

change_time__event_timespec_toTime e ts nt = agenda ** pm5 (request agenda_change) 
                                            (answer (pp1 "info" (pp0 "time")))
                                            (answer (event e)) 
                                            (ts) 
                                            (answer ((pp1 "newtime") nt));


change_time__reference_toTime r nt = agenda ** pm4 (request agenda_change) 
                                         (answer (pp1 "info" (pp0 "time")))
                                         (answer (event r)) 
                                         (answer ((pp1 "newtime") nt));

change_time__weekday_event        w e   = agenda ** pm4 (request agenda_change) (answer (pp1 "info" (pp0 "time"))) (answer (date w)) (answer (event e)); 
change_time__weekday_event_toTime w e t = agenda ** pm5 (request agenda_change) (answer (pp1 "info" (pp0 "time"))) (answer (date w)) (answer (event e)) (answer ((pp1 "newtime") t));

-- goto

goto_month m = agenda ** pm2 (request agenda_goto_month) (answer (month m));
goto_date d = agenda ** pm2 (request agenda_goto_date) (answer (date d));


-- change language

change_language = agenda ** pm1 (request (pp0 "change_language"));
change_language_to_language l = agenda ** pm2 (request (pp0 "change_language")) (answer ((pp1 "language") l));

-- get info
get_info = agenda ** pm1 (request (pp0 "get_info"));

}
