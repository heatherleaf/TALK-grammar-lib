
incomplete concrete DeluxUserI of DeluxUser = 
    open Grammar, GodisLang, GodisMM,
         (P=DeluxSystemSem), DeluxSystem, DeluxLexicon in {


----------------------------------------------------------------------
-- Actions

lin
top = noClick -- actionClick P.top
    (reqVP top);

-- help = noClick (variants{reqVP help;
-- 			 PhrUtt NoPConj (UttImpSg PPos (ImpVP (UseV help_V))) 
-- 			     (variants{NoVoc;please_Voc})});


----------------------------------------------------------------------
-- short answers

lin
room r = noClick (variants {ansNP (the_N_sg r);
                            use_Adv (in_NP (the_N_sg r))});

lamp l = noClick (ansNP (the_N_sg l));

room_lamp r l = noClick (variants{ansNP (AdvNP (the_N_sg l) (in_NP (the_N_sg r)));
				  ansNP (the_N_sg (prefix_N r l))});

not_room x = propNegClick x.sem;
not_lamp x = propNegClick x.sem;

}

