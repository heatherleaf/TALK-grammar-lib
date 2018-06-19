--# -path=.:../Common:prelude:present

concrete LinesSwe of Lines = open Prelude, CatSwe, MorphoSwe in {

lincat Line = NP;

lin
Tram1 = vagnbuss "spårvagn" "1";
Tram2 = vagnbuss "spårvagn" "2";
Tram3 = vagnbuss "spårvagn" "3";
Tram4 = vagnbuss "spårvagn" "4";
Tram5 = vagnbuss "spårvagn" "5";
Tram6 = vagnbuss "spårvagn" "6";
Tram7 = vagnbuss "spårvagn" "7";
Tram8 = vagnbuss "spårvagn" "8";
Tram9 = vagnbuss "spårvagn" "9";

Bus34 = vagnbuss "buss" "34";
Bus40 = vagnbuss "buss" "40";
Bus51 = vagnbuss "buss" "51";
Bus60 = vagnbuss "buss" "60";
Bus62 = vagnbuss "buss" "62";

Alvsnabben = regNP "älvsnabben" "älvsnabbens" SgUtr ** {lock_NP=<>};

oper
vagnbuss : Str -> Str -> NP = \s,nr ->
    regNP (s ++ "nummer" ++ nr) (s ++ "nummer" ++ (nr + ":s")) SgUtr ** {lock_NP=<>};

}

