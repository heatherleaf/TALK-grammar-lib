--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

concrete AgendaUserEng of AgendaUser = GodisUserEng, BookingEng ** 
    open GodisMM, CatEng, Prelude, GodisLangEng, AgendaSystemEng, ResEng, AgendaLexiconEng in {


--## LINCAT ##--

lincat Time_Spec = {s :Str};



-- ### OPER ### -- 

oper 


-- time_date_variants
-- "at ten on friday the fifth"
-- "saturday the seventeenth at nine"
time_date_variants : NP -> NP -> Str = \t,d -> variants{ (t.s!Nom ++ d.s!Nom);
                                                         (d.s!Nom ++ t.s!Nom)};

time_tod_variants : NP -> NP -> Str = \t,tod -> variants {(t.s!Nom ++ tod.s!Nom);
                                                          (tod.s!Nom ++ t.s!Nom)};

date_tod_variants : NP -> NP -> Str = \d,tod -> variants {(d.s!Nom ++ tod.s!Nom);
                                                          (tod.s!Nom ++ d.s!Nom)};

-- date_time_tod_variants (tod = time of day)
-- "monday at ten in the morning"
-- "monday afternoon at five"
-- "nine oclock on friday morning"
-- "ten a m on the tenth of may"
-- "in the morning of friday the fith at eleven"
-- "in the afternoon at three on tuesday"
time_date_tod_variants : NP -> NP -> NP -> Str 
                = \t,d,tod -> variants{ (d.s!Nom   ++ t.s!Nom   ++ tod.s!Nom);
                                        (d.s!Nom   ++ tod.s!Nom ++ t.s!Nom  );
                                        (t.s!Nom   ++ d.s!Nom   ++ tod.s!Nom);
                                        (t.s!Nom   ++ tod.s!Nom ++ d.s!Nom  );
                                        (tod.s!Nom ++ d.s!Nom   ++ t.s!Nom  );
                                        (tod.s!Nom ++ t.s!Nom   ++ d.s!Nom  )};


-- how_is_schedule_variants
how_is_schedule_variants : Str = variants {["how is my schedule"];
                                           ["how does the schedule look"];
                                           ["am i free"];
                                           ["am i scheduled"];
                                           ["am i busy"];
                                           ["am i booked"];
                                           ["can you show me the schedule"];
                                           ["can you tell me the schedule"];
                                           ["what about"];
                                           ["check if i am busy"];
                                           ["check if i am free"];
                                           ["check if i am scheduled"];
                                           ["check if i am booked"];
                                           ["what am i up to"];
                                           ["what do i have booked"];
                                           ["what do i have planned"];
                                           ["what do i have scheduled"];
                                           ["what events do i have"];
                                           ["what bookings do i have"];
                                           ["what bookings are scheduled"];
                                           ["what events are scheduled"];
                                           ["what bookings are planned"];
                                           ["what events are planned"];
                                           ["do i have anything booked"];
                                           ["do i have anything scheduled"];
                                           ["what is on the schedule"];
                                           ["what is on the program"];
                                           ["what happens"];
                                           ["what am i up to"];
                                           ["show me the program for"];
                                           ["show me the program"];
                                           ["show me the schedule"];
                                           ["show me the agenda"];
                                           ["show me the agenda for"];
                                           ["show me the schedule for"];
                                           ["i would like to know what is on my schedule"];
                                           ["i would like to know what is on my program"];
                                           ["i would like to know what is on my agenda"];
                                           ["i want to know what is on my schedule"]};


-- when_is_variants
when_is_event_variants : NP -> Str = \e -> variants {(["when is"] ++ e.s!Nom);
                                                    (["what time is"]++ e.s!Nom);
                                                    (["at what time do i have"]++ e.s!Nom);
                                                    (["when do i have"]++ e.s!Nom);
                                                    (["at what time does"] ++ e.s!Nom ++ ["start"]);
                                                    (["at what time does"] ++ e.s!Nom ++ ["begin"]);
                                                    (["when does"] ++ e.s!Nom ++ ["start"]);
                                                    (["when does"] ++ e.s!Nom ++ ["begin"]);
                                                    (["at what time is"] ++ e.s!Nom ++ ["booked"]);
                                                    (["at what time is"] ++ e.s!Nom ++ ["scheduled"]);
                                                    (["when is"] ++ e.s!Nom ++ ["booked"]);
                                                    (["when is"] ++ e.s!Nom ++ ["scheduled"])};

when_is_event_date_variants : NP -> NP -> Str = \e,d -> variants {(["when is"] ++ e.s!Nom ++ d.s!Nom);
                                                    (["what time is"]++ e.s!Nom ++ d.s!Nom);
                                                    (["at what time do i have"]++ e.s!Nom ++ d.s!Nom);
                                                    (["when do i have"]++ e.s!Nom ++ d.s!Nom);
                                                    (["at what time does"] ++ e.s!Nom ++ d.s!Nom ++ ["start"]);
                                                    (["at what time does"] ++ e.s!Nom ++ d.s!Nom ++ ["begin"]);
                                                    (["when does"] ++ e.s!Nom ++ d.s!Nom ++ ["start"]);
                                                    (["when does"] ++ e.s!Nom ++ d.s!Nom ++ ["begin"]);
                                                    (["at what time is"] ++ e.s!Nom ++ ["booked"] ++ d.s!Nom);
                                                    (["at what time is"] ++ e.s!Nom ++ ["scheduled"] ++ d.s!Nom);
                                                    (["when is"] ++ e.s!Nom ++ ["booked"] ++ d.s!Nom);
                                                    (["when is"] ++ e.s!Nom ++ ["scheduled"] ++ d.s!Nom)};
-- what_day_variants
what_day_variants : Str = variants {["what day is"];
                                    ["what date is"];
                                    ["at what date do i have"];
                                    ["at what day do i have"]};

-- to_agenda 
to_agenda : Str = optStr (variants {["in"];["to"]} ++
                          variants  {["the"];["my"]} ++ 
			  variants {["agenda"];["calender"];["program"];["schedule"]});

-- from_agenda
from_agenda : Str = optStr ("from" ++ 
                            variants{"the";"my"} ++ 
			    variants{"agenda";"schedule";"program";"calender"});



-- add_variants
add_variants : Str = (variants {["add"];
                                ["schedule"];
                                ["take down"];
                                ["book"];
                                ["write down"]});



-- delete_variants
delete_variants : Str = (variants {["delete"];
                                   ["remove"];
                                   ["erase"];
                                   ["cancel"];
                                   ["take away"]});


--change_variants 
change_variants : Str = (variants {["reschedule"];
                                   ["move"];
                                   ["change"];
                                   ["change the details for"];
                                   ["change the details"];
                                   ["change the details of"]});



-- change_date_variants
change_date_variants : Str = ( ["change the"] ++ variants {["date"];["day"]});

-- change_time_variants
change_time_variants : Str = (variants {["change the time"]}); 

-- goto_variants
goto_variants : Str = variants { ["go to"];
                                 ["show me"];
                                 ["jump to"];
                                 ["go forward to"];
                                 ["go back to"];
                                 ["can you show me"];
                                 ["can i see"]};

-- change_language_variants
change_language_variants : Str = variants {["change the language"];
                                           ["change language"];
                                           ["switch language"];
                                           ["switch"];
                                           ["switch back"]};


-- a_booking_variants
a_booking_variants : Str = variants {["something"];
                                     ["a booking"];
                                     ["the booking"];
                                     ["an event"];
                                     ["the event"];
                                     ["an appointment"];
                                     ["the appointment"]};

all_notes_variants : Str = variants {["everything"];
                                     ["all events"];
				     ["all appointments"];
				     ["all notes"];
				     ["all the notes"];
				     ["all the appointments"];
				     ["all the events"];
				     ["all of the notes"];
				     ["all of the appointments"];
				     ["all of the events"]};


-- ## LIN ## -- 
lin


-- Specs

tod_spec                   tod     = ss (tod.s!Nom);
time_spec                  t       = ss (t.s!Nom);
date_spec                  d       = ss (d.s!Nom);
time_tod_spec              t tod   = ss (time_tod_variants t tod);
thattime_tod_spec          t tod   = ss (time_tod_variants t tod);
date_tod_spec              d tod   = ss (date_tod_variants d tod);
thatdate_tod_spec          d tod   = ss (date_tod_variants d tod);
time_date_spec             t d     = ss (time_date_variants t d);
thattime_date_spec         t d     = ss (time_date_variants t d);
time_thatdate_spec         t d     = ss (time_date_variants t d);
time_date_tod_spec         t d tod = ss (time_date_tod_variants t d tod);
thattime_date_tod_spec     t d tod = ss (time_date_tod_variants t d tod);
time_thatdate_tod_spec     t d tod = ss (time_date_tod_variants t d tod);
thattime_thatdate_tod_Spec t d tod = ss (time_date_tod_variants t d tod); 




--##-- SHORT ANSWERS --##--

event       e = noClick (ansNP e);
time        t = noClick (ansNP t);
date        d = noClick (ansNP d);
month       m = noClick (ansNP m);
time_of_day x = noClick (ansNP x);
newdate     d = noClick (ss ("to" ++ d.s!Nom));
language    l = noClick (ansNP l);

date_Ref    x = noClick (ansNP x);
time_Ref    x = noClick (ansNP x);
general_Ref x = noClick (ansNP x);


both        = noClick (ss (["both"]));
time_answer = noClick (ss (variants {["time"];
                                     ["the time"];
				     ["the information about the time"];
				     ["the time information"]}));
date_answer = noClick (ss (variants {["date"];
                                     ["the date"];
				     ["day"];
				     ["the day"];
				     ["the information about the date"];
				     ["the date information"]}));



-- "meeting at five"
event_time   e t = noClick (ss (e.s!Nom ++ t.s!Nom));
event_timePR e t = noClick (ss (e.s!Nom ++ t.s!Nom));


-- "meeting on friday"
event_date   e d = noClick (ss (e.s!Nom ++ d.s!Nom));
event_datePR e d = noClick (ss (e.s!Nom ++ d.s!Nom));

-- "friday meeting"

weekday_event w e = noClick (ss (w.s!Nom ++ e.s!Nom));


-- "Friday afternoon"
date_timeOfDay d tod = noClick (ss (d.s!Nom ++ tod.s!Nom));

-- "meeting on friday at five"

event_date_time     e d t = noClick (ss (e.s!Nom ++ time_date_variants t d));
event_datePR_time   e d t = noClick (ss (e.s!Nom ++ time_date_variants t d));
event_date_timePR   e d t = noClick (ss (e.s!Nom ++ time_date_variants t d));
event_datePR_timePR e d t = noClick (ss (e.s!Nom ++ time_date_variants t d));

-- "meeting on friday at five in the afternoon"

event_date_time_timeOfDay          e d t tod = noClick (ss (e.s!Nom ++ time_date_tod_variants d t tod));
event_thatdate_time_timeOfDay      e d t tod = noClick (ss (e.s!Nom ++ time_date_tod_variants d t tod));
event_date_thattime_timeOfDay      e d t tod = noClick (ss (e.s!Nom ++ time_date_tod_variants d t tod));
event_thattdate_thattime_timeOfDay e d t tod = noClick (ss (e.s!Nom ++ time_date_tod_variants d t tod));



-- "at five that day"

time_date     t d = noClick (ss (time_date_variants t d));
time_datePR   t d = noClick (ss (time_date_variants t d));
timePR_date   t d = noClick (ss (time_date_variants t d));
timePR_datePR t d = noClick (ss (time_date_variants t d));

-- at five in the afternoon monday

time_date_timeOfDay     t d tod = noClick (ss (time_date_tod_variants d t tod));
time_datePR_timeOfDay   t d tod = noClick (ss (time_date_tod_variants d t tod));
timePR_date_timeOfDay   t d tod = noClick (ss (time_date_tod_variants d t tod));
timePR_datePR_timeOfDay t d tod = noClick (ss (time_date_tod_variants d t tod));





--##-- PREDICATES --##--

-- What can you do?
usage = noClick (ss (variants {["what can you do"];
                      ["how do i use this"];
                      ["i need to know the instructions"]}));

-- U: How is the schedule for monday?
how_is_schedule          d = noClick (ss ( how_is_schedule_variants ++ d.s!Nom)) ;
how_is_schedule_thatdate d = noClick (ss ( how_is_schedule_variants ++ d.s!Nom)) ;


-- U: When is event on day?
when_is_event_day     e d = noClick (ss ( when_is_event_date_variants e d ));
when_is_event_thatday e r = noClick (ss ( when_is_event_date_variants e r));
when_is_weekday_event w e = noClick (ss ( variants {(["when is"] ++ w.s!Nom ++ e.s!Nom);
                                           (["what time is"]++ w.s!Nom ++ e.s!Nom);
                                           (["at what time do i have"]++ w.s!Nom ++ e.s!Nom);
                                           (["when do i have"]++ w.s!Nom ++ e.s!Nom);
                                           (["at what time does"] ++ w.s!Nom ++ e.s!Nom ++ ["start"]);
                                           (["at what time does"] ++ w.s!Nom ++ e.s!Nom ++ ["begin"]);
                                           (["when does"] ++ w.s!Nom ++ e.s!Nom ++ ["start"]);
                                           (["when does"] ++ w.s!Nom ++ e.s!Nom ++ ["begin"])}));


-- U: When is Event?
what_time_is_event e = noClick (ss ( when_is_event_variants e ));


--U: What is the date today?
what_is_the_date = noClick (ss (variants {["what day is it today"];
                                 ["what is the date today"];
                                 ["todays date please"];
                                 ["please tell me todays date"];
                                 ["i want to know todays date"];
                                 ["i want you to tell me todays date"];
                                 ["can you tell me todays date"];
                                 ["i must know todays date"];
                                 ["i would like you to tell me todays date"];
                                 ["know todays date"];
                                 ["i want to know what day it is today"];
                                 ["what date is it today"];
                                 ["what is todays date"];
                                 ["can you give me todays date"];
                                 ["i need to know todays date"];
                                 ["i need to know what date it is today"]}));


-- U: Am I booked Date Time?

am_I_booked                   d t = noClick (ss ( how_is_schedule_variants ++ time_date_variants t d));
am_I_booked_thatdate          d t = noClick (ss ( how_is_schedule_variants ++ time_date_variants t d));
am_I_booked_thattime          d t = noClick (ss ( how_is_schedule_variants ++ time_date_variants t d));
am_I_booked_thattime_thatdate d t = noClick (ss ( how_is_schedule_variants ++ time_date_variants t d));


-- U: Am I booked Date Time TOD?

am_I_booked_tod                   d t tod = noClick (ss ( how_is_schedule_variants ++ time_date_tod_variants t d tod));
am_I_booked_thatdate_tod          d t tod = noClick (ss ( how_is_schedule_variants ++ time_date_tod_variants t d tod));
am_I_booked_thattime_tod          d t tod = noClick (ss ( how_is_schedule_variants ++ time_date_tod_variants t d tod)); 
am_I_booked_thattime_thatdate_tod d t tod = noClick (ss ( how_is_schedule_variants ++ time_date_tod_variants t d tod)); 


-- U: What day is the Event?

what_day_is_event e = noClick (ss ( what_day_variants ++ e.s!Nom));


-- U: What day is the Event at Time?

what_day_is_event_at_time e t = noClick (ss (what_day_variants ++ e.s!Nom ++ t.s!Nom));
what_day_is_event_at_thattime e t =  noClick (ss (what_day_variants ++ e.s!Nom ++ t.s!Nom));


-- U: What day is the Event at Time TOD?

what_day_is_event_at_time_tod e t tod = noClick (ss (what_day_variants ++ e.s!Nom ++ t.s!Nom ++ tod.s!Nom));
what_day_is_event_at_thattime_tod e t tod =  noClick (ss (what_day_variants ++ e.s!Nom ++ t.s!Nom ++ tod.s!Nom));







--##-- ACTIONS --##--

-- action top
top = noClick (ss ( variants { ["restart"]; 
                      ["top"];
                      ["back"];
                      ["start over"];
                      ["start from the beginning"];
                      ["start all over"];
                      ["back to start"];
                      ["go up"];["go back"];
                      ["go back up"];
                      ["top level"];
                      ["return to top"];
                      ["go back to top level"]}));


-- action add

add = noClick (variants{ req1 add_variants;
                reqVP agenda_add;
                req1x add_variants (optStr (a_booking_variants ++ optStr to_agenda))});

add__event              e     = noClick (req1x add_variants (e.s!Nom ++ to_agenda));
add__event_timespec     e ts = noClick (req1x add_variants (e.s!Nom ++ ts.s ++ to_agenda));


add__reference r = noClick (req1x ["put"] (r.s!Nom ++ ["back"] ++ to_agenda));



-- action delete

-- "delete", "delete something from the agenda", "remove a booking" ... 

delete = noClick (variants { req1  delete_variants;
                                   reqVP agenda_delete;
		                   req1x delete_variants (optStr (a_booking_variants ++ from_agenda))});

delete__everything = noClick (req1x delete_variants (all_notes_variants ++ from_agenda));
		    
delete__everything_date d = noClick (req1x delete_variants (all_notes_variants ++ d.s!Nom ++ from_agenda));

delete__event              e     = noClick (req1x delete_variants (e.s!Nom ++ from_agenda));
delete__event_timespec     e ts  = noClick (req1x delete_variants  (e.s!Nom ++ ts.s ++ from_agenda));

delete__reference          r     = noClick (req1x delete_variants (r.s!Nom ++ from_agenda));
delete__reference_timespec r ts  = noClick (req1x delete_variants  (r.s!Nom ++ ts.s ++ from_agenda));




-- action_change

change = noClick (variants { reqVP agenda_move;
                    req1 change_variants;
                    req1x change_variants (a_booking_variants) });

change__event                 e     = noClick (req1x change_variants (e.s!Nom));
change__event_timespec        e ts  = noClick (req1x change_variants (e.s!Nom ++ ts.s));

change__event_toDate          e nd     = noClick (req1x change_variants (e.s!Nom ++ "to" ++ nd.s!Nom));
change__event_timespec_toDate e ts nd  = noClick (req1x change_variants (e.s!Nom ++ ts.s ++ "to" ++ nd.s!Nom));
change__event_timespec_toTime e ts nt  = noClick (req1x change_variants (e.s!Nom ++ ts.s ++ "to" ++ nt.s!Nom));

change__reference r = noClick (req1x change_variants (r.s!Nom));

change__reference_toDate r nd = noClick (req1x change_variants (r.s!Nom ++ "to" ++ nd.s!Nom));
change__reference_timespec_toDate r ts nd = noClick (req1x change_variants (r.s!Nom ++ ts.s ++ "to" ++ nd.s!Nom));
change__reference_timespec_toTime r ts nt = noClick (req1x change_variants (r.s!Nom ++ ts.s ++ "to" ++ nt.s!Nom));

change__weekday_event        w e   = noClick (req1x change_variants ((optStr "the") ++ w.s!Nom ++ e.s!Nom)); 
change__weekday_event_toDate w e d = noClick (req1x change_variants ((optStr "the") ++ w.s!Nom ++ e.s!Nom ++ d.s!Nom));
change__weekday_event_toTime w e t = noClick (req1x change_variants ((optStr "the") ++ w.s!Nom ++ e.s!Nom ++ t.s!Nom));


-- action change_date
change_date = noClick (variants { req1 change_date_variants;
                         req1x change_date_variants (variants {"for";"of"} ++ a_booking_variants)});

change_date__event e = noClick (variants { (req1x change_date_variants (variants {"for";"of"} ++ e.s!Nom));
                                           (req1x change_variants (variants {"for";"of"} ++ e.s!Nom ++ ["to another"] ++ 
                                                                                variants {["day"];["date"]}))});
change_date__event_timespec e ts  = noClick (variants {
                                      (req1x change_date_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s));
                                      (req1x change_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s ++ ["to another"] ++ 
                                                                                   variants {["day"];["date"]}))});


