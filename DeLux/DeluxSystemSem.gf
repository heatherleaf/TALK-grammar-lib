--# -path=.:../Common:prelude

concrete DeluxSystemSem of DeluxSystem = 
    GodisSystemSem, SocketSem, RoomsSem, LampsSem ** open Prolog in {

lin

----------------------------------------------------------------
-- Actions
top              = pp0 "top";
-- help             = pp0 "help";
turn_off_light = pp0 "turn_off_light";
turn_on_light  = pp0 "turn_on_light";
dim_light      = pp0 "dim_light";
undim_light    = pp0 "undim_light";

-------------------------------------------------------
-- Short answers

room = pp1 "room";
lamp = pp1 "lamp";
socket = pp1 "socket";

-------------------------------------------
-- Predicates and questions

light_on_Q = pWhQ "light_on";
light_on_P = pp1 "light_on";

light_off_Q = pWhQ "light_off";
light_off_P = pp1 "light_off";

light_status_on  = pp0 "light_status_on";
light_status_off = pp0 "light_status_off";

-- action/issue specific predicates

room_turn_on_Q = pWhQ "room_turn_on";
room_turn_on_P = pp1 "room_turn_on";

lamp_turn_on_Q = pWhQ "lamp_turn_on";
lamp_turn_on_P = pp1 "lamp_turn_on";

room_turn_off_Q = pWhQ "room_turn_off";
room_turn_off_P = pp1 "room_turn_off";

lamp_turn_off_Q = pWhQ "lamp_turn_off";
lamp_turn_off_P = pp1 "lamp_turn_off";

room_dim_Q = pWhQ "room_dim";
room_dim_P = pp1 "room_dim";

lamp_dim_Q = pWhQ "lamp_dim";
lamp_dim_P = pp1 "lamp_dim";

room_undim_Q = pWhQ "room_undim";
room_undim_P = pp1 "room_undim";

lamp_undim_Q = pWhQ "lamp_undim";
lamp_undim_P = pp1 "lamp_undim";

room_light_on_Q = pWhQ "room_light_on";
room_light_on_P = pp1 "room_light_on";

lamp_light_on_Q = pWhQ "lamp_light_on";
lamp_light_on_P = pp1 "lamp_light_on";

room_light_off_Q = pWhQ "room_light_off";
room_light_off_P = pp1 "room_light_off";

lamp_light_off_Q = pWhQ "lamp_light_off";
lamp_light_off_P = pp1 "lamp_light_off";

room_light_status_on_Q = pWhQ "room_light_status_on";
room_light_status_on_P = pp1 "room_light_status_on";

lamp_light_status_on_Q = pWhQ "lamp_light_status_on";
lamp_light_status_on_P = pp1 "lamp_light_status_on";

room_light_status_off_Q = pWhQ "room_light_status_off";
room_light_status_off_P = pp1 "room_light_status_off";

lamp_light_status_off_Q = pWhQ "lamp_light_status_off";
lamp_light_status_off_P = pp1 "lamp_light_status_off";


--------------------------------------------------------------
-- Reason

notexist_no_device = pp1 "notexist" (pp0 "no_device");
notexist_no_dim_device = pp1 "notexist" (pp0 "no_dim_device");
already_dimmed = pp0 "already_dimmed";
already_undimmed = pp0 "already_undimmed";
all_lights_on = pp0 "all_lights_on";
all_lights_off = pp0 "all_lights_off";
no_lights_on = pp0 "no_lights_on";
no_lights_off = pp0 "no_lights_off";
no_device = pp0 "no_device"; 


}
