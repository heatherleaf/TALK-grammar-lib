
instance GodisLangFin of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarFin, 
         ParadigmsFin, (ResFin=ResFin), ParamX, ConstructX, 
         (Lex=LangFin) in {

flags optimize = noexpand ;

oper

TODO : (a : Type) -> a = Predef.error "TODO" ;

----------------------------------------------------------------------
-- focus

embed_NP a b x = TODO NP ; 
----{s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet = ss ["hei"];
userQuit  = ss (variants{ ["n�kemiin"]; ["lopetetaan"] });
userNo    = ss ["ei"];
userYes   = ss ["kyll�"];
userOkay  = variants { ss ["okei"]; ss ["selv�"] };
userPardon = variants{ ss "urs�kta" };

userCoordinate x y = ss (x.s ++ "ja" ++ optStr "sitten" ++ y.s);


not_Str       = "ei"; ----
thank_you_Str = variants {"kiitos"; "loistavaa"; "kiitti"};
i_want_to_Str = variants {"haluan"; "haluaisin"} ;

please_Str    = ["ole hyv�"] ;
this_that_Str = variants{"t�m�"; "tuo"};

not_user_prop  p = ss ( not_Str ++ p.s );
not_user_short a = ss ( not_Str ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["Valmis"];
goodbye         = mkUtt ["N�kemiin"];
yes             = mkUtt ["Kyll�"];
no              = mkUtt ["Ei"];

is_that_correct_Post   = mkUtt [", pit��k� paikkansa"];
returning_to_Pre       = mkUtt ["Takaisin kohtaan"];
returning_to_act_Pre   = mkUtt ["Takaisin kohtaan"];
returning_to_issue_Pre = mkUtt ["Takaisin aiheeseen"];
what_did_you_say       = mkUtt ["Mit� sanoitte"];
what_do_you_mean       = mkUtt ["Mit� tarkoitatte"];
i_dont_understand      = mkUtt ["Anteeksi, en ymm�rr�"];
cant_answer_que_Pre    = mkUtt ["Anteeksi, en tied� mit��n aiheesta"];
not_valid_Post         = mkUtt ["ei ole mahdollinen vaihtoehto"];

icm_acc_pos     = variants { mkUtt ["Okei"]; mkUtt thank_you_Str }; 
icm_con_neg     = mkUtt ["No?"];
icm_reraise     = mkUtt ["No niin, "];
icm_loadplan    = mkUtt ["Katsotaan"];
icm_accommodate = mkUtt ["Selv�"];

icm_per_pos   x = mkUtt (["Luulin ett� sanoitte ett�"] ++ x.s);


----------------------------------------------------------------------
-- noun phrases

sing_NP    s = mkNP (nLinux s) singular ; ----
plur_NP    s = mkNP (nLinux s) plural ;

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
    {s = \\t,a,p => q.s!t!a!p ++ "vai" ++ q'.s!t!a!p;
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

know_VQ         = mkVQ (reg2V "tiet��" "tiesi") ;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (regV "ep�onnistua");
like_VV         = mkVV (mkV "haluta" "haluaa" "haluan" "haluavat" "halutkaa" 
  "halutaan" "halusi" "halusin" "haluaisi" "halunnut" "haluttu" "halutun") ;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = regN "tieto";

you_NP          = UsePron Lex.youPol_Pron;
i_NP            = UsePron Lex.i_Pron;

----------------------------------------------------------------------
-- closed word categories

of_p�_Prep      = casePrep genitive ;
for_Prep        = casePrep allative ;

not_Predet      = {s = \\n,c => not_Str ; lock_Predet = <>} ; ----

no_Quant        = TODO Quant ;
all_Quant       = TODO QuantPl ;


------------------------------------------------------------------

i_dont_want_to = variants { ["en halua"];
                            ["en tahdo"] };

-- Finnish-specific

-- local cases in free variation

in_Case   : Case = variants {adessive ; inessive} ;
to_Case   : Case = variants {allative ; illative} ;
from_Case : Case = variants {ablative ; elative} ;

}