change_date__reference r = noClick (variants { 
                               (req1x change_date_variants (variants {"for";"of"} ++ r.s!Nom));
                               (req1x change_variants (variants {"for";"of"} ++ r.s!Nom ++ ["to another"] ++ variants {["day"];["date"]}))});


change_date__event_toDate e nd = noClick (req1x change_date_variants (variants {"for";"of"} ++ e.s!Nom ++ "to" ++ nd.s!Nom));
change_date__event_timespec_toDate e ts nd  = noClick (req1x change_date_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s ++ "to" ++ nd.s!Nom));

change_date__reference_toDate r nd = noClick (req1x change_date_variants (variants {"for";"of"} ++ r.s!Nom ++ "to" ++ nd.s!Nom));



change_date__weekday_event w e   = noClick (variants { 
                  (req1x change_date_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom));
                  (req1x change_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom ++ ["to another"] ++ 
                                                                          variants {["day"];["date"]}))}); 
change_date__weekday_event_toDate w e d = noClick (req1x change_date_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom ++ "to" ++ d.s!Nom));



-- action change_time
change_time = noClick (variants { req1 change_time_variants;
                                  req1x change_time_variants (variants {"for";"of"} ++ a_booking_variants)});


change_time__event e = noClick (variants { 
                             (req1x change_time_variants (variants {"for";"of"} ++ e.s!Nom));
                             (req1x change_variants (variants {"for";"of"} ++ e.s!Nom ++ ["to another time"]))});
