
incomplete concrete TramUserI of TramUser = 
    open Grammar, GodisMM, Prelude, Prolog, GodisResource, GodisLexicon,
         (P=TramSystemSem), TramLexicon in {


----------------------------------------------------------------------
-- Predicates and questions

lin

shortest_route =
    noClick (variants{askQS (QuestVP which_IP (UseComp (CompNP the_shortest_route)));
		      reqVP (ComplV2 (variants{find_V2;findout_V2}) 
				 (variants{a_route;
					   the_shortest_route}))});

oper 
a_route : NP = 
    DetCN (DetSg (SgQuant IndefArt) NoOrd) (UseN (variants{way_N;route_N}));

lin

shortest_route__from from =
    maybeClick (wantVP (ComplV2 go_from_V2 from))
    (wantVP (AdvVP (UseV go_V) from_there)) (anstop from);

shortest_route__to to =
    maybeClick (wantVP (ComplV2 go_to_V2 to))
    (wantVP (AdvVP (UseV go_V) to_there)) (anstop to);

shortest_route__from_to from to =
    {sNone  = goAA (PrepNP from_Prep from) (PrepNP to_Prep to);
     sLeft  = goAA          from_there      (PrepNP to_Prep to);
     sRight = goAA (PrepNP from_Prep from)          to_there   ;
     sBoth  = goAA          from_there               to_there   ;
     cLeft  = click (anstop from);
     cRight = click (anstop to)};

shortest_route__to_from to from =
    {sNone  = goAA (PrepNP to_Prep to) (PrepNP from_Prep from);
     sLeft  = goAA (PrepNP to_Prep to)          from_there     ;
     sRight = goAA          to_there    (PrepNP from_Prep from);
     sBoth  = goAA          to_there             from_there     ;
     cLeft  = click (anstop to);
     cRight = click (anstop from)};


from_stop from = maybeClick (UttAdv (PrepNP from_Prep from))
    (UttAdv from_there) (anstop from);
to_stop to = maybeClick (UttAdv (PrepNP to_Prep to))
    (UttAdv to_there) (anstop to);

from_to_stop from to =
    {sNone  = cncAA (PrepNP from_Prep from) (PrepNP to_Prep to);
     sLeft  = cncAA          from_there      (PrepNP to_Prep to);
     sRight = cncAA (PrepNP from_Prep from)          to_there   ;
     sBoth  = cncAA          from_there               to_there   ;
     cLeft  = click (anstop from);
     cRight = click (anstop to)};

to_from_stop to from =
    {sNone  = cncAA (PrepNP to_Prep to) (PrepNP from_Prep from);
     sLeft  = cncAA (PrepNP to_Prep to)          from_there     ;
     sRight = cncAA          to_there    (PrepNP from_Prep from);
     sBoth  = cncAA          to_there             from_there     ;
     cLeft  = click (anstop to);
     cRight = click (anstop from)};


----------------------------------------------------------------------
-- short answers

lin

stop x = maybeClick (UttNP x) 
    (variants{ss[]; there}) (anstop x);

stop_to_stop x to = 
    {sNone  = UttNP (AdvNP x (PrepNP to_Prep to));
     sLeft  = cncAA there (PrepNP to_Prep to);
     sRight = UttNP (AdvNP x to_there);
     sBoth  = cncAA there to_there;
     cLeft  = click (anstop x);
     cRight = click (anstop to)};

stop_from_stop x from = 
    {sNone  = UttNP (AdvNP x (PrepNP from_Prep from));
     sLeft  = cncAA there (PrepNP from_Prep from);
     sRight = UttNP (AdvNP x from_there);
     sBoth  = cncAA there from_there;
     cLeft  = click (anstop x);
     cRight = click (anstop from)};



----------------------------------------------------------------------
-- Actions

lin

top  = noClick (reqVP restart_VP); --- System.top

help = noClick (variants{wantVP (ComplV2 get_V2 (DetCN (DetSg MassDet NoOrd) 
						     (UseN help_N))); --- System.help
			 reqVP (UseV help_V)});


----------------------------------------------------------------------
-- action answers

lincat SysAction = PStr;
lin
top_AA  = P.top;
help_AA = P.help;

answerAction    act = actionClick    act;
answerNegAction act = actionNegClick act;

----------------------------------------------------------------------
-- predicate/issue answers

not_shortest_route = issueNegClick P.shortest_route_Q;

lincat SysProp = PStr;
lin
stop_P      x = P.stop x.sem;
from_stop_P x = P.dept_stop_P x.sem;
to_stop_P   x = P.dest_stop_P x.sem;

answerProp    p = propClick p;
answerNegProp p = propNegClick p;

----------------------------------------------------------------------

oper

anstop : (NP ** Semantics) -> PStr = \stop -> P.answer (P.stop stop.sem);

goAA : Adv -> Adv -> SS = \a,b ->
    wantVP (AdvVP (AdvVP (UseV go_V) a) b);

cncAA : Adv -> Adv -> SS = \a,b -> 
    cc2 (UttAdv a) (UttAdv b);

wantVP : VP -> SS;  -- "I want to go"
wantVP vp = 
    PhrUtt NoPConj
      (UttS (UseCl TPres ASimul PPos
         (PredVP i_NP (ComplVV want_VV vp))))
      (variants{ NoVoc; please_Voc }) ;

reqVP  : VP -> SS;  -- "go!"
reqVP vp = 
    PhrUtt NoPConj
      (UttImpSg PPos (ImpVP vp)) 
      (variants{ NoVoc; please_Voc }) ;

askQS : QCl -> SS;
askQS q = UttQS (UseQCl TPres ASimul PPos q);

}

