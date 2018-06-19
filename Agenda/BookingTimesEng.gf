--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

concrete BookingTimesEng of BookingTimes = 
    open Prelude, CatEng, GodisLangEng in {

lincat Time = NP;
lincat Time_Ref = NP;
lincat Time_Of_Day = NP;

lin

atime = sing_NP ["TIME"];


that_time = sing_NP (variants {["that time"]});

am = sing_NP (variants {["in the morning"];["the morning"];["morning"];["before lunch"];["a m"]});
pm = sing_NP (variants {["in the afternoon"];["the afternoon"];["afternoon"];["after lunch"];["in the evening"];["evening"];["the evening"];["night"];["at night"];["p m"]});


{-
one = sing_NP (variants {(optStr "at" ++ ["one"] ++ optStr "oclock")});
one_thirty = sing_NP (variants {(optStr "at" ++ ["one thirty"] ++ optStr "oclock")});
two = sing_NP (variants {(optStr "at" ++ ["two"] ++ optStr "oclock")});
two_thirty = sing_NP (variants {(optStr "at" ++ ["two thirty"] ++ optStr "oclock")});
three = sing_NP (variants {(optStr "at" ++ ["three"] ++ optStr "oclock")});
three_thirty = sing_NP (variants {(optStr "at" ++ ["three thirty"] ++ optStr "oclock")});
four = sing_NP (variants {(optStr "at" ++ ["four"] ++ optStr "oclock")});
four_thirty = sing_NP (variants {(optStr "at" ++ ["four thirty"] ++ optStr "oclock")});
five = sing_NP (variants {(optStr "at" ++ ["five"] ++ optStr "oclock")});
five_thirty = sing_NP (variants {(optStr "at" ++ ["five thirty"] ++ optStr "oclock")});
six = sing_NP (variants {(optStr "at" ++ ["six"] ++ optStr "oclock")});
six_thirty = sing_NP (variants {(optStr "at" ++ ["six thirty"] ++ optStr "oclock")});
seven = sing_NP (variants {(optStr "at" ++ ["seven"] ++ optStr "oclock")});
seven_thirty = sing_NP (variants {(optStr "at" ++ ["seven thirty"] ++ optStr "oclock")});
eight = sing_NP (variants {(optStr "at" ++ ["eight"] ++ optStr "oclock")});
eight_thirty = sing_NP (variants {(optStr "at" ++ ["eight thirty"] ++ optStr "oclock")});
nine = sing_NP (variants {(optStr "at" ++ ["nine"] ++ optStr "oclock")});
nine_thirty = sing_NP (variants {(optStr "at" ++ ["nine thirty"] ++ optStr "oclock")});
ten = sing_NP (variants {(optStr "at" ++ ["ten"] ++ optStr "oclock")});
ten_thirty = sing_NP (variants {(optStr "at" ++ ["ten thirty"] ++ optStr "oclock")});
eleven = sing_NP (variants {(optStr "at" ++ ["eleven"] ++ optStr "oclock")});
eleven_thirty = sing_NP (variants {(optStr "at" ++ ["eleven thirty"] ++ optStr "oclock")});
twelve = sing_NP (variants {(optStr "at" ++ ["twelve"] ++ optStr "oclock")});
twelve_thirty = sing_NP (variants {(optStr "at" ++ ["twelve thirty"] ++ optStr "oclock")});
thirteen = sing_NP (variants {(optStr "at" ++ ["thirteen"] ++ optStr "oclock")});
thirteen_thirty = sing_NP (variants {(optStr "at" ++ ["thirteen thirty"] ++ optStr "oclock")});
fourteen = sing_NP (variants {(optStr "at" ++ ["fourteen"] ++ optStr "oclock")});
fourteen_thirty = sing_NP (variants {(optStr "at" ++ ["fourteen thirty"] ++ optStr "oclock")});
fifteen = sing_NP (variants {(optStr "at" ++ ["fifteen"] ++ optStr "oclock")});
fifteen_thirty = sing_NP (variants {(optStr "at" ++ ["fifteen thirty"] ++ optStr "oclock")});
sixteen = sing_NP (variants {(optStr "at" ++ ["sixteen"] ++ optStr "oclock")});
sixteen_thirty = sing_NP (variants {(optStr "at" ++ ["sixteen thirty"] ++ optStr "oclock")});
seventeen = sing_NP (variants {(optStr "at" ++ ["seventeen"] ++ optStr "oclock")});
seventeen_thirty = sing_NP (variants {(optStr "at" ++ ["seventeen thirty"] ++ optStr "oclock")});
eighteen = sing_NP (variants {(optStr "at" ++ ["eighteen"] ++ optStr "oclock")});
eighteen_thirty = sing_NP (variants {(optStr "at" ++ ["eighteen thirty"] ++ optStr "oclock")});
nineteen = sing_NP (variants {(optStr "at" ++ ["ninteen"] ++ optStr "oclock")});
nineteen_thirty = sing_NP (variants {(optStr "at" ++ ["nineteen thirty"] ++ optStr "oclock")});
twenty = sing_NP (variants {(optStr "at" ++ ["twenty"] ++ optStr "oclock")});
twenty_thirty = sing_NP (variants {(optStr "at" ++ ["twenty thirty"] ++ optStr "oclock")});
twentyone = sing_NP (variants {(optStr "at" ++ ["twentyone"] ++ optStr "oclock")});
twentyone_thirty = sing_NP (variants {(optStr "at" ++ ["twentyone thirty"] ++ optStr "oclock")});
twentytwo = sing_NP (variants {(optStr "at" ++ ["twentytwo"] ++ optStr "oclock")});
twentytwo_thirty = sing_NP (variants {(optStr "at" ++ ["twentytwo thirty"] ++ optStr "oclock")});
twentythree = sing_NP (variants {(optStr "at" ++ ["twentytree"] ++ optStr "oclock")});
twentythree_thirty = sing_NP (variants {(optStr "at" ++ ["twentythree thirty"] ++ optStr "oclock")}); 
twentyfour = sing_NP (variants {(optStr "at" ++ ["twentyfour"] ++ optStr "oclock")});
twentyfour_thirty = sing_NP (variants {(optStr "at" ++ ["twentyfour thirty"] ++ optStr "oclock")});
-}


}


