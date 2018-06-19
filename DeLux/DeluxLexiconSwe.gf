--# -path=.:../Common:prelude:alltenses

concrete DeluxLexiconSwe of DeluxLexicon = CatSwe ** 
    open Prelude, ParadigmsSwe, ParamX, GodisLangSwe, 
         (Comm=CommonScand), (Lex=LexiconSwe), (Irr=IrregSwe) in {

lin

-- Adjectives
such_A = regA "sådan";

-- Adverbs
on_Adv   = mkAdv "på";
off_Adv  = mkAdv "av";

already_AdV = Lex.already_Adv;

-- Nouns
device_N = regGenN "manick" utrum;
dimmer_N = regGenN "dimmer" utrum;
lamp_N   = regGenN "lampa" utrum;
light_N  = regGenN "ljus" neutrum;
room_N   = regGenN "rum" neutrum;

-- Verbs-1
mean_V    = regV "menar";
restart_V = partV (regV "startar") "om";
dim_V      = regV "dimmar";
undim_V    = regV "höjer";
turn_on_V  = partV (regV "sätter") "på";
turn_off_V = partV (regV "stänger") "av";

-- Verbs-2
attach_V2   = dirV2 (partV Lex.hear_V2 "till");
mean_V2     = dirV2 (regV "menar");
dim_V2      = dirV2 (regV "dimmar");
undim_V2    = dirV2 (regV "höjer");
turn_on_V2  = dirV2 (partV (regV "sätter") "på");
turn_off_V2 = dirV2 (partV (regV "stänger") "av");

}
