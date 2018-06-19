--# -path=.:../Common:prelude

concrete BookingSem of Booking = BookingTimesSem, BookingEventsSem, BookingDatesSem ** open Prolog in {


lincat Language = PStr;
lincat General_Ref = PStr;

lin 

english = pp0 "english";
swedish = pp0 "swedish";

ref = pp0 "X^ref(X)";

}
