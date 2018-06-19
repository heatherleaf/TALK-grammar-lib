--# -path=.:../Common:prelude:present

concrete LinesFre of Lines = open Prelude, CatFre, ParadigmsFre in {

lincat Line = NP;

lin

Tram1 = line ["tram numéro 1"];
Tram2 = line ["tram numéro 2"];
Tram3 = line ["tram numéro 3"];
Tram4 = line ["tram numéro 4"];
Tram5 = line ["tram numéro 5"];
Tram6 = line ["tram numéro 6"];
Tram7 = line ["tram numéro 7"];
Tram8 = line ["tram numéro 8"];
Tram9 = line ["tram numéro 9"];

Bus34 = line ["bus numéro 34"];
Bus40 = line ["bus numéro 40"];
Bus51 = line ["bus numéro 51"];
Bus60 = line ["bus numéro 60"];
Bus62 = line ["bus numéro 62"];

Alvsnabben = line ["le bateau alvsnabben"];

oper

line : Str -> NP = \s ->
    mkNP s masculine singular;

}
