
incomplete concrete DeluxGlobalI of DeluxGlobal = 
    open Grammar, GodisLang, GodisMM, Prolog,
         (P=DeluxSystemSem), (Q=DeluxGlobalSem), DeluxSystem, DeluxLexicon in {


oper

the        : N -> NP      = \x   -> the_N_sg x;
in_the     : N -> Adv     = \x   -> in_NP (the x);
the_R_L    : N -> N -> NP = \r,l -> the (prefix_N r l);
the_L_in_R : N -> N -> NP = \l,r -> AdvNP (the l) (in_the r);
R_light    : N -> N       = \r   -> prefix_N r light_N;


----------------------------------------------------------------------
-- Actions

lin


modify_light            v     = noClick -- actionClick v 
    (reqVP (V2_the_N v.verb light_N));
modify_light__lamp      v   l = noClick (reqVP (V2_the_N v.verb l));
modify_light__room      v r   = 
    noClick (variants{reqVP (V2_the_N v.verb (R_light r));
		      reqVP (V2_NP v.verb (the_L_in_R light_N r))});
modify_light__room_lamp v r l = 
    noClick (variants{reqVP (V2_the_N v.verb (prefix_N r l));
			  reqVP (V2_NP v.verb (the_L_in_R l r))});

modify_light__all_lamps v = 
    noClick (reqVP (V2_NP v.verb (all_N_pl light_N)));
modify_light__all_rooms v = 
    noClick (reqVP (V2_NP v.verb (NP_in_NP (the_N_sg light_N) (all_N_pl room_N))));
modify_light__all_rooms_lamps v =
    noClick (reqVP (V2_NP v.verb (NP_in_NP (all_N_pl light_N) (all_N_pl room_N))));

lincat ActionVerb = {verb : V2} ** Q.ActionVerb;

lin 
TurnOn  = {verb = turn_on_V2} ** Q.TurnOn;
TurnOff = {verb = turn_off_V2} ** Q.TurnOff;
Dim     = {verb = dim_V2} ** Q.Dim;
Undim   = {verb = undim_V2} ** Q.Undim;


----------------------------------------------------------------------
-- predicates and questions

lin
what_lights            o     = issueClick (pWhQ o.whq.s)
    (askQS (which_N_are_Adv light_N o));
what_lights__lamp      o   l = noClick (askQS (which_N_are_Adv l o));
what_lights__room      o r   = noClick (variants{askQS (which_N_are_Adv_Adv light_N o (in_the r));
						 askQS (which_N_are_Adv (R_light r) o)});
what_lights__room_lamp o r l = noClick (variants{askQS (which_N_are_Adv_Adv l o (in_the r));
						 askQS (which_N_are_Adv (prefix_N r l) o)});

light_status            o     = issueClick (o.ynq)
    (askQS (is_the_N_Adv light_N o));
light_status__lamp      o   l = noClick (askQS (is_the_N_Adv l o));
light_status__room      o r   = noClick (variants{askQS (is_the_N_Adv_Adv light_N o (in_the r));
						  askQS (is_the_N_Adv (R_light r) o)});
light_status__room_lamp o r l = noClick (variants{askQS (is_the_N_Adv_Adv l o (in_the r));
						  askQS (is_the_N_Adv (prefix_N r l) o)});

not_what_lights  o = issueNegClick (pWhQ o.whq.s);
not_light_status o = issueNegClick (o.ynq);

lincat OnOff = Adv ** Q.OnOff; -- {whq, ynq : PStr};
lin
On  = on_Adv ** Q.On; -- {whq = pp0 "light_on"; ynq = pp0 "light_status_on"};
Off = off_Adv ** Q.Off; -- {whq = pp0 "light_off"; ynq = pp0 "light_status_off"};


----------------------------------------------------------------------
-- specific predicates

modify_light__answer_room v r = onlyClick1 (P.answer (pp1 v.r r.sem));
modify_light__answer_lamp v l = onlyClick1 (P.answer (pp1 v.l l.sem));
what_lights__answer_room  o r = onlyClick1 (P.answer (pp1 o.whq.r r.sem));
what_lights__answer_lamp  o l = onlyClick1 (P.answer (pp1 o.whq.l l.sem));
light_status__answer_room o r = onlyClick1 (P.answer (pp1 o.ynq.r r.sem));
light_status__answer_lamp o l = onlyClick1 (P.answer (pp1 o.ynq.l l.sem));

not_modify_light__answer_room v r = onlyClick1 (P.answer (P.not (pp1 v.r r.sem)));
not_modify_light__answer_lamp v l = onlyClick1 (P.answer (P.not (pp1 v.l l.sem)));
not_what_lights__answer_room  o r = onlyClick1 (P.answer (P.not (pp1 o.whq.r r.sem)));
not_what_lights__answer_lamp  o l = onlyClick1 (P.answer (P.not (pp1 o.whq.l l.sem)));
not_light_status__answer_room o r = onlyClick1 (P.answer (P.not (pp1 o.ynq.r r.sem)));
not_light_status__answer_lamp o l = onlyClick1 (P.answer (P.not (pp1 o.ynq.l l.sem)));


----------------------------------------------------------------------
-- action answers

lin

top_delux_AA = actionClick P.top;
modify_light_AA v = actionClick v;

modify_light__room_lamp_AA v r l = 
    onlyClick3 (P.request v) (P.answer (pp1 v.r r.sem)) (P.answer (pp1 v.l l.sem));

modify_light__room_lamp_dimvalue_AA v r l d = onlyClick4 
    (P.request v) (P.answer (pp1 v.r r.sem)) (P.answer (pp1 v.l l.sem)) (P.answer (pp1 v.d d.sem));


----------------------------------------------------------------------
-- menu button clicks

-- lin

-- click_

}

