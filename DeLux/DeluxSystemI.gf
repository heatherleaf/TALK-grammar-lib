
incomplete concrete DeluxSystemI of DeluxSystem = 
    open Grammar, GodisLang, DeluxLexicon in {

lin

-----------------------------------------------------------------------
-- Actions

top             = isDoing ** UseV restart_V;

-- help             = isDoing ** ComplV2 get_V2 (DetCN (DetSg MassDet NoOrd) (UseN help_N));

-- "turn off the light"
turn_off_light	= hasDone ** V2_the_N turn_off_V2 light_N;

-- "turn on the light"
turn_on_light	= hasDone ** V2_the_N turn_on_V2 light_N;

-- "dim the light"
dim_light	= hasDone ** V2_the_N dim_V2 light_N;

-- "dim the light"
undim_light	= hasDone ** V2_the_N undim_V2 light_N;


---------------------------------------------------------------------------
-- Short Answers

-- "In which room"
-- room_Q        = 
-- "The livingroom" x
room x = the_N_sg x;

-- "Which lamp"
-- lamp_Q        =
-- "The ceiling lamp/light" x
lamp x = the_N_sg x;


socket x = the_CN_sg x;

-------------------------------------------------------------------------------
-- Predicates and Questions 
-- Mikael 060621

-- "Which lights are on"
light_on_Q    = isDoing ** which_N_are_Adv light_N on_Adv;
-- "The ceiling lamp/socket is on" x
light_on_P  x = isDoing ** NP_Cl (the_CN_sg x);
-- alternativt:            NP_is_Adv x on_Adv

-- "Which lights are off"
light_off_Q   = isDoing ** which_N_are_Adv light_N off_Adv;
-- "The ceiling lamp/socket is off" x
light_off_P x = isDoing ** NP_Cl (the_CN_sg x);

light_status_on  = isDoing ** NP_is_Adv (the_N_sg light_N) on_Adv;
light_status_off = isDoing ** NP_is_Adv (the_N_sg light_N) off_Adv;


-- action/issue specific predicates

room_turn_on_Q = in_which_room room_N;
room_turn_on_P = in_room_X;

room_turn_off_Q = in_which_room room_N;
room_turn_off_P = in_room_X;

room_dim_Q = in_which_room room_N;
room_dim_P = in_room_X;

room_undim_Q = in_which_room room_N;
room_undim_P = in_room_X;

room_light_on_Q = in_which_room room_N;
room_light_on_P = in_room_X;

room_light_off_Q = in_which_room room_N;
room_light_off_P = in_room_X;

room_light_status_on_Q = in_which_room room_N;
room_light_status_on_P = in_room_X;

room_light_status_off_Q = in_which_room room_N;
room_light_status_off_P = in_room_X;

lamp_turn_on_Q = which_lamp lamp_N;
lamp_turn_on_P = lamp_X;

lamp_turn_off_Q = which_lamp lamp_N;
lamp_turn_off_P = lamp_X;

lamp_dim_Q = which_lamp lamp_N;
lamp_dim_P = lamp_X;

lamp_undim_Q = which_lamp lamp_N;
lamp_undim_P = lamp_X;

lamp_light_on_Q = which_lamp lamp_N;
lamp_light_on_P = lamp_X;

lamp_light_off_Q = which_lamp lamp_N;
lamp_light_off_P = lamp_X;

lamp_light_status_on_Q = which_lamp lamp_N;
lamp_light_status_on_P = lamp_X;

lamp_light_status_off_Q = which_lamp lamp_N;
lamp_light_status_off_P = lamp_X;

oper

in_which_room : N -> (QCl ** ClauseForm) = \x -> 
    isDoing ** QuestIAdv (PrepIP in_Prep (which_N_sg room_N)) (PredVP you_NP (UseV mean_V));

in_room_X : N -> (Cl ** ClauseForm) = \room -> 
    isDoing ** PredVP you_NP (AdvVP (UseV mean_V) (PrepNP in_Prep (the_N_sg room)));

which_lamp : N -> (QCl ** ClauseForm) = \x ->
    isDoing ** QuestSlash (which_N_sg lamp_N) (SlashV2 you_NP mean_V2);

lamp_X : N -> (Cl ** ClauseForm) = \lamp ->
    isDoing ** PredVP you_NP (ComplV2 mean_V2 (the_N_sg lamp));


-----------------------------------------------------------------------
-- Reason

lin

-- "There is no such device in the room"
notexist_no_device = no_such_lamp_in_the_room;

notexist_no_dim_device = 
    useCl (isDoing ** PredVP (no_N_sg dimmer_N) 
	       (AdvVP (PassV2 attach_V2) (Prep_NP to_Prep (the_N_sg lamp_N))));


-- "the light is already dimmed"
already_dimmed   = NP_is_already_V2 (the_N_sg light_N) dim_V2;
already_undimmed = NP_is_already_V2 (the_N_sg light_N) undim_V2;

-- "The lights are already off"
all_lights_off = NP_are_onoff (the_N_pl light_N) off_Adv;
all_lights_on  = NP_are_onoff (the_N_pl light_N) on_Adv;

-- notexist propositions
no_lights_off = NP_are_onoff (no_N_pl light_N) off_Adv;
no_lights_on  = NP_are_onoff (no_N_pl light_N) on_Adv;

no_device  = no_such_lamp_in_the_room;


oper 

no_such_lamp_in_the_room = 
    useCl (isDoing ** ExistNP (NP_Prep_NP in_Prep
				   (no_A_posit_N_sg such_A lamp_N) 
				   (the_N_sg room_N)));

NP_is_already_V2 : NP -> V2 -> S = \np, v ->
    useCl (isDoing ** PredVP np (AdVVP already_AdV (PassV2 v)));

NP_are_onoff : NP -> Adv -> S = \np, adv ->
    useCl (isDoing ** NP_is_Adv np adv);

}