change_time__event_timespec e ts  = noClick (variants { 
                             (req1x change_time_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s));
                             (req1x change_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s ++ ["to another time"]))});


change_time__reference r = noClick (variants { 
                             (req1x change_time_variants (variants {"for";"of"} ++ r.s!Nom));
                             (req1x change_variants (variants {"for";"of"} ++ r.s!Nom ++ ["to another time"]))});


change_time__event_toTime e nt = noClick (req1x change_time_variants (variants {"for";"of"} ++ e.s!Nom ++ "to" ++ nt.s!Nom));

change_time__event_timespec_toTime e ts nt = noClick (req1x change_time_variants (variants {"for";"of"} ++ e.s!Nom ++ ts.s ++ "to" ++ nt.s!Nom));



change_time__reference_toTime r nt = noClick (req1x change_time_variants (variants {"for";"of"} ++ r.s!Nom ++ "to" ++ nt.s!Nom));


change_time__weekday_event w e = noClick (variants { 
           (req1x change_time_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom));
           (req1x change_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom ++ ["to another time"]))}); 

change_time__weekday_event_toTime w e t = noClick (req1x change_time_variants (variants {"for";"of"} ++ (optStr "the") ++ w.s!Nom ++ e.s!Nom ++ "to" ++ t.s!Nom));



-- goto
goto_month m = noClick (ss (goto_variants ++ m.s!Nom));
goto_date  d = noClick (ss (goto_variants ++ d.s!Nom));


-- change language 

change_language = noClick (ss (change_language_variants));
change_language_to_language l = noClick (ss (change_language_variants ++ "to" ++ l.s!Nom));



-- get info

get_info = noClick (ss (variants {["check my calendar"];
                         ["check the calendar"];
                         ["look up some information"];
                         ["check my schedule"];
                         ["check the schedule"];
                         ["check my agenda"];
                         ["check the agenda"];
                         ["check some bookings"]}));

}

