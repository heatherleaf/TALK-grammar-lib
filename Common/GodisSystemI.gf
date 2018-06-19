
-- this is deprecated, old, dismissed

{-
incomplete concrete GodisSystemI of GodisSystem = 
    open Prelude, Grammar, Extra, GodisLang, ConstructX, ParamX in {

lin

----------------------------------------------------------------------
-- questions

action_Q  = isDoing **
    QuestSlash whatSg_IP (AdvSlash (SlashVVV2 i_NP can_VV do_V2)
			      (PrepNP for_Prep you_NP));
issue_Q   = isDoing ** 
    QuestCl (PredVP you_NP (ComplVV want_VV
	(ComplV2 have_V2 (DetCN (DetSg MassDet NoOrd) (UseN information_N))))) ;

ynq             p    = clauseForm p ** QuestCl p;
altq              qs = qs; 
BaseProposition p q  = clauseForm p ** disjunct_QCl (QuestCl p) (QuestCl q);
ConsProposition p qs = clauseForm p ** disjunct_QCl (QuestCl p) qs;

----------------------------------------------------------------------
-- propositions

not    p = p ** negate_Cl p;
-- done   a = clauseForm a ** PredVP i_NP (VPing a);

-- {-
-- not reachable; slow to compile
fail q r = isDoing ** -- hasDone ** 
    negate_Cl (PredVP i_NP 
		   (AdvVP (ComplVQ know_VQ (UseQCl TPres (anter q) PPos q)) 
			(SubjS because_Subj r)));
-- -}
----------------------------------------------------------------------
-- vp-propositions

action   a = a;

-- {- can be slow to compile...
issue    q = ComplVQ know_VQ (useQCl q);
-- -}

vp_ynq  p  = isDoing ** QuestCl (PredVP you_NP (ComplVV want_VV p));
vp_altq qs = isDoing ** QuestCl (PredVP you_NP (ComplVPIVV want_VV (ConjVPI or_Conj qs))); 
BaseVPProposition p q  = BaseVPI (MkVPI p) (MkVPI q);
ConsVPProposition p qs = ConsVPI (MkVPI p) qs;

----------------------------------------------------------------------
-- short answers

notS     a = PredetNP not_Predet a;

----------------------------------------------------------------------
-- dialogue moves

answer_yes = fullStop ** yes;
answer_no  = fullStop ** no;

greet      = fullStop ** hello;
quit       = fullStop ** goodbye;
shortAns a = fullStop ** UttNP a;
request  a = fullStop ** UttImpSg PPos (ImpVP a);

ask      q = questMark ** UttQS (useQCl q);
askYNQ   q = questMark ** UttQS (useQCl q);
askAltQ  q = questMark ** UttQS (useQCl q);

answer   p = fullStop ** UttS (useCl p);
answerVP p = fullStop ** vp2Utt p; 

confirm  a = fullStop ** UttS (useCl (clauseForm a ** PredVP i_NP (VPing a)));

reportFailure a r = fullStop ** 
    UttS (UseCl TPres {-TPast-} ASimul PPos
	      (PredVP i_NP 
		   (AdvVP (ComplVV fail_VV a) (SubjS because_Subj r))));

answerFailure q r = fullStop ** UttS r;

----------------------------------------------------------------------
-- ICM

icm_acc_pos       = fullStop ** icm_acc_pos;
icm_con_neg       = fullStop ** icm_con_neg;
icm_per_neg       = fullStop ** 
    UttQS (UseQCl TPres {-TPast-} ASimul PPos (QuestSlash whatSg_IP 
					 (SlashV2 you_NP (UseVS say_VS))));
icm_per_int       = questMark ** what_did_you_say;
icm_sem_neg       = fullStop ** i_dont_understand;
icm_sem_int       = questMark ** what_do_you_mean;
icm_und_neg       = fullStop ** i_dont_understand;

icm_reraise       = fullStop ** icm_reraise;
icm_loadplan      = fullStop ** icm_loadplan;
icm_accommodate   = fullStop ** icm_accommodate;

icm_per_pos            x = fullStop  ** icm_per_pos x;
icm_und_int_prop       p = questMark ** cncUtt (UttS (useCl p)) is_that_correct_Post;
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** 
    -- cncUtt (UttS (useCl p)) not_valid_Post;
    UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
        (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
            (SentCN (UseN option_N) (EmbedS (UseCl TPres ASimul PPos p))))))));
icm_acc_neg_que        q = fullStop  ** 
    cncUtt cant_answer_que_Pre (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;
icm_und_pos_vp         p = fullStop  ** (UttS (useCl (you_want_to_VP p ** isDoing)));
icm_und_int_vp         p = questMark ** cncUtt (UttS (useCl (you_want_to_VP p ** isDoing))) is_that_correct_Post;
icm_und_pos_negvp      p = fullStop  ** (UttS (useCl (you_dont_want_to_VP p ** isDoing)));
icm_und_int_negvp      p = questMark ** cncUtt (UttS (useCl (you_dont_want_to_VP p ** isDoing))) is_that_correct_Post;

icm_reraise_act        a = fullStop  ** cncUtt returning_to_act_Pre (vp2Utt a); -- (VPing a));
icm_accommodate_act    a = fullStop  ** icm_accommodate;
icm_reaccommodate_act  a = fullStop  ** cncUtt returning_to_act_Pre (vp2Utt a); 

icm_und_int_altq       q = questMark ** UttAdv (AdvSC (EmbedQS (useQCl q)));
icm_reraise_whq        q = fullStop  ** requestion q returning_to_Pre;
icm_reraise_ynq        q = fullStop  ** requestion q returning_to_Pre;
icm_reraise_altq       q = fullStop  ** requestion q returning_to_issue_Pre;
icm_accommodate_whq    q = fullStop  ** icm_accommodate;
icm_accommodate_ynq    q = fullStop  ** icm_accommodate;
icm_accommodate_altq   q = fullStop  ** icm_accommodate;
icm_reaccommodate_whq  q = questMark ** requestion q returning_to_issue_Pre;
icm_reaccommodate_ynq  q = questMark ** requestion q returning_to_issue_Pre;
icm_reaccommodate_altq q = questMark ** requestion q returning_to_issue_Pre;

oper requestion : (QCl ** ClauseForm) -> Utt -> Utt 
	 = \q,s -> cncUtt s (UttAdv (AdvSC (EmbedQS (useQCl q))));

----------------------------------------------------------------------
-- lists of moves, utterances

lin

BaseMove m = consText m m TEmpty;
ConsMove m = consText m m;

BaseICM  m = consText m m TEmpty;
ConsICM  m = consText m m;

godis_utterance x = x;

}
-}
