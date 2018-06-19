--# -path=.:../Common:prelude:alltenses

concrete DeluxLexiconEng of DeluxLexicon = CatEng ** 
    open Prelude, ParadigmsEng, ParamX, (Lex=LexiconEng), (Irr=IrregEng), GodisLangEng in {

lin

-- Adjectives
such_A = compoundADeg (regA "such");

-- Adverbs
on_Adv   = mkAdv "on";
off_Adv  = mkAdv "off";

already_AdV = Lex.already_Adv;

-- Nouns
device_N = regN "device";
dimmer_N = regN "dimmer";
lamp_N   = regN "lamp";
light_N  = regN "light";
room_N   = regN "room";

-- Verbs-1
mean_V     = Irr.mean_V;
restart_V  = regV "restart";
dim_V      = regDuplV "dim";
undim_V    = partV Lex.turn_V "up";
turn_on_V  = partV Lex.turn_V "on";
turn_off_V = partV Lex.turn_V "off";

-- Verbs-2
attach_V2   = dirV2 (regV "attach");
mean_V2     = dirV2 Irr.mean_V;
dim_V2      = dirV2 (regDuplV "dim");
undim_V2    = dirV2 (partV Lex.turn_V "up");
turn_on_V2  = dirV2 (partV Lex.turn_V "on");
turn_off_V2 = dirV2 (partV Lex.turn_V "off");

}
