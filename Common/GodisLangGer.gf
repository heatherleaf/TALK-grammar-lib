
instance GodisLangGer of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarGer, ParadigmsGer, ConstructX,
         (Mo=MorphoGer), ResGer, (Lex=LexiconGer), (Irreg=IrregGer) in {

--flags optimize=noexpand ;

oper

----------------------------------------------------------------------
-- focus

embed_NP a b x = {s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet = ss ["hallo"];
userQuit  = ss ["tschüß"];
userNo    = ss ["nein"];
userYes   = ss ["ja"];
userOkay  = ss ["okay"];
userPardon = variants{ ss "pardon"; ss "was" };

userCoordinate x y = ss (x.s ++ "und" ++ optStr "dann" ++ y.s);

not_Str       = "nicht";
thank_you_Str = variants{ "prima"; "Danke"; userOkay.s };
i_want_to_Str = variants{ "ich" ++ variants{ "will"; ["möchte"] };
                          ["können Sie"] };
please_Str    = "Danke";
this_that_Str = "das" ;

not_user_prop  p = ss ( not_Str ++ p.s );
not_user_short a = ss ( not_Str ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["fertig"];
goodbye         = mkUtt ["auf viedersehn"];
yes             = mkUtt ["ja"];
no              = mkUtt ["nein"];

is_that_correct_Post   = mkUtt [", stimmt es"];
returning_to_Pre       = mkUtt ["zurück zu"];
returning_to_act_Pre   = mkUtt ["zurück"];
returning_to_issue_Pre = mkUtt ["zurück zur Frage"];
what_did_you_say       = mkUtt ["was sagen Sie"];
what_do_you_mean       = mkUtt ["was meinen Sie"];
i_dont_understand      = mkUtt ["ich verstehe nicht"];
cant_answer_que_Pre    = mkUtt ["tut mir Leid , ich weiß nichts über"];
---not_valid_Post         = mkUtt ["kann nicht gewählt werden"];

icm_acc_pos     = mkUtt thank_you_Str;
icm_con_neg     = mkUtt ["hallo ?"];
icm_reraise     = mkUtt ["so ,"];
icm_loadplan    = mkUtt ["sehen wir"];
icm_accommodate = mkUtt ["natürlich"];

icm_per_pos   x = mkUtt (["ich glaubte , daß Sie sagten"] ++ x.s);


----------------------------------------------------------------------
-- noun phrases

sing_NP    s = UsePN (mkPN s (s+"s")) ;
--plur_NP    s = regNP s (s+"s") Plg   ** {lock_NP = <>};

NPgen_NP = NP_of_NP;

NP_Cl np = {s = \\t,a,b,o => np.s ! Nom; lock_Cl = <>};

{- ---
prefix_N n1 n2 = {s = \\n,s,c => n1.s!Sg!Indef!Gen ++ n2.s!n!s!c;
		  g = n2.g;
		  lock_N = <>};
-}

----------------------------------------------------------------------
-- actions/verb phrases

VPing act = act;
-- vp2Utt vp = mkUtt (useInfVP vp) ;
-- UttVP vp;


----------------------------------------------------------------------
-- general syntactical operations

disjunct_QCl q q' = 
    {s = \\t,a,p,x => q.s!t!a!p!x ++ "oder" ++ q'.s!t!a!p!x;
     lock_QCl = <>};

negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {Neg=>Pos; Pos=>Neg})!o;
     lock_Cl = <>};

-- disjunct_Utt u u' = ss (u.s ++ "oder" ++ u'.s);
-- disjunct_VP vp vp' = 
--     insertObj (\\agr => "oder" ++ (ImpVP vp').s!Pos!(agr.gn)) vp;


----------------------------------------------------------------------
-- verbs

see_V           = Irreg.sehen_V;

do_V2           = Lex.do_V2;
have_V2         = Lex.have_V2;
understand_V2   = Lex.understand_V2;

know_VQ         = mkVQ Irreg.wissen_V;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (seinV (irregV 
  "missgelingen" "missgelingt" "missgelang" "missgelange" "missgelungen")) ;
like_VV         = want_VV;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = regN "Information" ;

you_NP          = UsePron youPol_Pron;

----------------------------------------------------------------------
-- closed word categories

of_på_Prep      = mkPrep "auf" dative;
for_Prep        = mkPrep "für" accusative;

not_Predet      = {s = \\_,_,_ => not_Str; lock_Predet = <>};

no_Quant        = {
      s = table {
        Sg => \\g,c => "kein" + Mo.pronEnding ! GSg g ! c ;  
        Pl => (Mo.detLikeAdj Pl "dies").s
        } ;
      a = Strong ;
      lock_Quant = <>
      } ;




----------------------------------------------------------------------

---i_dont_want_to = ["ich will nicht"];

  option_N = regN "Alternative" ;

}
