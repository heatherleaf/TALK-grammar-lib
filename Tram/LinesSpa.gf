--# -path=.:../Common:prelude:present

concrete LinesSpa of Lines = open Prelude, CatSpa, ParadigmsSpa in {

lincat Line = NP;

lin

Tram1 = line "tranvía" "1";
Tram2 = line "tranvía" "2";
Tram3 = line "tranvía" "3";
Tram4 = line "tranvía" "4";
Tram5 = line "tranvía" "5";
Tram6 = line "tranvía" "6";
Tram7 = line "tranvía" "7";
Tram8 = line "tranvía" "8";
Tram9 = line "tranvía" "9";

Bus34 = line "bus" "34";
Bus40 = line "bus" "40";
Bus51 = line "bus" "51";
Bus60 = line "bus" "60";
Bus62 = line "bus" "62";

Alvsnabben = mkNP ["la barca alvsnabben"] masculine singular;

oper

line : Str -> Str -> NP = \s,n ->
    mkNP (s ++ "número" ++ n) masculine singular;

}
