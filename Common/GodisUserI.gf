
incomplete concrete GodisUserI of GodisUser = 
    open Prelude, GodisLexicon, GodisMM in {

lincat 

S = SS;

Question,
Action,
Answer,
ShortAns = UserMM;

-- DoubleMM ger error i MCFG/FCFG-konverteringen!!
-- ActionOrAnswer = DoubleMM;
-- ActionOrAnswer = UserMM;

-- Proposition = PStr;

lin

greet_S = flattenMM (noClick userGreet);
quit_S  = flattenMM (noClick userQuit);

icm_acc_pos = flattenMM (noClick userOkay);
icm_per_neg = flattenMM (noClick userPardon);

no_S    = noClick userNo;
yes_S   = noClick userYes;

-- click_answer_action p = onlyClick (P.answer
-- click_answer_vp   p

request_S  x = flattenMM x;
answer_S   x = flattenMM x;
ask_S      x = flattenMM x;
shortans_S x = flattenMM x;

-- not_shortans_S x = flattenConcatMM cc2 (noClick (ss not_Str)) x;

-- request_request_S x y = flattenConcatMM coord x y;

oper

coord : SS -> SS -> SS = \x,y -> ss (x.s ++ userCoordinate.s ++ y.s);

}
