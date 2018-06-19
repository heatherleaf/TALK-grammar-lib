
incomplete concrete GodisSystemMMI of GodisSystem = 
    open Prelude, Prolog, GodisMM, GodisSystem, (P=GodisSystemSem) in {

lincat

S,
[Move],
Move,
ICM             = PStr;

ShortAns        = Semantics ** ShortAns;

Proposition     = Semantics ** Proposition ** ShortForm;
[Proposition]   = SystemMM  ** [Proposition];
Question        = Semantics ** Question;
YNQ             = SystemMM  ** YNQ;
AltQ            = SystemMM  ** AltQ;

VPProposition   = Semantics ** VPProposition;
[VPProposition] = SystemMM  ** [VPProposition];

Action          = Semantics ** Action;
Reason          = Semantics ** Reason;

lin

----------------------------------------------------------------------
-- questions

action_Q = action_Q ** sem P.action_Q;
issue_Q  = issue_Q  ** sem P.issue_Q;

ynq p = ynq p ** mm (pList2 (button answer_yes (P.answer p.sem))
			 (button answer_no (P.answer (P.not p.sem))));

altq qs = altq qs ** mm (pBrackets qs.mm);
BaseProposition p q  = BaseProposition p q ** 
    mm (pSeq (button (answer p) (P.answer p.sem)) (button (answer q) (P.answer q.sem)));
ConsProposition p qs = ConsProposition p qs ** 
    mm (pSeq (button (answer p) (P.answer p.sem)) qs.mm);

----------------------------------------------------------------------
-- propositions

not      p = longForm ** not    p ** sem (P.not p.sem);
-- done     a = longForm ** done   a ** sem (P.done a.sem);
fail   q r = longForm ** fail q r ** sem (P.fail q.sem r.sem);

----------------------------------------------------------------------
-- vp-propositions

issue    q = longForm ** issue  q ** sem (P.issue q.sem);
action   a = longForm ** action a ** sem (P.action a.sem);

vp_ynq  p  = vp_ynq p ** mm (pList2 (button answer_yes (P.answer p.sem))
				 (button answer_no (P.answer (P.not p.sem))));
vp_altq qs = vp_altq qs ** mm (pBrackets qs.mm);
BaseVPProposition p q  = BaseVPProposition p q ** 
    mm (pSeq (button (answerVP p) (P.answer p.sem)) (button (answerVP q) (P.answer q.sem)));
ConsVPProposition p qs = ConsVPProposition p qs ** 
    mm (pSeq (button (answerVP p) (P.answer p.sem)) qs.mm);

----------------------------------------------------------------------
-- short answers

notS     a = notS   a ** sem (P.notS a.sem);

----------------------------------------------------------------------
-- dialogue moves

answer_yes = label answer_yes;
answer_no  = label answer_no;

greet      = label greet;
quit       = label quit;
shortAns a = button (shortAns a) (P.shortAns a.sem);
request a  = label (BaseMove (request a));

ask      q = textentrybox (BaseMove (ask q));
askYNQ   q = menu_with_title (BaseMove (askYNQ q)) q.mm;
askAltQ  q = menu q.mm;

answer   p = if_then_else PStr p.short 
    (button p.shortForm (P.shortAns p.shortSem))
    (button (answer p) (P.answer p.sem));
answerVP p = label (BaseMove (answerVP p));

confirm  a = label (BaseMove (confirm a));

reportFailure a r = label (BaseMove (reportFailure a r));

answerFailure q r = label (BaseMove (answerFailure q r));

----------------------------------------------------------------------
-- ICM

icm_acc_pos       = label (BaseICM icm_acc_pos);
icm_con_neg       = label (BaseICM icm_con_neg);
icm_per_neg       = label (BaseICM icm_per_neg);
icm_per_int       = label (BaseICM icm_per_int);
icm_sem_neg       = label (BaseICM icm_sem_neg);
icm_sem_int       = label (BaseICM icm_sem_int);
icm_und_neg       = label (BaseICM icm_und_neg);
icm_reraise       = label (BaseICM icm_reraise);
icm_loadplan      = label (BaseICM icm_loadplan);
icm_accommodate   = label (BaseICM icm_accommodate);

icm_per_pos            x = label (BaseICM (icm_per_pos x));
icm_und_int_prop       p = yes_no_menu (BaseICM (icm_und_int_prop p)) p.sem;

icm_und_pos_prop       p = label (BaseICM (icm_und_pos_prop p));
icm_acc_neg_prop       p = label (BaseICM (icm_acc_neg_prop p));
icm_acc_neg_que        q = label (BaseICM (icm_acc_neg_que q));
icm_sem_pos_move       m = m;
icm_sem_pos_shortAns   a = label (BaseICM (icm_sem_pos_shortAns a));

icm_reraise_act        a = label (BaseICM (icm_reraise_act a));
icm_accommodate_act    a = label (BaseICM (icm_accommodate_act a));
icm_reaccommodate_act  a = label (BaseICM (icm_reaccommodate_act a));

icm_und_int_altq       q = label (BaseICM (icm_und_int_altq q));
icm_reraise_whq        q = label (BaseICM (icm_reraise_whq q));
icm_reraise_ynq        q = label (BaseICM (icm_reraise_ynq q));
icm_reraise_altq       q = label (BaseICM (icm_reraise_altq q));
icm_accommodate_whq    q = label (BaseICM (icm_accommodate_whq q));
icm_accommodate_ynq    q = label (BaseICM (icm_accommodate_ynq q));
icm_accommodate_altq   q = label (BaseICM (icm_accommodate_altq q));
icm_reaccommodate_whq  q = label (BaseICM (icm_reaccommodate_whq q));
icm_reaccommodate_ynq  q = label (BaseICM (icm_reaccommodate_ynq q));
icm_reaccommodate_altq q = label (BaseICM (icm_reaccommodate_altq q));

icm_und_pos_vp p = yes_no_menu (BaseICM (icm_und_pos_vp p)) p.sem;
icm_und_int_vp p = yes_no_menu (BaseICM (icm_und_int_vp p)) p.sem;

icm_und_pos_negvp p = yes_no_menu (BaseICM (icm_und_pos_negvp p)) (P.not p.sem);
icm_und_int_negvp p = yes_no_menu (BaseICM (icm_und_int_negvp p)) (P.not p.sem);

oper
yes_no_menu : PStr -> PStr -> PStr = \mov,sem ->
    menu_with_title mov
    (pList2 (button answer_yes (P.answer sem))
	 (button answer_no (P.answer (P.not sem))));

----------------------------------------------------------------------
-- lists of moves, utterances

lin

BaseMove m = m;
ConsMove m = pSeq m;

BaseICM  m = m;
ConsICM  m = pSeq m;

godis_utterance = pBrackets;

}
