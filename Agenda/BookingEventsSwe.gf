--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingEventsSwe of BookingEvents = 
    open Prelude, CatSwe, GodisLangSwe in {

lincat Event = NP;

lin 

anevent = sing_NP (["EVENT"]);

-- Obs, �ndra till substantiv sen... bara test. 
{-
meeting = sing_NP (variants {["m�te"] ; ["ett m�te"] ; ["m�tet"]});
movie = sing_NP (variants {["bio"] ; ["ett biobes�k"] ; ["en bio"] ; ["biobes�ket"] ; ["bion"]});
-}

}
