--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete AgendaUserSwe of AgendaUser = GodisUserSwe, BookingSwe ** 
    open GodisMM, GodisLangSwe, Prelude, AgendaLexiconSwe, AgendaSystemSwe, CommonScand in {

oper 

E_at_T : NP -> NP -> Str
    = \e,t -> variants{e.s!NPNom ++ "klockan" ++ t.s!NPNom;
                       e.s!NPNom ++ "vid" ++ t.s!NPNom;
                       e.s!NPNom ++ t.s!NPNom};

date_tod_variants : NP -> NP -> Str = \d,tod -> variants {(d.s!NPNom ++ tod.s!NPNom);
                                                          (tod.s!NPNom ++ d.s!NPNom)};

time_tod_variants : NP -> NP -> Str = \t,tod -> variants {(t.s!NPNom ++ tod.s!NPNom);
                                                          (tod.s!NPNom ++ t.s!NPNom)};


time_date_variants : NP -> NP -> Str = \t,d -> variants{ (t.s!NPNom ++ d.s!NPNom);
                                                         (d.s!NPNom ++ t.s!NPNom)};


time_date_tod_variants : NP -> NP -> NP -> Str 
                = \t,d,tod -> variants{ (d.s!NPNom   ++ t.s!NPNom   ++ tod.s!NPNom);
                                        (d.s!NPNom   ++ tod.s!NPNom ++ t.s!NPNom  );
                                        (t.s!NPNom   ++ d.s!NPNom   ++ tod.s!NPNom);
                                        (t.s!NPNom   ++ tod.s!NPNom ++ d.s!NPNom  );
                                        (tod.s!NPNom ++ d.s!NPNom   ++ t.s!NPNom  );
                                        (tod.s!NPNom ++ t.s!NPNom   ++ d.s!NPNom  )};

hur_schemat_variants : Str = variants {["hur ser schemat ut"];
                                       ["vad har jag bokat"];
                                       ["hur �r mitt schema"];
                                       ["�r jag ledig"];
                                       ["�r jag bokad"];
                                       ["kolla om jag �r bokad"];
                                       ["vad g�r jag"];
                                       ["vad h�nder"];
                                       ["hur ser programmet ut"];
                                       ["visa mig mina bokningar"];
                                       ["visa mig mitt schema"];
				       ["vad har jag f�r bokningar"];
				       ["har jag n�got p� schemat"];
				       ["vad st�r p� schemat"];
				       ["finns det n�gon bokning"];
				       ["finns det n�gra bokningar"];
				       ["vilka bokningar finns det"];
				       ["kolla om jag �r bokad"];
				       ["kolla om jag har n�got bokat"];
				       ["kolla vilka bokningar jag har"];
				       ["kolla vad jag har bokat"];
				       ["kolla vad som finns bokat"];
				       ["kolla vad jag g�r"];
				       ["kolla vad jag har p� schemat"];
				       ["kolla mina bokningar"];
				       ["vad st�r i min kalender"];
				       ["�r jag uppbokad"];
				       ["�r jag upptagen"];
				       ["hur ser mitt schema ut"];
				       ["hur ser min kalender ut"];
				       ["hur ser mitt program ut"];
				       ["visa mina bokningar"];
				       ["visa alla mina bokningar"];
				       ["visa vad jag har bokat"];
				       ["har jag n�got inbokat"];
				       ["vad st�r i min kalender"]};


to_agenda : Str = optStr (variants {"i";"till"} ++ 
                          variants {["agendan"];
                                    ["min agenda"];
                                    ["schemat"];
                                    ["mitt schema"];
                                    ["programmet"];
                                    ["mitt program"];
                                    ["kalendern"];
                                    ["min kalender"]});

add_variants : Str = (variants {["l�gga till"];
                                ["anteckna"];
                                ["boka"];
                                ["boka in"];
                                ["f�ra in"]});

imp_add_variants : Str = (variants {["l�gg till"];["f�r in"]});

singular_add_variants : Str = (variants {["jag har"];
                                         ["jag ska p�"];
                                         ["jag ska till"]});


from_agenda : Str = optStr (variants {"ur";"fr�n"} ++ 
                            variants {["agendan"];
                                      ["schemat"];
                                      ["programmet"];
                                      ["min agenda"];
                                      ["mitt schema"];
                                      ["mitt program"];
                                      ["kalendern"];
                                      ["min kalender"];
                                      ["ur kalendern"];});


delete_variants : Str = (variants {["ta bort"];
                                   ["radera"];
                                   ["avboka"]});


a_booking_variants : Str = (variants {["n�gonting"];
                                      ["n�got"];
                                      ["en bokning"];
				      ["en anteckning"]});



change_variants : Str = (variants {["boka om"];
                                   ["flytta"];
                                   ["�ndra"]});



change_date_variants : Str = (variants {["�ndra dagen f�r"];
                                        ["�ndra datumet f�r"];
                                        ["boka om"];
                                        ["flytta"]});




change_time_variants : Str = (variants {["�ndra tiden f�r"];
                                        ["boka om"];}); 


go_to_variants : Str = (variants {["g� till"];
                                  ["visa"];
				  ["visa mig"];
				  ["g� fram till"];
				  ["g� tillbaka till"];
				  ["kan du visa mig"];
				  ["kan jag f� se"];
                                  ["hoppa till"];
                                  ["g� fram till"];
                                  ["g� tillbaka till"];
                                  ["hoppa fram till"];
                                  ["hoppa tillbaka till"]});


what_time_variants : Str = variants {["n�r �r"];
                                     ["vilken tid �r"];
				     ["n�r har jag"];
				     ["vilken tid b�rjar"];
                                     ["n�r h�lls"];
                                     ["kolla tiden f�r"]};


change_language_variants : Str = variants {["byta spr�k"];
                                           ["�ndra spr�k"]};

imp_change_language_variants : Str = variants {["byt spr�k"]};


alla_anteckningar_variants : Str = variants {["alla anteckningar"];
                                             ["alla noteringar"];
					     ["alla poster"];
					     ["allt"];
					     ["allting"]};


what_date_variants : Str = variants { ["vilket datum �r"];
                                      ["vilken dag �r"] };


--##-- SHORT ANSWERS --##--

lin


-- Specs

tod_spec                   tod     = ss (tod.s!NPNom);
time_spec                  t       = ss (t.s!NPNom);
date_spec                  d       = ss (d.s!NPNom);
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




event       e = noClick ( ansNP e);
time        t = noClick (ansNP t);
date        d = noClick (ansNP d);
month       m = noClick (ansNP m);
time_of_day t = noClick (ansNP t);
newdate     d = noClick (ss ("till" ++ d.s!NPNom));
language    l = noClick (ansNP l);

date_Ref    x = noClick (ansNP x);
time_Ref    x = noClick (ansNP x);
general_Ref x = noClick (ansNP x);


both        = noClick (ss (["b�da"]));
time_answer = noClick (ss (variants {["tid"];
                            ["tiden"];
			    ["information om tiden"];
			    ["tidsinformationen"]}));
date_answer = noClick (ss (variants {["datum"];
                            ["datumet"];
			    ["dagen"];
			    ["dag"];
			    ["information om dagen"];
			    ["informationen om dagen"];
			    ["informationen om datumet"]}));

-- "m�te klockan fem"
event_time   x y = noClick (ss (E_at_T x y));
event_timePR e t = noClick (ss (e.s!NPNom ++ t.s!NPNom));


-- "m�te p� fredag"
event_date   e d = noClick (ss (e.s!NPNom ++ d.s!NPNom));
event_datePR e d = noClick (ss (e.s!NPNom ++ d.s!NPNom));


-- "fredagens m�te"

weekday_event w e = noClick (ss (w.s!NPNom ++ e.s!NPNom));

-- "Fredag eftermiddag"

date_timeOfDay d tod = noClick (ss (d.s!NPNom ++ tod.s!NPNom));


-- "m�te p� fredag klockan fem"

event_date_time     e d t = noClick (ss (e.s!NPNom ++ time_date_variants t d));
event_datePR_time   e d t = noClick (ss (e.s!NPNom ++ time_date_variants t d));
event_date_timePR   e d t = noClick (ss (e.s!NPNom ++ time_date_variants t d));
event_datePR_timePR e d t = noClick (ss (e.s!NPNom ++ time_date_variants t d));


-- "m�te p� fredag klockan fem p� eftermiddagen

event_date_time_timeOfDay          e d t tod = noClick (ss (e.s!NPNom ++ time_date_tod_variants d t tod));
event_thatdate_time_timeOfDay      e d t tod = noClick (ss (e.s!NPNom ++ time_date_tod_variants d t tod));
event_date_thattime_timeOfDay      e d t tod = noClick (ss (e.s!NPNom ++ time_date_tod_variants d t tod));
event_thattdate_thattime_timeOfDay e d t tod = noClick (ss (e.s!NPNom ++ time_date_tod_variants d t tod));


-- "klockan fem p� fredag"
time_date     t d = noClick (ss (time_date_variants t d));
time_datePR   t d = noClick (ss (time_date_variants t d));
timePR_date   t d = noClick (ss (time_date_variants t d));
timePR_datePR t d = noClick (ss (time_date_variants t d));

-- klockan fem p� eftermiddagen p� fredag

time_date_timeOfDay     t d tod = noClick (ss (time_date_tod_variants d t tod));
time_datePR_timeOfDay   t d tod = noClick (ss (time_date_tod_variants d t tod));
timePR_date_timeOfDay   t d tod = noClick (ss (time_date_tod_variants d t tod));
timePR_datePR_timeOfDay t d tod = noClick (ss (time_date_tod_variants d t tod));



--##-- PREDICATES --##--


-- U: What can you do?
usage = noClick (ss (variants { ["vad kan man g�ra"];
                       ["hur anv�nder jag det h�r"];
		       ["jag beh�ver instruktioner"] }));

-- U: How is the schedule for monday?
how_is_schedule          d = noClick (ss ( hur_schemat_variants ++ d.s!NPNom));
how_is_schedule_thatdate d = noClick (ss ( hur_schemat_variants ++ d.s!NPNom));


-- U: When is event on day?
when_is_event_day     e d = noClick (ss ( what_time_variants ++ e.s!NPNom ++ d.s!NPNom ));
when_is_event_thatday e d = noClick (ss ( what_time_variants ++ e.s!NPNom ++ d.s!NPNom ));
when_is_weekday_event w e = noClick (ss ( what_time_variants ++ w.s!NPNom ++ e.s!NPNom));

-- U: What time is event?

what_time_is_event e = noClick (ss ( ["n�r �r"] ++ e.s!NPNom ));

-- U: What is the date today?

what_is_the_date = noClick (ss (variants {["vad �r det f�r datum idag"];
                                 ["vad �r dagens datum"];
				 ["vilket �r dagens datum"];
				 ["kan du ge mig dagens datum"];
				 ["kan du ge mig dagens datum tack"];
				 ["jag beh�ver dagens datum"];
				 ["jag skulle vilja veta dagens datum"];
				 ["jag skulle vilja veta dagens datum tack"];
				 ["veta dagens datum"];
				 ["kan du vara sn�ll och ge mig dagens datum"];
				 ["dagens datum tack"];
				 ["vilken dag �r det idag"]}));


-- U: Am I booked Date Time?

am_I_booked                   d t = noClick (ss ( hur_schemat_variants ++ time_date_variants t d));
am_I_booked_thatdate          d t = noClick (ss ( hur_schemat_variants ++ time_date_variants t d));
am_I_booked_thattime          d t = noClick (ss ( hur_schemat_variants ++ time_date_variants t d));
am_I_booked_thattime_thatdate d t = noClick (ss ( hur_schemat_variants ++ time_date_variants t d));

-- U: Am I booked Date Time?

am_I_booked_tod                   d t tod = noClick (ss ( hur_schemat_variants ++ time_date_tod_variants t d tod));
am_I_booked_thatdate_tod          d t tod = noClick (ss ( hur_schemat_variants ++ time_date_tod_variants t d tod));
am_I_booked_thattime_tod          d t tod = noClick (ss ( hur_schemat_variants ++ time_date_tod_variants t d tod));
am_I_booked_thattime_thatdate_tod d t tod = noClick (ss ( hur_schemat_variants ++ time_date_tod_variants t d tod));


-- U: What day is the Event?

what_day_is_event e = noClick (ss ( what_date_variants ++ e.s!NPNom));


-- U: What day is the Event at Time?

what_day_is_event_at_time     e t = noClick (ss (what_date_variants ++ E_at_T e t));
what_day_is_event_at_thattime e t = noClick (ss (what_date_variants ++ E_at_T e t));

-- U: What day is the Event at Time TOD?

what_day_is_event_at_time_tod     e t tod = noClick (ss (what_date_variants ++ E_at_T e t ++ tod.s!NPNom));
what_day_is_event_at_thattime_tod e t tod = noClick (ss (what_date_variants ++ E_at_T e t ++ tod.s!NPNom));


--##-- ACTIONS --##--

-- action top
top = noClick (ss (variants {["b�rja om fr�n b�rjan"];
                    ["starta om"];
		    ["starta om fr�n b�rjan"];
		    ["tillbaka till b�rjan"];
		    ["g� tillbaka till b�rjan"];
		    ["g� upp"];
		    ["g� tillbaka"];
		    ["g� till toppniv�n"];
		    ["gl�m allt"]}));

-- action add
add = noClick (variants{ 
                reqVP agenda_add;
		ss (variants{ imp_add_variants ; ["g�r en anteckning"]});
                req1 imp_add_variants;
		req1 ["g�ra en anteckning"];
 		req1x add_variants (optStr a_booking_variants ++ to_agenda);
		ss( imp_add_variants ++ optStr a_booking_variants ++ to_agenda)});


add__event          e    = noClick (variants {
                                     (req1x add_variants (e.s!NPNom ++ to_agenda));
                                     (ss ( singular_add_variants ++ e.s!NPNom));
				     (ss (imp_add_variants ++ e.s!NPNom))});

add__event_timespec e ts = noClick (variants {
                                     (req1x add_variants (e.s!NPNom ++ ts.s ++ to_agenda));
                                     (ss( singular_add_variants ++ e.s!NPNom));
				     (ss (imp_add_variants ++ e.s!NPNom))});

add__reference r = noClick (variants {
                              ss (["l�gg tillbaka"] ++ (r.s!NPNom ++ to_agenda));
                             (req1x ["l�gga tillbaka"] (r.s!NPNom ++ to_agenda))});



-- action delete
delete = noClick (variants { (reqVP agenda_delete);
                    (req1 delete_variants);
		    (req1x delete_variants (a_booking_variants ++ from_agenda))});

delete__everything = noClick (req1x delete_variants (alla_anteckningar_variants ++ from_agenda));

delete__everything_date d = noClick (req1x delete_variants (alla_anteckningar_variants ++ d.s!NPNom ++ from_agenda));


delete__event          e    = noClick (req1x delete_variants (e.s!NPNom ++ from_agenda));
delete__event_timespec e ts = noClick (req1x delete_variants (e.s!NPNom ++ ts.s ++ from_agenda));

delete__reference          r    = noClick (req1x delete_variants (r.s!NPNom ++ from_agenda));
delete__reference_timespec r ts = noClick (req1x delete_variants (r.s!NPNom ++ ts.s ++ from_agenda));


-- action change

change = noClick (variants { 
                    (reqVP agenda_move);
                    (req1 change_variants);
		    (req1x change_variants (a_booking_variants))});


change__event          e    = noClick (req1x change_variants (e.s!NPNom));
change__event_timespec e ts = noClick (req1x change_variants (e.s!NPNom ++ ts.s));

change__event_toDate          e nd    = noClick (req1x change_variants (e.s!NPNom ++ "till" ++ nd.s!NPNom));
change__event_timespec_toDate e ts nd = noClick (req1x change_variants (e.s!NPNom ++ ts.s ++ "till" ++ nd.s!NPNom));
change__event_timespec_toTime e ts nt = noClick (req1x change_variants (e.s!NPNom ++ ts.s ++ "till" ++ nt.s!NPNom));

change__reference r = noClick (req1x change_variants (r.s!NPNom));

change__reference_toDate          r nd    = noClick (req1x change_variants (r.s!NPNom ++ "till" ++ nd.s!NPNom));
change__reference_timespec_toDate r ts nd = noClick (req1x change_variants (r.s!NPNom ++ ts.s ++ "till" ++ nd.s!NPNom));
change__reference_timespec_toTime r ts nt = noClick (req1x change_variants (r.s!NPNom ++ ts.s ++ "till" ++ nt.s!NPNom));

change__weekday_event        w e   = noClick (req1x change_variants (w.s!NPNom ++ e.s!NPNom));
change__weekday_event_toDate w e d = noClick (req1x change_variants (w.s!NPNom ++ e.s!NPNom ++ d.s!NPNom));
change__weekday_event_toTime w e t = noClick (req1x change_variants (w.s!NPNom ++ e.s!NPNom ++ t.s!NPNom));




-- action change_date
change_date = noClick (variants { 
                         reqVP agenda_move;
                         req1 change_date_variants;
                         req1x change_date_variants (a_booking_variants)});



change_date__event e = noClick (variants { 
                               (req1x change_date_variants (e.s!NPNom));
                               (req1x change_variants (e.s!NPNom ++ variants {["till en annan dag"];
				                                              ["till ett annat datum"]}))});
change_date__event_timespec e ts  = noClick (variants { 
                                       (req1x change_date_variants (e.s!NPNom ++ ts.s));
                                       (req1x change_variants (e.s!NPNom ++ ts.s ++ variants {["till en annan dag"];
					                                                      ["till ett annat datum"]}))});


change_date__reference r = noClick (variants { (req1x change_date_variants (r.s!NPNom));
                                      (req1x change_variants (r.s!NPNom ++ variants {["till en annan dag"];
				                                                     ["till ett annat datum"]}))});


change_date__event_toDate          e nd     = noClick (req1x change_date_variants (e.s!NPNom ++ "till" ++ nd.s!NPNom));
change_date__event_timespec_toDate e ts nd  = noClick (req1x change_date_variants (e.s!NPNom ++ ts.s ++ "till" ++ nd.s!NPNom));

change_date__reference_toDate r nd = noClick (req1x change_date_variants (r.s!NPNom ++ "till" ++ nd.s!NPNom));



change_date__weekday_event w e   = noClick (variants { 
                               (req1x change_date_variants (w.s!NPNom ++ e.s!NPNom));
                               (req1x change_variants (w.s!NPNom ++ e.s!NPNom ++ variants {["till en annan dag"];
				                                                           ["till ett annat datum"]}))}); 

change_date__weekday_event_toDate w e d = noClick (req1x change_date_variants (w.s!NPNom ++ e.s!NPNom ++ "till" ++ d.s!NPNom));



-- action change_time
lin
change_time = noClick (variants { reqVP agenda_change;
                         req1 change_time_variants;
                         req1x change_time_variants (a_booking_variants)});


change_time__event          e     = noClick (variants { 
                                               (req1x change_time_variants (e.s!NPNom));
                                               (req1x change_variants (e.s!NPNom ++ ["till en annan tid"]))});
change_time__event_timespec e ts  = noClick (variants { 
                                               (req1x change_time_variants (e.s!NPNom ++ ts.s));
                                               (req1x change_variants (e.s!NPNom ++ ts.s ++ ["till en annan tid"]))});


change_time__reference r = noClick (variants { 
                                      (req1x change_time_variants (r.s!NPNom));
                                      (req1x change_variants (r.s!NPNom ++ ["till en annan tid"]))});


change_time__event_toTime          e nt    = noClick (req1x change_time_variants (e.s!NPNom ++ "till" ++ nt.s!NPNom));
change_time__event_timespec_toTime e ts nt = noClick (req1x change_time_variants (e.s!NPNom ++ ts.s ++ "till" ++ nt.s!NPNom));



change_time__reference_toTime r nt = noClick (req1x change_time_variants (r.s!NPNom ++ "till" ++ nt.s!NPNom));


change_time__weekday_event w e   = noClick (variants { 
                              (req1x change_time_variants (w.s!NPNom ++ e.s!NPNom));
                              (req1x change_variants (w.s!NPNom ++ e.s!NPNom ++ ["till en annan tid"]))}); 

change_time__weekday_event_toTime w e t = noClick (req1x change_time_variants (w.s!NPNom ++ e.s!NPNom ++ "till" ++ t.s!NPNom));



-- goto
goto_month m = noClick (ss (go_to_variants ++ m.s!NPNom ++ optStr "tack"));
goto_date  d = noClick (ss (go_to_variants ++ d.s!NPNom ++ optStr "tack"));

-- change language

change_language = noClick (variants { 
                             ss (imp_change_language_variants);
                             req1 change_language_variants });

change_language_to_language l = noClick (variants { 
                               (ss (imp_change_language_variants ++ ["till"] ++ l.s!NPNom));
                               (req1x change_language_variants ("till" ++ l.s!NPNom))});

-- get info

get_info = noClick (ss (variants {["kolla min kalender"];
                                  ["leta upp information"];
			          ["leta upp information in min kalender"];
			          ["kolla mitt schema"];
			          ["kolla agendan"];
                                  ["fr�ga kalendern"];
                                  ["fr�ga min kalender n�gonting"]}));

}
