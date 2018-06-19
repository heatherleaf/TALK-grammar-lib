
abstract GodisUser = {

cat 

S;
Question;
Action;
Answer;
ShortAns;

-- ActionOrAnswer;
-- Proposition;


fun

greet_S,
quit_S     : S;

icm_acc_pos,
icm_per_neg : S;

no_S,
yes_S      : Answer;

-- click_answer_action : Action -> Answer;
-- click_answer_issue  : Question -> Answer;

request_S      : Action -> S;
answer_S       : Answer -> S;
ask_S          : Question -> S;
shortans_S     : ShortAns -> S; 

-- not_shortans_S : ShortAns -> S; 
-- not_prop_S     : Proposition -> S;

-- request_request_S : Action -> Action -> S;

-- action_AOA : ActionOrAnswer -> Action;
-- answer_AOA : ActionOrAnswer -> Answer;

}
