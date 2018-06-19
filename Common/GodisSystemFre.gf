--# -path=.:prelude:present

concrete GodisSystemFre of GodisSystem = GodisCatFre ** 
    open Prelude, LangFre, ExtraFre, (P=ParadigmsFre), 
         GodisResource, GodisLexiconFre, ConstructX, ParamX, (I=IrregFre) in {

lin

----------------------------------------------------------------------
-- questions

action_Q  = isDoing **
    QuestSlash whatSg_IP (AdvSlash (SlashVVV2 i_NP can_VV do_V2)
			      (PrepNP for_Prep you_NP));

issue_Q   = isDoing ** 
    QuestCl (PredVP you_NP (ComplVV want_VV
	(ComplV2 have_V2 (DetCN (DetSg MassDet NoOrd) (UseN (P.regN "information")))))) ;

ynq  p  = clauseForm p ** QuestCl p;
altq qs = qs; 

BaseProposition p q  = clauseForm p ** disjunct_QCl (QuestCl p) (QuestCl q);
ConsProposition p qs = clauseForm p ** disjunct_QCl (QuestCl p) qs;

----------------------------------------------------------------------
-- propositions

not    p = p ** negate_Cl p;
fail q r = isDoing ** -- hasDone ** 
    negate_Cl (PredVP i_NP 
		   (AdvVP (ComplVQ know_VQ (useQCl q)) 
			(SubjS because_Subj r)));

----------------------------------------------------------------------
-- vp-propositions

action   a = a;
issue    q = ComplVQ know_VQ (useQCl q);

vp_ynq  p  = isDoing ** QuestCl (PredVP you_NP (ComplVV want_VV p));
vp_altq qs = isDoing ** QuestCl (PredVP you_NP (ComplVPIVV want_VV (ConjVPI or_Conj qs))); 

BaseVPProposition p q  = BaseVPI (MkVPI p) (MkVPI q);
ConsVPProposition p qs = ConsVPI (MkVPI p) qs;

----------------------------------------------------------------------
-- short answers

notS     a = PredetNP not_Predet a;

----------------------------------------------------------------------
-- dialogue moves

answer_yes = fullStop ** strUtt "Oui";
answer_no  = fullStop ** strUtt "Non";

greet      = fullStop ** strUtt ["Complet"];
quit       = fullStop ** strUtt ["Au revoir"];
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

icm_acc_pos       = fullStop  ** strUtt ["D'accord"];
icm_con_neg       = fullStop  ** strUtt ["All�"];
icm_per_neg       = fullStop  ** strUtt ["Comment"];
icm_per_int       = questMark ** strUtt ["Comment"];
icm_sem_neg       = fullStop  ** strUtt ["Pardon , je ne comprends pas"];
icm_sem_int       = questMark ** strUtt ["Qu'est-ce que vous voulez dire"];
icm_und_neg       = fullStop  ** strUtt ["Pardon , je ne comprends pas"];

icm_reraise       = fullStop ** strUtt ["Donc ,"];
icm_loadplan      = fullStop ** strUtt ["Voyons"];
icm_accommodate   = fullStop ** strUtt ["Compris"];

icm_per_pos            x = fullStop  ** strUtt (["Je vous ai cru dire"] ++ x.s);
icm_und_int_prop       p = questMark ** postfixUtt (UttS (useCl p)) [", c'est correcte"];
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** 
    postfixUtt (UttS (useCl p)) [", ce n'est pas une alternative valide"];
--     UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
--         (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
--             (SentCN (UseN option_N) (EmbedS (UseCl TPres ASimul PPos p))))))));

icm_acc_neg_que        q = fullStop  ** prefixUtt
    ["Pardon , je ne sais rien du sujet"]
    (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;

icm_und_pos_vp         p = fullStop  ** 
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_vp         p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p)))) 
    [", c'est correcte"];

icm_und_pos_negvp      p = fullStop  ** 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_negvp      p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p)))) 
    [", c'est correcte"];

icm_reraise_act        a = fullStop  ** prefixUtt ["Retour �"] (UttVP a);
icm_accommodate_act    a = fullStop  ** strUtt ["Compris"];
icm_reaccommodate_act  a = fullStop  ** prefixUtt ["Retour �"] (UttVP a); 

icm_und_int_altq       q = questMark ** UttAdv (AdvSC (EmbedQS (useQCl q)));
icm_reraise_whq        q = fullStop  ** requestion q reprendre;
icm_reraise_ynq        q = fullStop  ** requestion q reprendre;
icm_reraise_altq       q = fullStop  ** requestion q reprendre;
icm_accommodate_whq    q = fullStop  ** strUtt ["compris"];
icm_accommodate_ynq    q = fullStop  ** strUtt ["compris"];
icm_accommodate_altq   q = fullStop  ** strUtt ["compris"];
icm_reaccommodate_whq  q = questMark ** requestion q reprendre;
icm_reaccommodate_ynq  q = questMark ** requestion q reprendre;
icm_reaccommodate_altq q = questMark ** requestion q reprendre;

oper requestion : (QCl ** ClauseForm) -> Str -> Utt 
	 = \q,s -> prefixUtt s (UttAdv (AdvSC (EmbedQS (useQCl q))));

 reprendre = ["reprendre la question"] ;
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

not_Predet : Predet = {s = \\_,_ => "non" ; c = P.accusative.c ; lock_Predet = <>};
fail_VV : VV = P.mkVV (P.regV "rater");
know_VQ : VQ = P.mkVQ I.savoir_V2;

disjunct_QCl : QCl -> QCl -> QCl;
disjunct_QCl q q' = 
    {s = \\t,a,p,x => q.s!t!a!p!x ++ "ou" ++ q'.s!t!a!p!x;
     lock_QCl = <>};

useQCl : (QCl ** ClauseForm) -> QS;
useQCl q = UseQCl TPres (anter q) PPos q;

useCl : (Cl ** ClauseForm) -> S;
useCl c = UseCl TPres (anter c) PPos c;

anter : ClauseForm -> Ant;
anter c = case c.clform of {_ => ASimul};
-- anter c = case c.clform of {HasDone => AAnter; IsDoing => ASimul};

VPing : (VP ** ClauseForm) -> VP;
VPing vp = vp;
-- VPing vp = case vp.clform of {
--   HasDone => vp; 
--   IsDoing => ProgrVP vp
--   };

negate_Cl : Cl -> Cl;
negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {
       Neg => Pos; 
       Pos => Neg
       })!o;
     lock_Cl = <>};

phrUtt : Utt -> Phr;
phrUtt utt = PhrUtt NoPConj utt NoVoc;

}
