
incomplete concrete TramSystemI of TramSystem = 
    open GodisResource, GodisLexicon, Grammar, TramLexicon in {

lincat
Route = NP;
Leg = NP; 
[Leg] = [NP];


lin

-----------------------------------------------------------------------------
-- Route 

lineLeg line from to = AdvNP (AdvNP line (PrepNP from_Prep from)) (PrepNP to_Prep to);

oneLeg  leg  = leg;
mkRoute legs = ConjNP and_then_Conj legs;
BaseLeg = BaseNP;
ConsLeg = ConsNP;

-------------------------------------------------------------------------------
-- Predicates and Questions 

shortest_route_Q = isDoing ** 
    QuestVP which_IP 
    (UseComp (CompNP the_shortest_route)) ;

shortest_route_P x = isDoing ** 
    PredVP you_NP (ComplV2 take_V2 x);

dest_stop_Q = isDoing ** 
    QuestSlash (IDetCN whichSg_IDet NoNum NoOrd (UseN stop_N)) 
    (SlashVVV2 you_NP want_VV go_to_V2);

dest_stop_P x = isDoing ** 
    PredVP you_NP (ComplVV want_VV (ComplV2 go_to_V2 x));

dept_stop_Q = isDoing ** 
    QuestSlash (IDetCN whichSg_IDet NoNum NoOrd (UseN stop_N)) 
    (SlashVVV2 you_NP want_VV go_from_V2);

dept_stop_P x = isDoing ** 
    PredVP you_NP (ComplVV want_VV (ComplV2 go_from_V2 x));


---------------------------------------------------------------------------
-- Short Answers

stop x = x;

-----------------------------------------------------------------------
-- Actions

top  = isDoing ** restart_VP;
help = isDoing ** 
    ComplV2 get_V2 (DetCN (DetSg MassDet NoOrd) (UseN help_N));

}
