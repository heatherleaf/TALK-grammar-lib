--# -path=.:prelude

abstract GodisCat = PredefAbs ** {

cat

Move; 
ICM; 
ListMove;
S;

ShortAns;

Proposition;

-- NOTE: Question means only WhQ
-- this division is for Multimodality to work
Question;
YNQ; AltQ;
ListProposition;

-- special kind of proposition best linearized as a VP, 
-- only used in Y/N and Alt questions starting with "do you want to ..."
-- this is for VP aggregation to work
VPProposition; -- issue(X^p(X)) and action(a)
ListVPProposition;

Action;
Reason;

}
