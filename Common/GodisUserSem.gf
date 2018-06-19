--# -path=.:prelude

concrete GodisUserSem of GodisUser = 
    open Prolog, GodisApp, GodisSystemSem in {

lincat 

S         = PStr;

Question,
Answer,
ShortAns,
Action    = PStr ** App;

-- ActionOrAnswer = PStr ** App;

lin

greet_S = pList1 (applyApp (anyApp ** pm1 greet));
quit_S  = pList1 (applyApp (anyApp ** pm1 quit));

icm_acc_pos = pList1 (applyApp (anyApp ** pm1 icm_acc_pos));
icm_per_neg = pList1 (applyApp (anyApp ** pm1 icm_per_neg));

no_S    = anyApp ** pm1 answer_no;
yes_S   = anyApp ** pm1 answer_yes;

answer_S   x = pList1 (applyApp x);
ask_S      x = pList1 (applyApp x);
shortans_S x = pList1 (applyApp x);
request_S  x = pList1 (applyApp x);

-- not_prop_S = \x -> pList1 (applyApp (app x.app ** pp1 "not" x));
-- not_shortans_S x = pList1 (applyApp (app x.app ** pp1 "not" x));

-- request_request_S x y = pList2 (applyApp x) (applyApp y);

-- action_AOA aoa = aoa;
-- answer_AOA aoa = aoa;

}
