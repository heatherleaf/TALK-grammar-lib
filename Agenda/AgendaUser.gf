--# -path=.:../Common:prelude

abstract AgendaUser = GodisUser, Booking ** {

cat Time_Spec;

fun

-- Specs

tod_spec                   : Time_Of_Day -> Time_Spec;
time_spec                  : Time        -> Time_Spec;
date_spec                  : Date        -> Time_Spec;
time_tod_spec              : Time        -> Time_Of_Day -> Time_Spec;
thattime_tod_spec          : Time_Ref    -> Time_Of_Day -> Time_Spec;
date_tod_spec              : Date        -> Time_Of_Day -> Time_Spec;
thatdate_tod_spec          : Date_Ref    -> Time_Of_Day -> Time_Spec;
time_date_spec             : Time        -> Date        -> Time_Spec;
thattime_date_spec         : Time_Ref    -> Date        -> Time_Spec;
time_thatdate_spec         : Time        -> Date_Ref    -> Time_Spec;
time_date_tod_spec         : Time        -> Date        -> Time_Of_Day -> Time_Spec;
thattime_date_tod_spec     : Time_Ref    -> Date        -> Time_Of_Day -> Time_Spec;
time_thatdate_tod_spec     : Time        -> Date_Ref    -> Time_Of_Day -> Time_Spec;
thattime_thatdate_tod_Spec : Time_Ref    -> Date_Ref    -> Time_Of_Day -> Time_Spec;


-- short answers

-- Answer(language(X)) --> engelska
-- Answer(X^ref(X)) --> den/det

time        : Time        -> ShortAns;
event       : Event       -> ShortAns;
date        : Date        -> ShortAns;
month       : Month       -> ShortAns;
time_of_day : Time_Of_Day -> ShortAns;
newdate     : Date        -> ShortAns;
language    : Language    -> ShortAns;

date_Ref    : Date_Ref    -> ShortAns;
time_Ref    : Time_Ref    -> ShortAns;
general_Ref : General_Ref -> ShortAns;


both : ShortAns;
time_answer : ShortAns;
date_answer : ShortAns;


-- "Meeting at five"
event_time   : Event -> Time     -> ShortAns;
event_timePR : Event -> Time_Ref -> ShortAns;


-- "Meeting on friday"

event_date   : Event -> Date     -> ShortAns;
event_datePR : Event -> Date_Ref -> ShortAns;

-- "Friday meeting"

weekday_event : Weekday -> Event -> ShortAns;

-- "Friday afternoon"
date_timeOfDay : Date -> Time_Of_Day -> ShortAns;


-- "Meeting on friday at five"
-- "Meeting at five on friday"

event_date_time     : Event -> Date     -> Time     -> ShortAns;
event_datePR_time   : Event -> Date_Ref -> Time     -> ShortAns;
event_date_timePR   : Event -> Date     -> Time_Ref -> ShortAns;
event_datePR_timePR : Event -> Date_Ref -> Time_Ref -> ShortAns;

event_date_time_timeOfDay          : Event -> Date     -> Time     -> Time_Of_Day -> ShortAns;
event_thatdate_time_timeOfDay      : Event -> Date_Ref -> Time     -> Time_Of_Day -> ShortAns;
event_date_thattime_timeOfDay      : Event -> Date     -> Time_Ref -> Time_Of_Day -> ShortAns;
event_thattdate_thattime_timeOfDay : Event -> Date_Ref -> Time_Ref -> Time_Of_Day -> ShortAns;




-- "At five on friday"
-- "on friday at five"

time_date     : Time     -> Date     -> ShortAns;
time_datePR   : Time     -> Date_Ref -> ShortAns;
timePR_date   : Time_Ref -> Date     -> ShortAns;
timePR_datePR : Time_Ref -> Date_Ref -> ShortAns;


-- "at five in the afternoon on friday

time_date_timeOfDay     : Time     -> Date     -> Time_Of_Day -> ShortAns;
time_datePR_timeOfDay   : Time     -> Date_Ref -> Time_Of_Day -> ShortAns;
timePR_date_timeOfDay   : Time_Ref -> Date     -> Time_Of_Day -> ShortAns;
timePR_datePR_timeOfDay : Time_Ref -> Date_Ref -> Time_Of_Day -> ShortAns;





-- predicate


-- U: What can you do?
usage : Question;

-- U: How is the schedule for monday?
how_is_schedule          : Date     -> Question;
how_is_schedule_thatdate : Date_Ref -> Question;

-- U: When is event on day?
when_is_event_day     : Event -> Date     -> Question;
when_is_event_thatday : Event -> Date_Ref -> Question;
when_is_weekday_event : Weekday -> Event -> Question;

-- U: What time is event?
what_time_is_event : Event -> Question;


-- U: What is the date today?
what_is_the_date : Question;


-- U: Am I booked Date Time?

am_I_booked                   : Date     -> Time     -> Question;
am_I_booked_thatdate          : Date_Ref -> Time     -> Question;
am_I_booked_thattime          : Date     -> Time_Ref -> Question;
am_I_booked_thattime_thatdate : Date_Ref -> Time_Ref -> Question;


-- U: Am I booked Date Time TOD?

am_I_booked_tod                   : Date     -> Time     -> Time_Of_Day -> Question;
am_I_booked_thatdate_tod          : Date_Ref -> Time     -> Time_Of_Day -> Question;
am_I_booked_thattime_tod          : Date     -> Time_Ref -> Time_Of_Day -> Question;
am_I_booked_thattime_thatdate_tod : Date_Ref -> Time_Ref -> Time_Of_Day -> Question;

-- U: What day is the Event?

what_day_is_event : Event -> Question;


-- U: What day is the Event at Time?

what_day_is_event_at_time     : Event -> Time     -> Question;
what_day_is_event_at_thattime : Event -> Time_Ref -> Question;

-- U: What day is the Event at Time TOD?

what_day_is_event_at_time_tod     : Event -> Time     -> Time_Of_Day -> Question;
what_day_is_event_at_thattime_tod : Event -> Time_Ref -> Time_Of_Day -> Question;




-- actions

-- action top "back to top" "restart" "börja om från början"

top : Action;


-- action add


add : Action;

add__event              : Event -> Action;
add__event_timespec     : Event -> Time_Spec -> Action;

add__reference          : General_Ref -> Action;


-- action delete

delete : Action;
delete__everything : Action;
delete__everything_date : Date -> Action;

delete__event              : Event -> Action;
delete__event_timespec     : Event -> Time_Spec -> Action;

delete__reference          : General_Ref -> Action;
delete__reference_timespec : General_Ref -> Time_Spec -> Action;




-- action change

change : Action;

change__event                     : Event -> Action;
change__event_timespec            : Event -> Time_Spec -> Action;


change__event_toDate              : Event -> Date      -> Action;
change__event_timespec_toDate     : Event -> Time_Spec -> Date -> Action;
change__event_timespec_toTime     : Event -> Time_Spec -> Time -> Action;

change__reference                 : General_Ref -> Action;

change__reference_toDate          : General_Ref -> Date -> Action;
change__reference_timespec_toDate : General_Ref -> Time_Spec -> Date -> Action;
change__reference_timespec_toTime : General_Ref -> Time_Spec -> Time -> Action;


change__weekday_event             : Weekday -> Event -> Action;
change__weekday_event_toDate      : Weekday -> Event -> Date -> Action;
change__weekday_event_toTime      : Weekday -> Event -> Time -> Action;



-- action change_date 

change_date : Action;

change_date__event                 : Event -> Action;
change_date__event_timespec        : Event -> Time_Spec -> Action;

change_date__event_toDate          : Event -> Date      -> Action;
change_date__event_timespec_toDate : Event -> Time_Spec -> Date -> Action;

change_date__reference             : General_Ref -> Action;
change_date__reference_toDate      : General_Ref -> Date -> Action;

change_date__weekday_event         : Weekday -> Event -> Action;
change_date__weekday_event_toDate  : Weekday -> Event -> Date -> Action;


-- action change_time
----- change_time_event/date/time "I want to change the time for the lecture on tuesday at five"

change_time : Action;

change_time__event                 : Event -> Action;
change_time__event_timespec        : Event -> Time_Spec -> Action;

change_time__event_toTime          : Event -> Time -> Action;
change_time__event_timespec_toTime : Event -> Time_Spec -> Time -> Action;

----- change_time__reference "I want to change the time for that"
change_time__reference             : General_Ref -> Action;


----- change_time__reference_toTime "I want to change the time for that to TIME"
change_time__reference_toTime : General_Ref -> Time -> Action;


change_time__weekday_event             : Weekday -> Event -> Action;
change_time__weekday_event_toTime      : Weekday -> Event -> Time -> Action;


-- action go_to "Go to march", "go to monday the second"


goto_month : Month -> Action;
goto_date  : Date  -> Action;

-- change language

change_language             : Action;
change_language_to_language : Language -> Action;

-- get_info

get_info : Action;


}
