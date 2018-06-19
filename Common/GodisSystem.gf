--# -path=.:prelude

abstract GodisSystem = GodisCat ** {

fun

-- usr, sys : Participant;

----------------------------------------------------------------------
-- forming Questions

action_Q,
issue_Q     : Question;

ynq         : Proposition -> YNQ;
altq        : [Proposition] -> AltQ;
BaseProposition : Proposition -> Proposition -> [Proposition];
ConsProposition : Proposition -> [Proposition] -> [Proposition];

----------------------------------------------------------------------
-- forming Propositions

not         : Proposition -> Proposition;
-- done        : Action -> Proposition;
fail        : Question -> Reason -> Proposition;
-- und      : Participant -> Proposition -> Proposition;

----------------------------------------------------------------------
-- forming VPPropositions, and associated questions

action      : Action -> VPProposition;
issue       : Question -> VPProposition;

vp_ynq      : VPProposition -> YNQ;
vp_altq     : [VPProposition] -> AltQ;
BaseVPProposition : VPProposition -> VPProposition -> [VPProposition];
ConsVPProposition : VPProposition -> [VPProposition] -> [VPProposition];

----------------------------------------------------------------------
-- short answers

notS        : ShortAns -> ShortAns;


----------------------------------------------------------------------
-- dialogue moves

answer_yes, 
answer_no   : Move;

greet, 
quit        : Move;
ask         : Question -> Move;
askYNQ      : YNQ -> Move;
askAltQ     : AltQ -> Move;
answer      : Proposition -> Move;
answerVP    : VPProposition -> Move;
shortAns    : ShortAns -> Move;

request,
confirm     : Action -> Move;
reportFailure : Action -> Reason -> Move;

answerFailure : Question -> Reason -> Move;

----------------------------------------------------------------------
-- ICM

icm_acc_pos,
icm_con_neg,
icm_per_neg,
icm_per_int,
icm_sem_neg,
icm_sem_int,
icm_und_neg,
icm_reraise,
icm_loadplan,
icm_accommodate       : ICM;

icm_per_pos           : String -> ICM;
icm_und_int_prop,
icm_und_pos_prop,
icm_acc_neg_prop      : Proposition -> ICM;
icm_acc_neg_que       : Question -> ICM;
icm_sem_pos_move      : Move -> ICM;
icm_sem_pos_shortAns  : ShortAns -> ICM;
icm_und_pos_vp,
icm_und_int_vp  : {- Participant -> -} VPProposition -> ICM;
icm_und_pos_negvp,
icm_und_int_negvp  : {- Participant -> -} VPProposition -> ICM;

icm_reraise_act,
icm_accommodate_act,
icm_reaccommodate_act : Action -> ICM;

icm_reraise_whq,
icm_accommodate_whq,
icm_reaccommodate_whq : Question -> ICM;
icm_reraise_ynq,
icm_accommodate_ynq,
icm_reaccommodate_ynq : YNQ -> ICM;
icm_und_int_altq,
icm_reraise_altq,
icm_accommodate_altq,
icm_reaccommodate_altq: AltQ -> ICM;

----------------------------------------------------------------------
-- lists of moves, utterances

BaseMove : Move -> [Move];
ConsMove : Move -> [Move] -> [Move];

BaseICM  : ICM -> [Move];
ConsICM  : ICM -> [Move] -> [Move];

godis_utterance : [Move] -> S;

}
