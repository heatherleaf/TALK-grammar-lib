--# -path=.:../Common:prelude:present

concrete LinesSwe of Lines = open Prelude, CatSwe, MorphoSwe in {

lincat Line = NP;

lin
Tram1 = vagnbuss "sp�rvagn" "1";
Tram2 = vagnbuss "sp�rvagn" "2";
Tram3 = vagnbuss "sp�rvagn" "3";
Tram4 = vagnbuss "sp�rvagn" "4";
Tram5 = vagnbuss "sp�rvagn" "5";
Tram6 = vagnbuss "sp�rvagn" "6";
Tram7 = vagnbuss "sp�rvagn" "7";
Tram8 = vagnbuss "sp�rvagn" "8";
Tram9 = vagnbuss "sp�rvagn" "9";

Bus34 = vagnbuss "buss" "34";
Bus40 = vagnbuss "buss" "40";
Bus51 = vagnbuss "buss" "51";
Bus60 = vagnbuss "buss" "60";
Bus62 = vagnbuss "buss" "62";

Alvsnabben = regNP "�lvsnabben" "�lvsnabbens" SgUtr ** {lock_NP=<>};

oper
vagnbuss : Str -> Str -> NP = \s,nr ->
    regNP (s ++ "nummer" ++ nr) (s ++ "nummer" ++ (nr + ":s")) SgUtr ** {lock_NP=<>};

}

