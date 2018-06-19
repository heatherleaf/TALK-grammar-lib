--# -path=.:prelude:present

concrete GodisSystemSpa of GodisSystem = GodisCatSpa ** 
    open Prelude, LangSpa, ExtraSpa, (P=ParadigmsSpa), (B=BeschSpa),
         GodisResource, GodisLexiconSpa, ConstructX, ParamX in {

lin

----------------------------------------------------------------------
-- questions

action_Q  = isDoing **
    QuestSlash whatSg_IP (AdvSlash (SlashVVV2 i_NP can_VV do_V2)
			      (PrepNP for_Prep you_NP));

issue_Q   = isDoing ** 
    QuestCl (PredVP you_NP (ComplVV want_VV
	(ComplV2 have_V2 (DetCN (DetSg MassDet NoOrd) (UseN (P.regN "información")))))) ;

ynq  p  = clauseForm p ** QuestCl p;
altq qs = qs; 

BaseProposition p q  = clauseForm p ** disjunct_QCl "," (QuestCl p) (QuestCl q);
ConsProposition p qs = clauseForm p ** disjunct_QCl "o" (QuestCl p) qs;

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

notS     a = AdvNP a (mkAdv "no") ;

----------------------------------------------------------------------
-- dialogue moves

answer_yes = fullStop ** strUtt "Si";
answer_no  = fullStop ** strUtt "No";

greet      = fullStop ** strUtt "Terminado";
quit       = fullStop ** strUtt ["Hasta luego"];
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

{- Rebeccas ICM-yttranden:
icm_con_neg = ["Oye?"]
icm_per_int = ["Cómo dice?"] / ["Qué ha dicho?"]
icm_per_neg = ["Perdone, no le he oído bien"]
icm_per_pos X = ["Ha dicho"] ++ X
icm_sem_int = ["Qué quiere decir"]
icm_sem_neg = ["Lo siento, no le entiendo"]
icm_und_neg = ["No le entiendo de todo"]
icm_und_pos_vp Q = ["Quiere saber algo sobre"] ++ Q
icm_und_pos_negvp Q = ["No ha preguntado sobre"] ++ Q
icm_acc_neg_que Q = ["Lo siento, no sé contestar a preguntas sobre"] ++ Q
icm_acc_neg_prop P = ["Lo siento,"] ++ P ++ ["no es un parámetro válido"]
icm_loadplan = ["A ver"]
icm_reraise = ["Así"]
icm_accommodate = ["De acuerdo"]
icm_reraise_whq/ynq/altq Q = ["Volviendo al tema de"] ++ Q
icm_reraise_act A = ["Volviendo a"] ++ A
icm_reaccommodate_whq/ynq/altq Q = ["Volviendo al tema de"] ++ Q
-}

icm_acc_pos       = fullStop  ** strUtt ["Muy bien"];
icm_con_neg       = fullStop  ** strUtt ["qué"];
icm_per_neg       = fullStop  ** strUtt ["como"];
icm_per_int       = questMark ** strUtt ["como"];
icm_sem_neg       = fullStop  ** strUtt ["lo siento , no le entiendo"];
icm_sem_int       = questMark ** strUtt ["qué quiere decir con eso"];
icm_und_neg       = fullStop  ** strUtt ["lo siento , no le entiendo"];

icm_reraise       = fullStop ** strUtt ["a ver"];
icm_loadplan      = fullStop ** strUtt ["vamos a ver"];
icm_accommodate   = fullStop ** strUtt ["de acuerdo"];

icm_per_pos            x = fullStop  ** strUtt (["Vos he oído decir que"] ++ x.s);
icm_und_int_prop       p = questMark ** postfixUtt (UttS (useCl p)) [", es correcto"];
icm_und_pos_prop       p = fullStop  ** (UttS (useCl p));
icm_acc_neg_prop       p = fullStop  ** 
    postfixUtt (UttS (useCl p)) [", no es una alternativa válida"];
--     UttS (UseCl TPres ASimul PNeg (ImpersCl (UseComp 
--         (CompNP (DetCN (DetSg (SgQuant IndefArt) NoOrd) 
--             (SentCN (UseN option_N) (EmbedS (UseCl TPres ASimul PPos p))))))));

icm_acc_neg_que        q = fullStop  ** prefixUtt
    ["Lo siento, no sé nada del tema"]
    (UttAdv (AdvSC (EmbedQS (useQCl q))));
icm_sem_pos_move       m = fullStop  ** m;
icm_sem_pos_shortAns   a = fullStop  ** UttNP a;

icm_und_pos_vp         p = fullStop  ** 
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_vp         p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PPos (PredVP you_NP (ComplVV want_VV p)))) 
    [", es correcto"];

