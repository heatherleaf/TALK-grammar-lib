
incomplete concrete MiniSystemI of MiniSystem = open Lang, GodisResource in {

lincat Book = NP;

lin

theGreenBook = DetCN (DetSg (SgQuant DefArt) NoOrd) (AdjCN (PositA green_A) (UseN book_N));

-------------------------------------------------------------------------------
-- Predicates and Questions 

bookToBuy_Q = isDoing ** 
    QuestSlash (IDetCN whichSg_IDet NoNum NoOrd (UseN book_N)) 
    (SlashVVV2 (UsePron youSg_Pron) want_VV buy_V2);

bookToBuy_P x = isDoing ** 
    PredVP (UsePron youSg_Pron) (ComplVV want_VV (ComplV2 buy_V2 x));

---------------------------------------------------------------------------
-- Short Answers

book x = x;

-----------------------------------------------------------------------
-- Actions

buyBook = isDoing ** ComplV2 buy_V2 (DetCN (DetSg (SgQuant IndefArt) NoOrd) (UseN book_N));

}
