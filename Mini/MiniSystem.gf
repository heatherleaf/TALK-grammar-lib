--# -path=.:../Common:prelude:alltenses

abstract MiniSystem = GodisSystem ** {

cat Book;

fun

theGreenBook : Book;

-------------------------------------------------------------------------------
-- Predicates and Questions 

bookToBuy_Q : Question;
bookToBuy_P : Book -> Proposition;

---------------------------------------------------------------------------
-- Short Answers

book : Book -> ShortAns;

-----------------------------------------------------------------------
-- Actions

buyBook : Action;

}
