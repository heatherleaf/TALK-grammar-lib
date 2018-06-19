
resource GodisResource = open CommonX, ConstructX, TextX, Prelude, PredefAbs in {

----------------------------------------------------------------------
-- different clause forms

param ClForm = HasDone | IsDoing;

oper

ClauseForm : Type;
clauseForm : ClauseForm -> ClauseForm;

hasDone : ClauseForm;
isDoing : ClauseForm;

anter : ClauseForm -> Ant;
anter c = case c.clform of {
    HasDone => AAnter; --# notpresent
    _ => ASimul
    };

----------------------------------------------------------------------
-- punctuation on system utterances

param Punctn = FullStop | QuestMark;

oper

Punctuation : Type;
fullStop,
questMark   : Punctuation;
consText    : Punctuation -> Phr -> Text -> Text;

----------------------------------------------------------------------
-- utterances

oper

strUtt     : Str -> Utt;
prefixUtt  : Str -> Utt -> Utt;
postfixUtt : Utt -> Str -> Utt;
cncUtt     : Utt -> Utt -> Utt;

----------------------------------------------------------------------
-- integers

oper 

int : Str -> Int;


----------------------------------------------------------------------
-- language independent implementations
----------------------------------------------------------------------

oper

----------------------------------------------------------------------
-- different clause forms

ClauseForm = {clform : ClForm};
clauseForm c = c;

hasDone = {clform = HasDone};
isDoing = {clform = IsDoing};

----------------------------------------------------------------------
-- punctuation on system utterances

Punctuation = {punctuation : Punctn};
fullStop    = {punctuation = FullStop};
questMark   = {punctuation = QuestMark};

consText punct txt = case punct.punctuation of
    { FullStop => TFullStop txt; QuestMark => TQuestMark txt };

----------------------------------------------------------------------
-- utterances

strUtt     s   = mkUtt s;
prefixUtt  s u = strUtt (s ++ u.s);
postfixUtt u s = strUtt (u.s ++ s);
cncUtt     u u'= strUtt (u.s ++ u'.s);

----------------------------------------------------------------------
-- integers

int s = {s = s; last = 0; size = 1};

}
