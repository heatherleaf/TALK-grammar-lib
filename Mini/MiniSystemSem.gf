--# -path=.:../Common:prelude

concrete MiniSystemSem of MiniSystem = GodisSystemSem ** open Prolog in {

lincat Book = PStr;

lin

theGreenBook = pp0 "the_green_book";

-------------------------------------------------------------------------------
-- Predicates and Questions 

bookToBuy_Q = pWhQ "book_to_buy";
bookToBuy_P = pp1  "book_to_buy";

---------------------------------------------------------------------------
-- Short Answers

book = pp1 "book";

-----------------------------------------------------------------------
-- Actions

buyBook = pp0 "buy_book";

}
