--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingSwe of Booking = BookingTimesSwe, BookingEventsSwe, BookingDatesSwe ** open Prelude, CatSwe, GodisLangSwe in{

lincat Language = NP;
lincat General_Ref = NP;

lin

english = sing_NP ["engelska"];
swedish = sing_NP ["svenska"];

ref = sing_NP (variants {["den"];["det"]});

}
