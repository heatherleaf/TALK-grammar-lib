--# -path=.:../Common:prelude:present

concrete LinesIta of Lines = open Prelude, CatIta, ParadigmsIta in {

lincat Line = NP;

lin
Tram1 = line ["tram numero 1"];
Tram2 = line ["tram numero 2"];
Tram3 = line ["tram numero 3"];
Tram4 = line ["tram numero 4"];
Tram5 = line ["tram numero 5"];
Tram6 = line ["tram numero 6"];
Tram7 = line ["tram numero 7"];
Tram8 = line ["tram numero 8"];
Tram9 = line ["tram numero 9"];

Bus34 = line ["bus numero 34"];
Bus40 = line ["bus numero 40"];
Bus51 = line ["bus numero 51"];
Bus60 = line ["bus numero 60"];
Bus62 = line ["bus numero 62"];

Alvsnabben = line ["il vaporetto alvsnabben"]; ----

oper 

line : Str -> NP = \s -> mkNP s masculine singular ; ----

}
