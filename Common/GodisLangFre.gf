
instance GodisLangFre of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarFre, PhonoFre,
         ParadigmsFre, (ResFre=ResFre), ParamX, ConstructX, 
         (Lex=LangFre), IrregFre in {

flags optimize = noexpand ;

oper

TODO : (a : Type) -> a = Predef.error "TODO" ;

----------------------------------------------------------------------
-- focus

embed_NP a b x = TODO NP ; 
----{s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet = ["bonjour"];
userQuit  = (variants{ ["au revoir"]; ["c'est tout"] });
userNo    = ["non"];
userYes   = ["oui"];
userOkay  = ["d'accord"];

userCoordinate x y = ss (x.s ++ "et" ++ optStr "ensuite" ++ y.s);

thank_you_Str = variants {"merci"; "parfait"; "excellent"};
i_want_to_Str = variants {["je veux"] ;["je voudrais"]} ;

please_Str    = ["s'il vous plait"] ;
this_that_Str = variants{"ça"; "ceci"};

not_user_prop  p = ss ( "pas" ++ p.s );
not_user_short a = ss ( "pas" ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["Complet"];
goodbye         = mkUtt ["Au revoir"];
yes             = mkUtt ["Oui"];
no              = mkUtt ["Non"];

is_that_correct_Post   = mkUtt [", c'est correcte"];
returning_to_Pre       = mkUtt ["retour à la question"];
returning_to_act_Pre   = mkUtt ["retour à la question"];
returning_to_issue_Pre = mkUtt ["reprendre la question"];
what_did_you_say       = mkUtt ["comment"];
what_do_you_mean       = mkUtt ["qu'est-ce que vous voulez dire"];
i_dont_understand      = mkUtt ["pardon , je ne comprends pas"];
cant_answer_que_Pre    = mkUtt ["pardon , je ne sais rien de"];
not_valid_Post         = mkUtt [", ceci n'est pas une alternative valide"];

icm_acc_pos     = variants { mkUtt ["d'accord"]; mkUtt thank_you_Str }; 
icm_con_neg     = mkUtt ["allô ?"];
icm_reraise     = mkUtt ["donc"];
icm_loadplan    = mkUtt ["voyons"];
icm_accommodate = mkUtt ["compris"];

icm_per_pos   x = mkUtt (["je vous ai cru dire"] ++ elisQue ++ x.s);


----------------------------------------------------------------------
-- noun phrases

sing_NP    s = mkNP s masculine singular ; ----
plur_NP    s = mkNP s masculine plural ;

NPgen_NP np1 np2 = AdvNP np2 (PrepNP possess_Prep np1) ; ----

NP_Cl np = TODO Cl ;

prefix_N n1 n2 = n2 ; ----

----------------------------------------------------------------------
-- verb phrases, actions

VPing  vp = case vp.clform of {
  HasDone => vp; 
  IsDoing => ProgrVP vp
  };

-- vp2Utt vp = UttVP vp ;


----------------------------------------------------------------------
-- general syntactical operations

disjunct_QCl q q' = 
    {s = \\t,a,p,x => q.s!t!a!p!x ++ "ou" ++ q'.s!t!a!p!x;
     lock_QCl = <>};

negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {
       Neg => Pos; 
       Pos => Neg
       })!o;
     lock_Cl = <>};

----------------------------------------------------------------------
-- verbs

see_V           = Lex.see_V2 ** {lock_V = <>}; ----

do_V2           = Lex.do_V2;
have_V2         = Lex.have_V2;
understand_V2   = Lex.understand_V2;

know_VQ         = mkVQ savoir_V2 ;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (regV "rater") ;
like_VV         = mkVV (regV "adorer") ;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = regN "information";

you_NP          = UsePron Lex.youPol_Pron;

----------------------------------------------------------------------
-- closed word categories

of_på_Prep      = genitive ;
for_Prep        = dative ;

not_Predet = {s = \\_,_ => "non" ; c = accusative.c ; lock_Predet = <>} ; ----

no_Quant        = TODO Quant ;
all_Quant       = TODO QuantPl ;


------------------------------------------------------------------

---i_dont_want_to = variants { ["je ne veux pas"] } ;

----------

option_N = regN "alternative" ;

}
