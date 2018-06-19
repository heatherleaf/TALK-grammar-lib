
instance GodisLangSpa of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarSpa, PhonoSpa, 
         ParadigmsSpa, (ResSpa=ResSpa), ParamX, ConstructX, 
         (Lex=LangSpa), (Be = BeschSpa) in {

flags optimize = noexpand ;

oper

TODO : (a : Type) -> a = Predef.error "TODO" ;

----------------------------------------------------------------------
-- focus

embed_NP a b x = TODO NP ; 
----{s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet = ss ["hola"];
userQuit  = ss (variants{ ["hasta luego"]; ["hasta la vista"] });
userNo    = ss ["no"];
userYes   = ss ["si"];
userOkay  = ss ["de acuerdo"];
userPardon = variants{ ss "perdón"};

userCoordinate x y = ss (x.s ++ "y" ++ optStr "después" ++ y.s);

not_Str       = "no";
thank_you_Str = variants {"gracias"};
i_want_to_Str = variants {["quiero"]} ;

please_Str    = ["por favor"] ;
this_that_Str = variants{"esto"; "eso"};

not_user_prop  p = ss ( "non" ++ p.s );
not_user_short a = ss ( "non" ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["hola"];
goodbye         = mkUtt ["hasta luego"];
yes             = mkUtt ["si"];
no              = mkUtt ["no"];

is_that_correct_Post   = mkUtt [", es correcto"];
returning_to_Pre       = mkUtt ["volviendo a la pregunta"];
returning_to_act_Pre   = mkUtt ["volviendo a la pregunta"];
returning_to_issue_Pre = mkUtt ["volviendo a la pregunta"];
what_did_you_say       = mkUtt ["como"];
what_do_you_mean       = mkUtt ["qué quiere decir con eso"];
i_dont_understand      = mkUtt ["lo siento , no le entiendo"];
cant_answer_que_Pre = mkUtt ["lo siento , no puedo responder preguntas sobre"];
not_valid_Post         = mkUtt [", lo siento , no es una alternativa válida"];

icm_acc_pos     = variants { mkUtt thank_you_Str }; 
icm_con_neg     = mkUtt ["qué"];
icm_reraise     = mkUtt ["ahora ,"]; ----
icm_loadplan    = mkUtt ["veamos"];
icm_accommodate = mkUtt ["comprendo"];

icm_per_pos   x = mkUtt (["vos he oído decir que"] ++ x.s);


----------------------------------------------------------------------
-- noun phrases

sing_NP    s = mkNP s masculine singular ; ----
plur_NP    s = mkNP s masculine plural ;

----NPgen_NP np1 np2 = AdvNP np2 (PrepNP possess_Prep np1) ; ----

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
    {s = \\t,a,p,x => q.s!t!a!p!x ++ "o" ++ q'.s!t!a!p!x;
     lock_QCl = <>};

negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {
       Neg => Pos; 
       Pos => Neg
       })!o;
     lock_Cl = <>};

----------------------------------------------------------------------
-- verbs

see_V           = Lex.see_V2 ** {lock_V = <>} ;

do_V2           = Lex.do_V2;
have_V2         = Lex.have_V2;
understand_V2   = Lex.understand_V2;

know_VQ         = mkVQ (verboV (Be.saber_71 "saber")) ;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (regV "fracasar") ;
like_VV         = mkVV (regV "adorar") ;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = regN "informacion";

i_NP            = UsePron Lex.i_Pron;
you_NP          = UsePron Lex.youPol_Pron;

----------------------------------------------------------------------
-- closed word categories

of_på_Prep      = genitive ;
for_Prep        = dative ;

not_Predet = {s = \\_,_ => "no" ; c = accusative.c ; lock_Predet = <>} ; ----

no_Quant        = TODO Quant ;
all_Quant       = TODO QuantPl ;


------------------------------------------------------------------

---i_dont_want_to = variants { ["no quiero"] } ;

option_N = regN "alternativa" ;

}
