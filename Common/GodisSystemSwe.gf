--# -path=.:prelude:present

concrete GodisSystemSwe of GodisSystem = GodisCatSwe ** 
    open Prelude, LangSwe, ExtraSwe, (Irr=IrregSwe), (P=ParadigmsSwe), (M=MorphoSwe), 
         GodisResource, GodisLexiconSwe, ConstructX, ParamX in {

lin

----------------------------------------------------------------------
-- questions

action_Q = isDoing **
    QuestSlash whatSg_IP (AdvSlash (SlashVVV2 i_NP can_VV do_V2)
			      (PrepNP (P.mkPrep "för") you_NP));

issue_Q = isDoing ** 
    QuestCl (PredVP you_NP (ComplVV want_VV
	(ComplV2 have_V2 (DetCN (DetSg MassDet NoOrd) 
			      (UseN (P.mk2N "information" "informationer")))))) ;

ynq  p  = clauseForm p ** QuestCl p;
altq qs = qs; 

BaseProposition p q  = clauseForm p ** disjunct_QCl "eller" (QuestCl p) (QuestCl q);
ConsProposition p qs = clauseForm p ** disjunct_QCl "," (QuestCl p) qs;

----------------------------------------------------------------------
-- propositions

not    p = p ** negate_Cl p;
fail q r = isDoing ** -- hasDone ** 
    negate_Cl (PredVP i_NP (AdvVP (ComplVQ know_VQ (useQCl q)) 
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

answer_yes = fullStop ** strUtt "Ja";
answer_no  = fullStop ** strUtt "Nej";

greet      = fullStop ** strUtt "Hej";
quit       = fullStop ** strUtt ["Hej då"];
shortAns a = fullStop ** UttNP a;
request  a = fullStop ** UttImpSg PPos (ImpVP a);

ask      q = questMark ** UttQS (useQCl q);
askYNQ   q = questMark ** UttQS (useQCl q);
askAltQ  q = questMark ** UttQS (useQCl q);

answer   p = fullStop ** UttS (useCl p);
answerVP p = fullStop ** UttS (useCl (isDoing ** PredVP you_NP (ComplVV want_VV p))); -- vp2Utt p; 

confirm  a = fullStop ** UttS (useCl (clauseForm a ** PredVP i_NP a));

reportFailure a r = fullStop ** 
    UttS (UseCl TPres {-TPast-} ASimul PPos
	      (PredVP i_NP 
		   (AdvVP (ComplVV fail_VV a) (SubjS because_Subj r))));

answerFailure q r = fullStop ** UttS r;

----------------------------------------------------------------------
-- ICM

icm_acc_pos       = fullStop  ** strUtt ["Okej"];
icm_con_neg       = fullStop  ** strUtt ["Hallå"];
icm_per_neg       = fullStop  ** strUtt ["Vad sade du"];
icm_per_int       = questMark ** strUtt ["Vad sade du"];
icm_sem_neg       = fullStop  ** strUtt ["Jag förstår inte riktigt"];
icm_sem_int       = questMark ** strUtt ["Vad menar du"];
icm_und_neg       = fullStop  ** strUtt ["Jag förstår inte riktigt"];

icm_reraise       = fullStop ** strUtt ["Så ,"];
icm_loadplan      = fullStop ** strUtt ["Få se"];
icm_accommodate   = fullStop ** strUtt ["Visst"];

icm_per_pos            x = fullStop  ** strUtt (["Jag tyckte du sa"] ++ x.s);
icm_und_int_prop       p = questMark ** postfixUtt (UttS (useCl p)) [", är det korrekt"];
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** postfixUtt (UttS (useCl p)) [", det går inte att välja"];
--     UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
--         (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
--             (SentCN (UseN option_N) (EmbedS (UseCl TPres ASimul PPos p))))))));

icm_acc_neg_que        q = fullStop  ** prefixUtt
    ["Ledsen , jag kan inte svara på frågor om"]
    (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;

icm_und_pos_vp         p = fullStop  ** 
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_vp         p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p)))) 
    [", är det korrekt"];

icm_und_pos_negvp      p = fullStop  ** 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_negvp      p = questMark ** postfixUtt 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p)))) 
    [", är det korrekt"];

icm_reraise_act        a = fullStop  ** prefixUtt ["Återgår till att"] (vp2Utt a);
icm_accommodate_act    a = fullStop  ** strUtt ["Visst"];
icm_reaccommodate_act  a = fullStop  ** prefixUtt ["Återgår till att"] (vp2Utt a); 

icm_und_int_altq       q = questMark ** requestion q ["Är frågan"];
icm_reraise_whq        q = fullStop  ** requestion q ["Återgår till"];
icm_reraise_ynq        q = fullStop  ** requestion q ["Återgår till"];
icm_reraise_altq       q = fullStop  ** requestion q ["Återgår till"];
icm_accommodate_whq    q = fullStop  ** strUtt ["Visst"];
icm_accommodate_ynq    q = fullStop  ** strUtt ["Visst"];
icm_accommodate_altq   q = fullStop  ** strUtt ["Visst"];
icm_reaccommodate_whq  q = questMark ** requestion q ["Återgår till frågan"];
icm_reaccommodate_ynq  q = questMark ** requestion q ["Återgår till frågan"];
icm_reaccommodate_altq q = questMark ** requestion q ["Återgår till frågan"];

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

know_VQ : VQ = P.mkVQ Irr.veta_V;
fail_VV : VV = P.mkVV (P.mkV "misslyckas" "misslyckas" "misslyckas" "misslyckades" "misslyckats" "misslyckad");
not_Predet : Predet = {s = \\_ => "inte"; lock_Predet = <>};

disjunct_QCl : Str -> QCl -> QCl -> QCl = \disj,q,q' ->
    {s = \\t,a,p,x => q.s!t!a!p!x ++ disj ++ q'.s!t!a!p!x;
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

vp2Utt : VP -> Utt;
vp2Utt vp = mkUtt (M.infVP vp (M.agrP3 P.utrum Sg));

phrUtt : Utt -> Phr;
phrUtt utt = PhrUtt NoPConj utt NoVoc;

}
