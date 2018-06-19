--# -path=.:../Common:prelude

abstract DeluxGlobal = GodisUser, Rooms, Lamps ** {

-------------------------------------------------------------------------
-- Actions

fun

modify_light            : ActionVerb -> Action;
modify_light__lamp      : ActionVerb -> Lamp -> Action;
modify_light__room      : ActionVerb -> Room -> Action;
modify_light__room_lamp : ActionVerb -> Room -> Lamp -> Action;

modify_light__all_lamps,
modify_light__all_rooms,
modify_light__all_rooms_lamps : ActionVerb -> Action;

cat ActionVerb;
fun TurnOn, TurnOff, Dim, Undim : ActionVerb;


------------------------------------------------------------------------
-- Questions used by the User

fun
-- U: What lights are on/off?
what_lights            : OnOff -> Question;
what_lights__room      : OnOff -> Room -> Question;
what_lights__lamp      : OnOff -> Lamp -> Question;
what_lights__room_lamp : OnOff -> Room -> Lamp -> Question;

-- U: is the light on/off?
light_status            : OnOff -> Question;
light_status__room      : OnOff -> Room -> Question;
light_status__lamp      : OnOff -> Lamp -> Question;
light_status__room_lamp : OnOff -> Room -> Lamp -> Question;

not_what_lights, not_light_status : OnOff -> Answer;

cat OnOff;
fun On, Off : OnOff;


----------------------------------------------------------------------
-- specific predicates

modify_light__answer_room : ActionVerb -> Room -> Answer;
modify_light__answer_lamp : ActionVerb -> Lamp -> Answer;
what_lights__answer_room  : OnOff -> Room -> Answer;
what_lights__answer_lamp  : OnOff -> Lamp -> Answer;
light_status__answer_room : OnOff -> Lamp -> Answer;
light_status__answer_lamp : OnOff -> Lamp -> Answer;

not_modify_light__answer_room : ActionVerb -> Room -> Answer;
not_modify_light__answer_lamp : ActionVerb -> Lamp -> Answer;
not_what_lights__answer_room  : OnOff -> Room -> Answer;
not_what_lights__answer_lamp  : OnOff -> Lamp -> Answer;
not_light_status__answer_room : OnOff -> Lamp -> Answer;
not_light_status__answer_lamp : OnOff -> Lamp -> Answer;

----------------------------------------------------------------------
-- action answers

top_delux_AA : Answer;
modify_light_AA : ActionVerb -> Answer;

modify_light__room_lamp_AA : ActionVerb -> Room -> Lamp -> Answer;
modify_light__room_lamp_dimvalue_AA : ActionVerb -> Room -> Lamp -> DimmerValue -> Answer;


}


