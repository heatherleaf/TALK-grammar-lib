
incomplete concrete AgendaSystemI of AgendaSystem = 
    open GodisLang, Grammar, AgendaLexicon in {

lin

----------------------------------------------------------------------
-- focus

focus_Date  x = emphasize x;
focus_Time  x = emphasize x;
focus_Event x = emphasize x;


------------------------------------------------------
-- short anwers

event x = x;
time  x = x;
date  x = x;
month x = x;
time_of_day x = x;


------------------------------------------------------------------------------
-- Predicates and Questions 


-- S: What date?
date_to_add_Q = isDoing ** which_N_do_you_want_to_V2 date_N add_V2;
-- U: DATE
date_to_add_P x = isDoing ** you_want_to_VP (ComplV2 add_V2 x);


-- S: What time?
time_to_add_Q = isDoing ** which_N_do_you_want_to_V2 time_N add_V2 ;
-- U: TIME
time_to_add_P x = isDoing ** you_want_to_VP (ComplV2 add_V2 x);

-- S: What type of booking?
event_to_add_Q = isDoing ** which_N_do_you_want_to_V2 event_N add_V2;
-- U: EVENT
event_to_add_P x = isDoing ** you_want_to_VP (ComplV2 add_V2 x);



------------------------------------------------------------------------------

-- agenda_add

-- agenda_add     = sf ["add a booking to the agenda"] ["added a booking to the agenda"];
agenda_add     = hasDone ** ComplV3 add_V3 (indef_N_sg booking_N) (the_N_sg agenda_N);


-- agenda_delete
agenda_delete = hasDone ** ComplV3 delete_V3 (indef_N_sg booking_N) (the_N_sg agenda_N);

-- agenda_move

agenda_move = hasDone ** V2_the_N move_V2 booking_N;

-- agenda_goto 

agenda_goto_date = hasDone ** V2_the_N goto_V2 date_N;
agenda_goto_month = hasDone ** V2_the_N goto_V2 month_N; 

-- agenda_change_time

agenda_change = hasDone ** V2_the_N change_V2 time_N;

}