icm_und_pos_negvp      p = fullStop  ** 
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p))));
icm_und_int_negvp      p = questMark ** postfixUtt
    (UttS (UseCl TPres ASimul PNeg (PredVP you_NP (ComplVV want_VV p)))) 
    [", es correcto"];

icm_reraise_act        a = fullStop  ** prefixUtt ["volviendo a"] (UttVP a); -- (VPing a));
icm_accommodate_act    a = fullStop  ** strUtt ["de acuerdo"];
icm_reaccommodate_act  a = fullStop  ** prefixUtt ["volviendo a la pregunta"] (UttVP a); 

icm_und_int_altq       q = questMark ** UttAdv (AdvSC (EmbedQS (useQCl q)));
icm_reraise_whq      q = fullStop  ** requestion q ["volviendo a la pregunta"];
icm_reraise_ynq      q = fullStop  ** requestion q ["volviendo a la pregunta"];
icm_reraise_altq     q = fullStop  ** requestion q ["volviendo a la pregunta"];
icm_accommodate_whq    q = fullStop  ** strUtt ["de acuerdo"];
icm_accommodate_ynq    q = fullStop  ** strUtt ["ce acuerdo"];
icm_accommodate_altq   q = fullStop  ** strUtt ["de acuerdo"];
icm_reaccommodate_whq q = fullStop  ** requestion q ["volviendo a la pregunta"];
icm_reaccommodate_ynq q = fullStop  ** requestion q ["volviendo a la pregunta"];
icm_reaccommodate_altq q = fullStop  ** requestion q ["volviendo a la pregunta"];

oper requestion : (QCl ** ClauseForm) -> Str -> Utt 
	 = \q,s -> prefixUtt s (UttAdv (AdvSC (EmbedQS (useQCl q))));

----------------------------------------------------------------------
-- lists of moves, utterances

lin

BaseMove m = consTextSpa m m TEmpty;
ConsMove m = consTextSpa m m;

BaseICM  m = consTextSpa m m TEmpty;
ConsICM  m = consTextSpa m m;

godis_utterance x = x;


----------------------------------------------------------------------
-- local operations

oper

not_Predet : Predet = {s = \\_,_ => "no" ; c = P.accusative.c ; lock_Predet = <>};
fail_VV : VV         = P.mkVV (P.regV "fracasar") ;
know_VQ : VQ         = P.mkVQ (P.verboV (B.saber_71 "saber")) ;

disjunct_QCl : Str -> QCl -> QCl -> QCl;
disjunct_QCl disj q q' =
    {s = \\t,a,p,x => q.s!t!a!p!x ++ disj ++ q'.s!t!a!p!x;
     lock_QCl = <>};

consTextSpa : Punctuation -> Utt -> Text -> Text;
consTextSpa punct utt  = let txt = PhrUtt NoPConj utt NoVoc in
    case punct.punctuation of
    { FullStop => TFullStop txt; QuestMark => TQuestMark txt };

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

negate_Cl    : Cl -> Cl;
negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {
       Neg => Pos; 
       Pos => Neg
       })!o;
     lock_Cl = <>};

}
