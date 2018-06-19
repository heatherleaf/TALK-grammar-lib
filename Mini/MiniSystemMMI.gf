
incomplete concrete MiniSystemMMI of MiniSystem = 
    open MiniSystemI, (Sem=MiniSystemSem), (MM=GodisMM), Grammar in {

lincat

Book = NP ** MM.Semantics;

lin

theGreenBook = theGreenBook ** MM.sem (Sem.theGreenBook);

-------------------------------------------------------------------------------
-- Predicates and Questions 

bookToBuy_Q = bookToBuy_Q ** MM.sem (Sem.bookToBuy_Q);

bookToBuy_P x = bookToBuy_P x ** MM.sem (Sem.bookToBuy_P x.sem) ** 
    MM.shortForm (shortAns (book x)) x.sem;

---------------------------------------------------------------------------
-- Short Answers

book x = book x ** MM.sem (Sem.book x.sem);


-----------------------------------------------------------------------
-- Actions

buyBook = buyBook ** MM.sem (Sem.buyBook);

}
