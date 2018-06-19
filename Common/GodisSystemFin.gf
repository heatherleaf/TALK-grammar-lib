--# -path=.:prelude:present

concrete GodisSystemFin of GodisSystem = GodisCatFin ** 
    open Prelude, LangFin, ExtraFin, (P=ParadigmsFin),
         GodisResource, GodisLexiconFin, ConstructX, ParamX in {

lin

----------------------------------------------------------------------
-- questions

action_Q = isDoing **
    QuestSlash whatPart_IP 
    (AdvSlash (SlashVVV2 (UsePron i_implicPron) can_VV do_V2)
	 (PrepNP (P.casePrep P.allative) you_NP));
    
issue_Q = isDoing ** 
    QuestCl (PredVP you_NP (ComplV2 (P.caseV2 want_VV P.partitive)
				(DetCN (DetSg MassDet NoOrd) (UseN (P.regN "tieto")))));

ynq             p    = clauseForm p ** QuestCl p;
altq              qs = qs; 
BaseProposition p q  = clauseForm p ** disjunct_QCl "vai" (QuestCl p) (QuestCl q);
ConsProposition p qs = clauseForm p ** disjunct_QCl "," (QuestCl p) qs;

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
vp_altq qs = isDoing ** QuestCl (PredVP you_NP (ComplVPIVV want_VV (ConjVPI vai_Conj qs))); 
BaseVPProposition p q  = BaseVPI (MkVPI p) (MkVPI q);
ConsVPProposition p qs = ConsVPI (MkVPI p) qs;

----------------------------------------------------------------------
-- short answers

notS     a = PredetNP not_Predet a;

----------------------------------------------------------------------
-- dialogue moves

answer_yes = fullStop ** strUtt ["Kyllä"];
answer_no  = fullStop ** strUtt ["Ei"];

greet      = fullStop ** strUtt ["Näkemiin"];
quit       = fullStop ** strUtt ["Valmis"];
shortAns a = fullStop ** UttNP a;
request  a = fullStop ** UttImpPol PPos (ImpVP a);

ask      q = questMark ** UttQS (useQCl q);
askYNQ   q = questMark ** UttQS (useQCl q);
askAltQ  q = questMark ** UttQS (useQCl q);

answer   p = fullStop ** UttS (useCl p);
answerVP p = fullStop ** UttVP p; 

confirm  a = fullStop ** UttS (useCl (clauseForm a ** PredVP i_NP (VPing a)));

reportFailure a r = fullStop ** 
    UttS (UseCl TPres {-TPast-} ASimul PPos
	      (PredVP i_NP 
		   (AdvVP (ComplVV fail_VV a) (SubjS because_Subj r))));

answerFailure q r = fullStop ** UttS r;

----------------------------------------------------------------------
-- ICM

icm_acc_pos       = fullStop  ** strUtt ["Okei"];
icm_con_neg       = questMark ** strUtt ["No"];
icm_per_neg       = fullStop  ** strUtt ["Mitä te sanotte"]; 

icm_per_int       = questMark ** strUtt ["Mitä sanoitte"];
icm_sem_neg       = fullStop  ** strUtt ["Anteeksi, en ymmärrä"];
icm_sem_int       = questMark ** strUtt ["Mitä tarkoitat"];
icm_und_neg       = fullStop  ** strUtt ["Anteeksi, en ymmärrä"];

icm_reraise       = fullStop ** strUtt ["No niin ,"];
icm_loadplan      = fullStop ** strUtt ["Katsotaan"];
icm_accommodate   = fullStop ** strUtt ["Selvä"];

icm_per_pos            x = fullStop  ** strUtt (["luulin että sanoitte että"] ++ x.s);
icm_und_int_prop       p = questMark ** postfixUtt (UttS (useCl p)) [", pitääkö paikkansa"];
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** 
    -- cncUtt (UttS (useCl p)) not_valid_Post;
    UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
        (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
            (SentCN (UseN (P.regN "vaihtoehto")) (EmbedS (UseCl TPres ASimul PPos p))))))));
icm_acc_neg_que        q = fullStop  ** 
    prefixUtt ["Anteeksi, en tiedä mitään aiheesta"] (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;

icm_und_pos_vp         p = fullStop  ** 
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_vp         p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))))
    [", pitääkö paikkansa"];

icm_und_pos_negvp      p = fullStop  ** 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_negvp      p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))))
    [", pitääkö paikkansa"];

icm_reraise_act        a = fullStop  ** prefixUtt ["Takaisin kohtaan"] (UttVP a);
icm_accommodate_act    a = fullStop  ** strUtt ["Selvä"];
icm_reaccommodate_act  a = fullStop  ** prefixUtt ["Takaisin kohtaan"] (UttVP a); 

icm_und_int_altq       q = questMark ** requestion q [];
icm_reraise_whq        q = fullStop  ** requestion q ["Takaisin kohtaan"];
icm_reraise_ynq        q = fullStop  ** requestion q ["Takaisin kohtaan"];
icm_reraise_altq       q = fullStop  ** requestion q ["Takaisin kohtaan"];
icm_accommodate_whq    q = fullStop  ** strUtt ["Selvä"];
icm_accommodate_ynq    q = fullStop  ** strUtt ["Selvä"];
icm_accommodate_altq   q = fullStop  ** strUtt ["Selvä"];
icm_reaccommodate_whq  q = questMark ** requestion q ["Takaisin aiheeseen"];
icm_reaccommodate_ynq  q = questMark ** requestion q ["Takaisin aiheeseen"];
icm_reaccommodate_altq q = questMark ** requestion q ["Takaisin aiheeseen"];

oper requestion : (QCl ** ClauseForm) -> Str -> Utt 
	 = \q,s -> prefixUtt s (UttAdv (AdvSC (EmbedQS (useQCl q))));

----------------------------------------------------------------------
-- lists of moves, utterances

lin

BaseMove m = consText m (phrUtt m) TEmpty;
ConsMove m = consText m (phrUtt m);

BaseICM  m = consText m (phrUtt m) TEmpty;
ConsICM  m = consText m (phrUtt m);

godis_utterance x = x;

----------------------------------------------------------------------
-- local operations

oper

know_VQ : VQ = P.mkVQ (P.reg2V "tietää" "tiesi");
fail_VV : VV = P.mkVV (P.regV "epäonnistua");

not_Predet : Predet;
not_Predet = {s = \\n,c => "ei"; lock_Predet = <>} ; ----

disjunct_QCl : Str -> QCl -> QCl -> QCl;
disjunct_QCl disj q q' = 
    {s = \\t,a,p => q.s!t!a!p ++ disj ++ q'.s!t!a!p;
     lock_QCl = <>};

useQCl : (QCl ** ClauseForm) -> QS;
useQCl q = UseQCl TPres (anter q) PPos q;

useCl : (Cl ** ClauseForm) -> S;
useCl c = UseCl TPres (anter c) PPos c;

anter : ClauseForm -> Ant;
anter c = case c.clform of {_ => ASimul};
-- anter c = case c.clform of {HasDone => AAnter; IsDoing => ASimul};

negate_Cl : Cl -> Cl;
negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {Neg=>Pos; Pos=>Neg})!o;
     lock_Cl = <>};

phrUtt : Utt -> Phr;
phrUtt utt = PhrUtt NoPConj utt NoVoc;

VPing : (VP ** ClauseForm) -> VP;
VPing vp = case vp.clform of {
  HasDone => vp; 
  IsDoing => ProgrVP vp
  };


}
