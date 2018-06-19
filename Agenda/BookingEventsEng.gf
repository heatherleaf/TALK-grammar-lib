--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

concrete BookingEventsEng of BookingEvents = 
    open Prelude, CatEng, GodisLangEng in {

lincat Event = NP;

lin

anevent = sing_NP (["EVENT"]);

{-
meeting = sing_NP (variants { ["a meeting"] ; ["the meeting"]});
movie = sing_NP (variants {["a movie"] ; ["the movie"]});
-}
}
