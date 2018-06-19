--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingEventsSwe of BookingEvents = 
    open Prelude, CatSwe, GodisLangSwe in {

lincat Event = NP;

lin 

anevent = sing_NP (["EVENT"]);

-- Obs, ändra till substantiv sen... bara test. 
{-
meeting = sing_NP (variants {["möte"] ; ["ett möte"] ; ["mötet"]});
movie = sing_NP (variants {["bio"] ; ["ett biobesök"] ; ["en bio"] ; ["biobesöket"] ; ["bion"]});
-}

}
