--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

concrete BookingEng of Booking = BookingTimesEng, BookingEventsEng, BookingDatesEng ** open Prelude, CatEng, GodisLangEng in {


lincat Language = NP;
lincat General_Ref = NP;


lin

english = sing_NP ["english"];
swedish = sing_NP ["swedish"];

ref = sing_NP (variants {["it"];["that"]});


}