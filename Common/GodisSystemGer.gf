--# -path=.:prelude:present

concrete GodisSystemGer of GodisSystem = GodisCatGer ** 
    open Prelude, LangGer, ExtraGer, (P=ParadigmsGer), (M=MorphoGer), (Irr=IrregGer),
         GodisResource, GodisLexiconGer, ConstructX, ParamX in {

lin

----------------------------------------------------------------------
-- questions

action_Q  = isDoing **
    QuestSlash whatSg_IP (AdvSlash (SlashVVV2 i_NP can_VV do_V2)
			      (PrepNP (P.mkPrep "für" P.accusative) you_NP));

issue_Q   = isDoing ** 
    QuestCl (PredVP you_NP (ComplVV want_VV
	(ComplV2 have_V2 (DetCN (DetSg MassDet NoOrd) (UseN (P.regN "Information")))))) ;

ynq  p  = clauseForm p ** QuestCl p;
altq qs = qs; 

BaseProposition p q  = clauseForm p ** disjunct_QCl "oder" (QuestCl p) (QuestCl q);
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
answer_no  = fullStop ** strUtt "Nein";

greet      = fullStop ** strUtt "Fertig";
quit       = fullStop ** strUtt ["Auf wiedersehn"];
shortAns a = fullStop ** UttNP a;
request  a = fullStop ** UttImpPol PPos (ImpVP a);

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

icm_acc_pos       = fullStop  ** strUtt ["Okay"];
icm_con_neg       = fullStop  ** strUtt ["Hallo"];
icm_per_neg       = fullStop  ** strUtt ["Was sagen Sie"];
icm_per_int       = questMark ** strUtt ["Was sagen Sie"];
icm_sem_neg       = fullStop  ** strUtt ["Tut mir Leid , ich verstehe nicht"];
icm_sem_int       = questMark ** strUtt ["Was meinen Sie"];
icm_und_neg       = fullStop  ** strUtt ["Tut mir Leid , ich verstehe nicht"];

icm_reraise       = fullStop ** strUtt ["So ,"];
icm_loadplan      = fullStop ** strUtt ["Sehen wir"];
icm_accommodate   = fullStop ** strUtt ["Natürlich"];

icm_per_pos            x = fullStop  ** strUtt (["Ich glaubte , daß Sie sagten"] ++ x.s);
icm_und_int_prop       p = questMark ** postfixUtt (UttS (useCl p)) [", stimmt es"];
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** 
    postfixUtt (UttS (useCl p)) [", das ist nich eine Alternative"];
--     UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
--         (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
--             (SentCN (UseN (P.regN "Alternative")) (EmbedS (UseCl TPres ASimul PPos p))))))));

icm_acc_neg_que        q = fullStop  ** prefixUtt
    ["Tut mir Leid , ich weiß nichts darüber"]
    (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;

icm_und_pos_vp         p = fullStop  ** 
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_vp         p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p)))) 
    [", stimmt es"];

icm_und_pos_negvp      p = fullStop  ** 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_negvp      p = questMark ** postfixUtt 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p)))) 
    [", stimmt es"];

icm_reraise_act        a = fullStop  ** prefixUtt ["Zurück"] (vp2Utt a);
icm_accommodate_act    a = fullStop  ** strUtt ["Natürlich"];
icm_reaccommodate_act  a = fullStop  ** prefixUtt ["Zurück"] (vp2Utt a); 

icm_und_int_altq       q = questMark ** requestion q ["Ist die Frage"];
icm_reraise_whq        q = fullStop  ** requestion q ["Zurück zu"];
icm_reraise_ynq        q = fullStop  ** requestion q ["Zurück zu"];
icm_reraise_altq       q = fullStop  ** requestion q ["Zurück zu"];
icm_accommodate_whq    q = fullStop  ** strUtt ["Natürlich"];
icm_accommodate_ynq    q = fullStop  ** strUtt ["Natürlich"];
icm_accommodate_altq   q = fullStop  ** strUtt ["Natürlich"];
icm_reaccommodate_whq  q = questMark ** requestion q ["Zurück zur Frage"];
icm_reaccommodate_ynq  q = questMark ** requestion q ["Zurück zur Frage"];
icm_reaccommodate_altq q = questMark ** requestion q ["Zurück zur Frage"];

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

know_VQ : VQ = P.mkVQ Irr.wissen_V;
fail_VV : VV = P.mkVV (P.seinV (P.irregV 
  "missgelingen" "missgelingt" "missgelang" "missgelange" "missgelungen")) ;

not_Predet : Predet = {s = \\_,_,_ => "nicht"; lock_Predet = <>};

disjunct_QCl : Str -> QCl -> QCl -> QCl;
disjunct_QCl disj q q' = 
    {s = \\t,a,p,x => q.s!t!a!p!x ++ disj ++ q'.s!t!a!p!x;
     lock_QCl = <>};

useQCl : (QCl ** ClauseForm) -> QS;
useQCl q = UseQCl TPres (anter q) PPos q;

useCl : (Cl ** ClauseForm) -> S;
useCl c = UseCl TPres (anter c) PPos c;

anter : ClauseForm -> Ant;
anter c = case c.clform of {_ => ASimul}; -- {HasDone => AAnter; IsDoing => ASimul};

negate_Cl : Cl -> Cl;
negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {Neg=>Pos; Pos=>Neg})!o;
     lock_Cl = <>};

vp2Utt : VP -> Utt;
vp2Utt vp = mkUtt (M.useInfVP False vp);

phrUtt : Utt -> Phr;
phrUtt utt = PhrUtt NoPConj utt NoVoc;

}
