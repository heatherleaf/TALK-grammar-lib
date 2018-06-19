--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingTimesSwe of BookingTimes = 
    open Prelude, CatSwe, GodisLangSwe in {

lincat Time = NP;
lincat Time_Ref = NP;
lincat Time_Of_Day = NP;

lin 

atime = sing_NP ["TIME"];

that_time = sing_NP (variants {["den tiden"]});

am = sing_NP (variants {["p� f�rmiddagen"];
                        ["f�rmiddagen"];
                        ["p� morgonen"];
                        ["morgon"];
                        ["f�re lunch"];
                        ["f�rmiddag"];
                        ["morgon"]});

pm = sing_NP (variants {["p� eftermiddagen"];
                        ["eftermiddagen"];
                        ["p� kv�llen"];
                        ["kv�llen"];
                        ["kv�ll"];
                        ["eftermiddag"]});

{-

one = sing_NP ["ett"];
one_thirty = sing_NP ["halv tv�"];
two = sing_NP ["tv�"];
two_thirty = sing_NP ["halv tre"];
three = sing_NP ["tre"];
three_thirty = sing_NP ["halv fyra"];
four = sing_NP ["fyra"];
four_thirty = sing_NP ["halv fem"];
five = sing_NP ["fem"];
five_thirty = sing_NP ["halv sex"];
six = sing_NP ["sex"];
six_thirty = sing_NP ["halv sju"];
seven = sing_NP ["sju"];
seven_thirty = sing_NP ["halv �tta"];
eight = sing_NP ["�tta"];
eight_thirty = sing_NP ["halv nio"];
nine = sing_NP ["nio"];
nine_thirty = sing_NP ["halv tio"];
ten = sing_NP ["tio"];
ten_thirty = sing_NP ["halv elva"];
eleven = sing_NP ["elva"];
eleven_thirty = sing_NP ["halv tolv"];
twelve = sing_NP ["tolv"];
twelve_thirty = sing_NP ["halv ett"];
thirteen = sing_NP ["tretton"];
thirteen_thirty = sing_NP ["tretton trettio"];
fourteen = sing_NP ["fjorton"];
fourteen_thirty = sing_NP ["fjorton trettio"];
fifteen = sing_NP ["femton"];
fifteen_thirty = sing_NP ["femton trettio"];
sixteen = sing_NP ["sexton"];
sixteen_thirty = sing_NP ["sexton trettio"];
seventeen = sing_NP ["sjutton"];
seventeen_thirty = sing_NP ["sjutton trettio"];
eighteen = sing_NP ["arton"];
eighteen_thirty = sing_NP ["arton trettio"];
nineteen = sing_NP ["nitton"];
nineteen_thirty = sing_NP ["nitton trettio"];
twenty = sing_NP ["tjugo"];
twenty_thirty = sing_NP ["tjugo trettio"];
twentyone = sing_NP ["tjugoett"];
twentyone_thirty = sing_NP ["tjugoett trettio"];
twentytwo = sing_NP ["tjugotv�"];
twentytwo_thirty = sing_NP ["tjugotv� trettio"];
twentythree = sing_NP ["tjugotre"];
twentythree_thirty = sing_NP ["tjugotre trettio"];
twentyfour = sing_NP ["tjugofyra"];
twentyfour_thirty = sing_NP ["halv ett"];

-}

}

