--# -path=.:../Common:prelude:present

concrete LinesFre of Lines = open Prelude, CatFre, ParadigmsFre in {

lincat Line = NP;

lin

Tram1 = line ["tram num�ro 1"];
Tram2 = line ["tram num�ro 2"];
Tram3 = line ["tram num�ro 3"];
Tram4 = line ["tram num�ro 4"];
Tram5 = line ["tram num�ro 5"];
Tram6 = line ["tram num�ro 6"];
Tram7 = line ["tram num�ro 7"];
Tram8 = line ["tram num�ro 8"];
Tram9 = line ["tram num�ro 9"];

Bus34 = line ["bus num�ro 34"];
Bus40 = line ["bus num�ro 40"];
Bus51 = line ["bus num�ro 51"];
Bus60 = line ["bus num�ro 60"];
Bus62 = line ["bus num�ro 62"];

Alvsnabben = line ["le bateau alvsnabben"];

oper

line : Str -> NP = \s ->
    mkNP s masculine singular;

}
