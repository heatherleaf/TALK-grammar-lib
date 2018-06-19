--# -path=.:../Common:prelude:present

concrete LinesSpa of Lines = open Prelude, CatSpa, ParadigmsSpa in {

lincat Line = NP;

lin

Tram1 = line "tranv�a" "1";
Tram2 = line "tranv�a" "2";
Tram3 = line "tranv�a" "3";
Tram4 = line "tranv�a" "4";
Tram5 = line "tranv�a" "5";
Tram6 = line "tranv�a" "6";
Tram7 = line "tranv�a" "7";
Tram8 = line "tranv�a" "8";
Tram9 = line "tranv�a" "9";

Bus34 = line "bus" "34";
Bus40 = line "bus" "40";
Bus51 = line "bus" "51";
Bus60 = line "bus" "60";
Bus62 = line "bus" "62";

Alvsnabben = mkNP ["la barca alvsnabben"] masculine singular;

oper

line : Str -> Str -> NP = \s,n ->
    mkNP (s ++ "n�mero" ++ n) masculine singular;

}
