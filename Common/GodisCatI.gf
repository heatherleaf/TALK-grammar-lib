
incomplete concrete GodisCatI of GodisCat = 
    open Cat, Extra, GodisResource in {

lincat

Move, 
ICM       = Utt ** Punctuation;

[Move], 
S         = Text;

ShortAns  = NP;

Proposition      = Cl ** ClauseForm;

[Proposition],
Question,
YNQ, 
AltQ      = QCl ** ClauseForm;

VPProposition    = VP;

[VPProposition]  = [VPI];

Action    = VP ** ClauseForm;

Reason    = S;

}
