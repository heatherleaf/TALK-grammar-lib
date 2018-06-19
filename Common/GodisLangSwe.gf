
instance GodisLangSwe of GodisLang = GodisResource ** 
    open Prelude, PredefCnc, GrammarSwe, ParadigmsSwe, ConstructX,
         MorphoSwe, CommonScand, (Lex=LexiconSwe), (Irreg=IrregSwe) in {

oper

----------------------------------------------------------------------
-- focus

embed_NP a b x = {s = \\c => a ++ (x.s ! c) ++ b; a = x.a; lock_NP = <>};


----------------------------------------------------------------------
-- user utterances

userGreet  = ss ["hej"];
userQuit   = ss ["hejd�"];
userNo     = ss ["nej"];
userYes    = ss ["ja"];
userOkay   = variants { ss ["okej"] }; -- ss ["o k"] };
userPardon = variants{ ss "urs�kta"; ss "va" };

userCoordinate x y = ss (x.s ++ "och" ++ y.s);

not_Str       = "inte";
thank_you_Str = variants{ "schysst"; "tack"; userOkay.s };
i_want_to_Str = variants{ "jag" ++ variants{ "vill"; ["skulle vilja"] };
                          ["kan du"] };
please_Str    = "tack";
this_that_Str = variants{ variants{"den";"det"} ++ optStr "h�r";
			  "denna"; "detta" };

not_user_prop  p = ss ( not_Str ++ p.s );
not_user_short a = ss ( not_Str ++ a.s );

----------------------------------------------------------------------
-- system utterances

hello           = mkUtt ["Hej"];
goodbye         = mkUtt ["Hejd�"];
yes             = mkUtt ["Ja"];
no              = mkUtt ["Nej"];

is_that_correct_Post   = mkUtt [", �r det korrekt"];
returning_to_Pre       = mkUtt ["�terg�r till"];
returning_to_act_Pre   = mkUtt ["�terg�r till att"];
returning_to_issue_Pre = mkUtt ["�terg�r till fr�gan om"];
what_did_you_say       = mkUtt ["Vad sa du"];
what_do_you_mean       = mkUtt ["Vad menar du"];
i_dont_understand      = mkUtt ["Jag f�rst�r inte riktigt"];
cant_answer_que_Pre    = mkUtt ["Ledsen , jag kan inte svara p� fr�gor om"];
not_valid_Post         = mkUtt ["g�r inte att v�lja"];

icm_acc_pos     = mkUtt thank_you_Str;
icm_con_neg     = mkUtt ["Hall�?"];
icm_reraise     = mkUtt ["S� ,"];
icm_loadplan    = mkUtt ["F� se"];
icm_accommodate = mkUtt ["Visst"];

icm_per_pos   x = mkUtt (["Jag tyckte du sa"] ++ x.s);


----------------------------------------------------------------------
-- noun phrases

sing_NP    s = regNP s (s+"s") SgUtr ** {lock_NP = <>};
plur_NP    s = regNP s (s+"s") Plg   ** {lock_NP = <>};

NPgen_NP = NP_of_NP;

NP_Cl np = {s = \\t,a,b,o => np.s ! nominative; lock_Cl = <>};

prefix_N n1 n2 = {s = \\n,s,c => n1.s!Sg!Indef!Gen ++ n2.s!n!s!c;
		  g = n2.g;
		  lock_N = <>};


----------------------------------------------------------------------
-- actions/verb phrases

VPing act = act;
-- vp2Utt vp = mkUtt (infVP vp (agrP3 utrum Sg));
-- UttVP vp;


----------------------------------------------------------------------
-- general syntactical operations

disjunct_QCl q q' = 
    {s = \\t,a,p,x => q.s!t!a!p!x ++ "eller" ++ q'.s!t!a!p!x;
     lock_QCl = <>};

negate_Cl c = 
    {s = \\t,a,p,o => c.s!t!a!(case p of {Neg=>Pos; Pos=>Neg})!o;
     lock_Cl = <>};

-- disjunct_Utt u u' = ss (u.s ++ "eller" ++ u'.s);
-- disjunct_VP vp vp' = 
--     insertObj (\\agr => "eller" ++ (ImpVP vp').s!Pos!(agr.gn)) vp;


----------------------------------------------------------------------
-- verbs

see_V           = Irreg.se_V;

do_V2           = Lex.do_V2;
have_V2         = Lex.have_V2;
understand_V2   = Lex.understand_V2;

know_VQ         = mkVQ Irreg.veta_V;
wonder_VQ       = Lex.wonder_VQ;

say_VS          = Lex.say_VS;

fail_VV         = mkVV (mkV "misslyckas" "misslyckas" "misslyckas" "misslyckades" "misslyckats" "misslyckad");
like_VV         = want_VV;

----------------------------------------------------------------------
-- nouns, proper nouns, common nouns and noun phrases

information_N   = mk2N "information" "informationer";
option_N        = mk2N "alternativ" "alternativ"; 

you_NP          = UsePron youSg_Pron; -- MorphoSwe.mkNP "du"  "dig" "din" "ditt" "dina" SgUtr P2;
i_NP            = UsePron i_Pron; -- MorphoSwe.mkNP "jag" "mig" "min" "mitt" "mina" SgUtr P1;

----------------------------------------------------------------------
-- closed word categories

of_p�_Prep      = mkPrep "p�";
for_Prep        = mkPrep "f�r";

not_Predet      = {s = \\_ => not_Str; lock_Predet = <>};

no_Quant        = {s = table {Sg => \\_ => table {Utr => "ingen"; 
						  Neutr => "inget"};
			      Pl => \\_,_ => "inga"};
		   det = DIndef;
		   lock_Quant = <>};

all_Quant       = {s = \\_,_ => "alla";
		   det = DIndef;
		   lock_QuantPl = <>};



----------------------------------------------------------------------

i_dont_want_to = ["jag vill inte"];

}
