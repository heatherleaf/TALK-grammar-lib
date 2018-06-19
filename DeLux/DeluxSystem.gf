--# -path=.:../Common:prelude

abstract DeluxSystem = GodisSystem, Socket, Rooms, Lamps ** {

fun

----------------------------------------------------------------------
-- Actions
-- System utterances for confirming Actions
 
-- No help in DeLux available
-- help: Action;

-- S: restarting
top : Action;

-- S: turned off the light
turn_off_light : Action;

-- S: turned on the light
turn_on_light : Action;

-- S: dimmed the light
dim_light : Action;

undim_light : Action;

----------------------------------------------------
-- Short answers 

-- ROOM and LAMP ---
-- S: In which room?
-- room_Q : Question;
-- U: The living room
room : Room -> ShortAns;

-- S: Which lamp?
-- lamp_Q : Question;
-- U: The ceiling lamp
lamp : Lamp -> ShortAns;


socket : Socket -> ShortAns;


-------------------------------------------------------------------
-- Predicates


-- ON ---
-- U: Which lights are on?
light_on_Q : Question;

-- S: The ceiling lamp is on/ The lamp in Socket 1 is on
light_on_P : Socket -> Proposition;

-- Skapas automatiskt genom light_on
-- U: Is the kitchen ceiling light on?
-- light_status(on)_Q : Question;

-- U: It is on 
-- light_status(on)_P : Proposition;

-- OFF ---
-- U: Which lights are off?
light_off_Q : Question;

-- S: The ceiling lamp is off
light_off_P : Socket -> Proposition;

-- Skapas automatisk genom light_off FIXA: fråga peter
-- U: Is the (kitchen ceiling) light off?
-- light_status(off)_Q : Room -> Lamp -> Question;
light_status_off : Proposition;
light_status_on  : Proposition;


----------------------------------------------------------------------
-- specific predicates

room_turn_on_Q : Question;
room_turn_on_P : Room -> Proposition;

lamp_turn_on_Q : Question;
lamp_turn_on_P : Lamp -> Proposition;

room_turn_off_Q : Question;
room_turn_off_P : Room -> Proposition;

lamp_turn_off_Q : Question;
lamp_turn_off_P : Lamp -> Proposition;

room_dim_Q : Question;
room_dim_P : Room -> Proposition;

lamp_dim_Q : Question;
lamp_dim_P : Lamp -> Proposition;

room_undim_Q : Question;
room_undim_P : Room -> Proposition;

lamp_undim_Q : Question;
lamp_undim_P : Lamp -> Proposition;

room_light_on_Q : Question;
room_light_on_P : Room -> Proposition;

lamp_light_on_Q : Question;
lamp_light_on_P : Lamp -> Proposition;

room_light_off_Q : Question;
room_light_off_P : Room -> Proposition;

lamp_light_off_Q : Question;
lamp_light_off_P : Lamp -> Proposition;

room_light_status_on_Q : Question;
room_light_status_on_P : Room -> Proposition;

lamp_light_status_on_Q : Question;
lamp_light_status_on_P : Lamp -> Proposition;

room_light_status_off_Q : Question;
room_light_status_off_P : Room -> Proposition;

lamp_light_status_off_Q : Question;
lamp_light_status_off_P : Lamp -> Proposition;


----------------------------------------------------------------------
-- Reason
-- S: There is no such lamp in the room
notexist_no_device     : Reason;
notexist_no_dim_device : Reason;

-- S: the light is already dimmed
already_dimmed   : Reason;
already_undimmed : Reason;

-- S: The lights are already off
all_lights_off : Reason;
all_lights_on  : Reason;

-- S: There are no lights on
no_lights_on  : Reason;
no_lights_off : Reason;
no_device     : Reason;

}
