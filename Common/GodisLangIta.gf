
instance GodisLangIta of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarIta, PhonoIta,
         ParadigmsIta, (ResIta=ResIta), ParamX, ConstructX, 
         (Lex=LangIta), BeschIta in {

flags optimize = noexpand ;

oper

TODO : (a : Type) -> a = Predef.error "TODO" ;

----------------------------------------------------------------------
-- focus

embed_NP a b x = TODO NP ; 
----{s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet = ["buongiorno"];
userQuit  = (variants{ ["arrivederci"]; ["basta così"] });
userNo    = ["no"];
userYes   = ["sì"];
userOkay  = ["va bene"];

userCoordinate x y = ss (x.s ++ "e" ++ optStr "poi" ++ y.s);

thank_you_Str = variants {"grazie"; "perfetto"; "eccellente"};
i_want_to_Str = variants {["voglio"] ;["vorrei"]} ;

please_Str    = ["per favore"] ;
this_that_Str = variants{"questo"; "quello"};

not_user_prop  p = ss ( "non" ++ p.s );
not_user_short a = ss ( "non" ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["finito"];
goodbye         = mkUtt ["arrivederci"];
yes             = mkUtt ["sì"];
no              = mkUtt ["no"];

is_that_correct_Post   = mkUtt [", è corretto"];
returning_to_Pre       = mkUtt ["ritorniamo a"];
returning_to_act_Pre   = mkUtt ["ritorniamo a"];
returning_to_issue_Pre = mkUtt ["ritorniamo a"];
what_did_you_say       = mkUtt ["come"];
what_do_you_mean       = mkUtt ["che cosa vuole dire"];
i_dont_understand      = mkUtt ["scusi , non capisco"];
cant_answer_que_Pre    = mkUtt ["mi spiace, non so niente di"];
not_valid_Post         = mkUtt ["non è un alternativo"];

icm_acc_pos     = variants { mkUtt ["va bene"]; mkUtt thank_you_Str }; 
icm_con_neg     = mkUtt ["poi ?"];
icm_reraise     = mkUtt ["allora ,"]; ----
icm_loadplan    = mkUtt ["vediamo"];
icm_accommodate = mkUtt ["capito"];

icm_per_pos   x = mkUtt (["le ho sentito dire che"] ++ x.s);


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

see_V           = Lex.see_V2 ** {lock_V = <>}; ----

do_V2           = Lex.do_V2;
have_V2         = Lex.have_V2;
understand_V2   = Lex.understand_V2;

know_VQ         = mkVQ (verboV (sapere_78 "sapere")) ;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (regV "arrenare") ; ----
like_VV         = mkVV (regV "adorare") ;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = regN "informazione";

you_NP          = UsePron Lex.youPol_Pron;

----------------------------------------------------------------------
-- closed word categories

of_på_Prep      = genitive ;
for_Prep        = dative ;

not_Predet = {s = \\_,_ => "non" ; c = accusative.c ; lock_Predet = <>} ; ----

no_Quant        = TODO Quant ;
all_Quant       = TODO QuantPl ;


------------------------------------------------------------------

---i_dont_want_to = variants { ["non voglio"] } ;

option_N = regN "alternativa" ;

}
