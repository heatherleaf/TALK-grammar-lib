--# -path=.:prelude

resource GodisMM = open Prelude, Prolog in {

----------------------------------------------------------------------
-- Multimodal input

oper

UserMM : Type = {sNone, sLeft, sRight, sBoth : SS; 
		 cLeft, cRight : PStr};

-- DoubleMM ger error i MCFG/FCFG-konverteringen!!
-- DoubleMM : Type = {s1,s2 : UserMM};

click : PPStr = pp1 "click";

userMM : SS -> SS -> PStr -> UserMM = \sNoclick,sClick,clk ->
    {sNone  = sNoclick;
     sLeft  = sClick;
     sRight = failSS;
     sBoth  = failSS;
     cLeft  = clk;
     cRight = failSS};

-- doubleMM : UserMM -> UserMM -> DoubleMM = \left,right -> {s1 = left; s2 = right};

noClick : SS -> UserMM = \s -> userMM s failSS failSS;

maybeClick : SS -> SS -> PStr -> UserMM = \sNoclick,sClick,pred ->
    userMM sNoclick sClick (click pred);

maybeClick1 : SS -> SS -> PStr -> UserMM = \s0,s1,p -> 
    userMM s0 s1 (click p);
maybeClick2 : SS -> SS -> PStr -> PStr -> UserMM = \s0,s1,p,q -> 
    userMM s0 s1 (pConcat (click p) (click q));
maybeClick3 : SS -> SS -> PStr -> PStr -> PStr -> UserMM = \s0,s1,p,q,r -> 
    userMM s0 s1 (pConcat (click p) (pConcat (click q) (click r)));
maybeClick4 : SS -> SS -> PStr -> PStr -> PStr -> PStr -> UserMM = \s0,s1,p,q,r,r' -> 
    userMM s0 s1 (pConcat (click p) (pConcat (click q) (pConcat (click r) (click r'))));

justClick1 : SS -> PStr -> UserMM = \s -> maybeClick1 failSS s;
justClick2 : SS -> PStr -> PStr -> UserMM = \s -> maybeClick2 failSS s;
justClick3 : SS -> PStr -> PStr -> PStr -> UserMM = \s -> maybeClick3 failSS s;
justClick4 : SS -> PStr -> PStr -> PStr -> PStr -> UserMM = \s -> maybeClick4 failSS s;

onlyClick1 : PStr -> UserMM = \p -> justClick1 (ss []) p;
onlyClick2 : PStr -> PStr -> UserMM = \p -> justClick2 (ss []) p;
onlyClick3 : PStr -> PStr -> PStr -> UserMM = \p -> justClick3 (ss []) p;
onlyClick4 : PStr -> PStr -> PStr -> PStr -> UserMM = \p -> justClick4 (ss []) p;

-- DoubleMM ger error i MCFG/FCFG-konverteringen!!
-- actionClick : PStr -> SS -> UserMM = \act,str -> 
--     maybeClick1 str (ss[]) (variants{pp1 "answer" (pp1 "action" act);
-- 				     pp1 "request" act});
-- actionClick : PStr -> SS -> DoubleMM = \act,str -> 
--     doubleMM (noClick str) 
--     (maybeClick1 failSS (ss[]) (variants{pp1 "answer" (pp1 "action" act);
-- 					 pp1 "request" act}));
actionClick : PStr -> UserMM = \act -> 
    maybeClick1 failSS (ss[]) (variants{pp1 "answer" (pp1 "action" act);
					pp1 "request" act});
actionNegClick : PStr -> UserMM = \act -> 
    maybeClick1 failSS (ss[]) (pp1 "answer" (pp1 "not" (pp1 "action" act)));

issueClick : PStr -> SS -> UserMM =
    \que,str -> maybeClick str (ss []) (pp1 "answer" (pp1 "issue" que));
issueNegClick : PStr -> UserMM = \que ->
    maybeClick1 failSS (ss []) (pp1 "answer" (pp1 "not" (pp1 "issue" que)));

propClick : PStr -> UserMM = \prop -> 
    maybeClick1 failSS (ss[]) (pp1 "answer" prop);
propNegClick : PStr -> UserMM = \prop -> 
    maybeClick1 failSS (ss[]) (pp1 "answer" (pp1 "not" prop));


flattenMM : UserMM -> SS = \t -> variants{
    combineMM t.sNone  pEmpty;
    combineMM t.sLeft  t.cLeft;
    combineMM t.sRight t.cRight;
    combineMM t.sBoth  (pConcat t.cLeft t.cRight)
    };

-- only recognizes the _left_ click of the two conjuncts
concatMM : (SS -> SS -> SS) -> UserMM -> UserMM -> UserMM = \coord,a,b ->
    {sNone  = coord a.sNone b.sNone;
     sLeft  = coord a.sLeft b.sNone;
     sRight = coord a.sNone b.sLeft;
     sBoth  = coord a.sLeft b.sLeft;
     cLeft  = a.cLeft;
     cRight = b.cLeft};

-- this can handle two clicks in total, regardless of where they occur
flattenConcatMM : (SS -> SS -> SS) -> UserMM -> UserMM -> SS = \coord,a,b ->
    variants{flattenMM {sNone  = coord a.sNone b.sNone;
			sLeft  = coord a.sLeft b.sNone;
			sRight = coord a.sNone b.sLeft;
			sBoth  = coord a.sLeft b.sLeft;
			cLeft  = a.cLeft;
			cRight = b.cLeft};
	     flattenMM {sNone  = failSS;
			sLeft  = coord a.sRight b.sNone;
			sRight = coord a.sNone  b.sRight;
			sBoth  = coord a.sRight b.sRight;
			cLeft  = a.cRight;
			cRight = b.cRight};
	     flattenMM {sNone  = failSS; sLeft = failSS; sRight = failSS;
			sBoth  = coord a.sLeft b.sRight;
			cLeft  = a.cLeft;
			cRight = b.cRight};
	     flattenMM {sNone  = failSS; sLeft = failSS; sRight = failSS;
			sBoth  = coord a.sRight b.sLeft;
			cLeft  = a.cRight;
			cRight = b.cLeft};
	     flattenMM {sNone  = failSS; sLeft = failSS; sRight = failSS;
			sBoth  = coord a.sBoth b.sNone;
			cLeft  = a.cLeft;
			cRight = a.cRight};
	     flattenMM {sNone  = failSS; sLeft = failSS; sRight = failSS;
			sBoth  = coord a.sNone b.sBoth;
			cLeft  = b.cLeft;
			cRight = b.cRight}};


-- local operations

failSS    : SS = ss nonExist;

combineMM : SS -> PStr -> SS = \s,p -> 
    pOper separatorMM  --# multimodal
    s 
    p  --# multimodal
    ;

separatorMM : Str = ";";


----------------------------------------------------------------------
-- Multimodal GUI output

oper

Semantics : Type = {sem : PStr};
sem : PStr -> Semantics = \ps -> {sem = ps};

SystemMM : Type = {mm : PStr};
mm : PStr -> SystemMM = \ps -> {mm = ps};

label  : PStr -> PStr  = \x -> pp1 "label" (pQuote x);
button : PStr -> PStr -> PStr = \x,y -> pp2 "button" (pQuote x) (pQuote y);
menu   : PStr -> PStr  = \x -> pp1 "menu" x;
menu_with_title : PStr -> PStr -> PStr = \x,y -> pp2 "menu" (pQuote x) y;
textentrybox    : PStr -> PStr  = \x -> pp1 "textentrybox" (pQuote x);

-- special for propositions

ShortForm : Type = {short : Bool; shortForm : SS; shortSem : PStr};
longForm  : ShortForm = {short = False; shortForm = ss ""; shortSem = pStr ""};
shortForm : SS -> PStr -> ShortForm
    = \s,p -> {short = True; shortForm = s; shortSem = p};

}
