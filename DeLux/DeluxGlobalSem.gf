--# -path=.:../Common:prelude

concrete DeluxGlobalSem of DeluxGlobal = GodisUserSem, RoomsSem, LampsSem ** 
    open Prolog, GodisApp, DeluxSystemSem in {


oper 

delux : App = app "domain_delux";

Preds : Type = PStr ** {r, l, d : Str};

preds : Str -> Str -> Preds = \core, tail -> 
    pp0 (core + tail) ** 
    {r = "room_" + core; l = "lamp_" + core; d = "specified_dimmer_value_" + core};

all : PStr = pp0 "all";


------------------------------------------------------
-- Actions

lin

modify_light            v     = delux ** pm1 (request v);
modify_light__lamp      v   l = delux ** pm2 (request v) (answer (pp1 v.l l));
modify_light__room      v r   = delux ** pm2 (request v) (answer (pp1 v.r r));
modify_light__room_lamp v r l =
    delux ** pm3 (request v) (answer (pp1 v.r r)) (answer (pp1 v.l l));

modify_light__all_lamps       v = delux ** pm2 (request v) (answer (pp1 v.l all));
modify_light__all_rooms       v = delux ** pm2 (request v) (answer (pp1 v.r all));
modify_light__all_rooms_lamps v =
    delux ** pm3 (request v) (answer (pp1 v.r all)) (answer (pp1 v.l all));

lincat ActionVerb = Preds;

lin
TurnOn  = preds "turn_on"  "_light";
TurnOff = preds "turn_off" "_light";
Dim     = preds "dim"      "_light";
Undim   = preds "undim"    "_light";


-------------------------------------------------------------
-- Predicates and questions

lin
what_lights            o     = delux ** pm1 (ask (pWhQ o.whq.s));
what_lights__room      o r   = delux ** pm2 (ask (pWhQ o.whq.s)) (answer (pp1 o.whq.r r));
what_lights__lamp      o   l = delux ** pm2 (ask (pWhQ o.whq.s)) (answer (pp1 o.whq.l l));
what_lights__room_lamp o r l 
    = delux ** pm3 (ask (pWhQ o.whq.s)) (answer (pp1 o.whq.r r)) (answer (pp1 o.whq.l l));

light_status            o     = delux ** pm1 (askYNQ o.ynq);
light_status__room      o r   = delux ** pm2 (askYNQ o.ynq) (answer (pp1 o.ynq.r r));
light_status__lamp      o   l = delux ** pm2 (askYNQ o.ynq) (answer (pp1 o.ynq.l l));
light_status__room_lamp o r l 
    = delux ** pm3 (askYNQ o.ynq) (answer (pp1 o.ynq.r r)) (answer (pp1 o.ynq.l l));

not_what_lights  o = delux ** pm1 (answer (issue (pWhQ o.whq.s)));
not_light_status o = delux ** pm1 (answer (issue (o.ynq)));

lincat OnOff = {whq : Preds; ynq : Preds};

lin
On  = {whq = preds "light_on" "";
       ynq = preds "light_status_on" ""};
Off = {whq = preds "light_off" "";
       ynq = preds "light_status_off" ""};


----------------------------------------------------------------------
-- specific predicates

modify_light__answer_room v r = delux ** pm1 (answer (pp1 v.r r));
modify_light__answer_lamp v l = delux ** pm1 (answer (pp1 v.l l));
what_lights__answer_room  o r = delux ** pm1 (answer (pp1 o.whq.r r));
what_lights__answer_lamp  o l = delux ** pm1 (answer (pp1 o.whq.l l));
light_status__answer_room o r = delux ** pm1 (answer (pp1 o.ynq.r r));
light_status__answer_lamp o l = delux ** pm1 (answer (pp1 o.ynq.l l));

not_modify_light__answer_room v r = delux ** pm1 (answer (not (pp1 v.r r)));
not_modify_light__answer_lamp v l = delux ** pm1 (answer (not (pp1 v.l l)));
not_what_lights__answer_room  o r = delux ** pm1 (answer (not (pp1 o.whq.r r)));
not_what_lights__answer_lamp  o l = delux ** pm1 (answer (not (pp1 o.whq.l l)));
not_light_status__answer_room o r = delux ** pm1 (answer (not (pp1 o.ynq.r r)));
not_light_status__answer_lamp o l = delux ** pm1 (answer (not (pp1 o.ynq.l l)));


----------------------------------------------------------------------
-- action answers

lin

top_delux_AA = delux ** pm1 (request top);
modify_light_AA v = delux ** pm1 (request v);

modify_light__room_lamp_AA v r l =
    delux ** pm3 (request v) (answer (pp1 v.r r)) (answer (pp1 v.l l));

modify_light__room_lamp_dimvalue_AA v r l d = delux ** pm4 (request v) 
    (answer (pp1 v.r r)) (answer (pp1 v.l l)) (answer (pp1 v.d d));

}

