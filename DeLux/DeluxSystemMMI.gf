
incomplete concrete DeluxSystemMMI of DeluxSystem =
	open DeluxSystemI, (Sem=DeluxSystemSem), (MM=GodisMM) in {

lin

top = top ** MM.sem (Sem.top);
turn_off_light = turn_off_light ** MM.sem (Sem.turn_off_light);
turn_on_light = turn_on_light ** MM.sem (Sem.turn_on_light);
dim_light = dim_light ** MM.sem (Sem.dim_light);
undim_light = undim_light ** MM.sem (Sem.undim_light);


room x1 = room x1 ** MM.sem (Sem.room x1.sem);
lamp x1 = lamp x1 ** MM.sem (Sem.lamp x1.sem);
socket x1 = socket x1 ** MM.sem (Sem.socket x1.sem);


light_on_Q = light_on_Q ** MM.sem (Sem.light_on_Q);
light_on_P x1 = light_on_P x1 ** MM.sem (Sem.light_on_P x1.sem) ** MM.shortForm (shortAns (socket x1)) (x1.sem);

light_off_Q = light_off_Q ** MM.sem (Sem.light_off_Q);
light_off_P x1 = light_off_P x1 ** MM.sem (Sem.light_off_P x1.sem) ** MM.shortForm (shortAns (socket x1)) (x1.sem);


light_status_off = light_status_off ** MM.sem (Sem.light_status_off) ** MM.longForm;
light_status_on = light_status_on ** MM.sem (Sem.light_status_on) ** MM.longForm;


----------------------------------------------------------------------
-- specific predicates

room_turn_on_Q = room_turn_on_Q ** MM.sem (Sem.room_turn_on_Q);
room_turn_on_P x1 = room_turn_on_P x1 ** MM.sem (Sem.room_turn_on_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_turn_on_Q = lamp_turn_on_Q ** MM.sem (Sem.lamp_turn_on_Q);
lamp_turn_on_P x1 = lamp_turn_on_P x1 ** MM.sem (Sem.lamp_turn_on_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_turn_off_Q = room_turn_off_Q ** MM.sem (Sem.room_turn_off_Q);
room_turn_off_P x1 = room_turn_off_P x1 ** MM.sem (Sem.room_turn_off_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_turn_off_Q = lamp_turn_off_Q ** MM.sem (Sem.lamp_turn_off_Q);
lamp_turn_off_P x1 = lamp_turn_off_P x1 ** MM.sem (Sem.lamp_turn_off_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_dim_Q = room_dim_Q ** MM.sem (Sem.room_dim_Q);
room_dim_P x1 = room_dim_P x1 ** MM.sem (Sem.room_dim_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_dim_Q = lamp_dim_Q ** MM.sem (Sem.lamp_dim_Q);
lamp_dim_P x1 = lamp_dim_P x1 ** MM.sem (Sem.lamp_dim_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_undim_Q = room_undim_Q ** MM.sem (Sem.room_undim_Q);
room_undim_P x1 = room_undim_P x1 ** MM.sem (Sem.room_undim_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_undim_Q = lamp_undim_Q ** MM.sem (Sem.lamp_undim_Q);
lamp_undim_P x1 = lamp_undim_P x1 ** MM.sem (Sem.lamp_undim_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_light_on_Q = room_light_on_Q ** MM.sem (Sem.room_light_on_Q);
room_light_on_P x1 = room_light_on_P x1 ** MM.sem (Sem.room_light_on_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_light_on_Q = lamp_light_on_Q ** MM.sem (Sem.lamp_light_on_Q);
lamp_light_on_P x1 = lamp_light_on_P x1 ** MM.sem (Sem.lamp_light_on_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_light_off_Q = room_light_off_Q ** MM.sem (Sem.room_light_off_Q);
room_light_off_P x1 = room_light_off_P x1 ** MM.sem (Sem.room_light_off_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_light_off_Q = lamp_light_off_Q ** MM.sem (Sem.lamp_light_off_Q);
lamp_light_off_P x1 = lamp_light_off_P x1 ** MM.sem (Sem.lamp_light_off_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_light_status_on_Q = room_light_status_on_Q ** MM.sem (Sem.room_light_status_on_Q);
room_light_status_on_P x1 = room_light_status_on_P x1 ** MM.sem (Sem.room_light_status_on_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_light_status_on_Q = lamp_light_status_on_Q ** MM.sem (Sem.lamp_light_status_on_Q);
lamp_light_status_on_P x1 = lamp_light_status_on_P x1 ** MM.sem (Sem.lamp_light_status_on_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);

room_light_status_off_Q = room_light_status_off_Q ** MM.sem (Sem.room_light_status_off_Q);
room_light_status_off_P x1 = room_light_status_off_P x1 ** MM.sem (Sem.room_light_status_off_P x1.sem) ** MM.shortForm (shortAns (room x1)) (x1.sem);

lamp_light_status_off_Q = lamp_light_status_off_Q ** MM.sem (Sem.lamp_light_status_off_Q);
lamp_light_status_off_P x1 = lamp_light_status_off_P x1 ** MM.sem (Sem.lamp_light_status_off_P x1.sem) ** MM.shortForm (shortAns (lamp x1)) (x1.sem);


----------------------------------------------------------------------
-- Reason

notexist_no_device = notexist_no_device ** MM.sem (Sem.notexist_no_device);
notexist_no_dim_device = notexist_no_dim_device ** MM.sem (Sem.notexist_no_dim_device);

already_dimmed = already_dimmed ** MM.sem (Sem.already_dimmed);
already_undimmed = already_undimmed ** MM.sem (Sem.already_undimmed);

all_lights_off = all_lights_off ** MM.sem (Sem.all_lights_off);
all_lights_on = all_lights_on ** MM.sem (Sem.all_lights_on);

no_lights_on = no_lights_on ** MM.sem (Sem.no_lights_on);
no_lights_off = no_lights_off ** MM.sem (Sem.no_lights_off);
no_device = no_device ** MM.sem (Sem.no_device);

}
