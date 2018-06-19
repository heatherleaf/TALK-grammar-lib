--# -path=.:../Common:prelude:present

concrete LinesEng of Lines = open Prelude, CatEng, MorphoEng in {

lincat Line = NP;

lin
Tram1 = line ["tram number 1"];
Tram2 = line ["tram number 2"];
Tram3 = line ["tram number 3"];
Tram4 = line ["tram number 4"];
Tram5 = line ["tram number 5"];
Tram6 = line ["tram number 6"];
Tram7 = line ["tram number 7"];
Tram8 = line ["tram number 8"];
Tram9 = line ["tram number 9"];

Bus34 = line ["bus number 34"];
Bus40 = line ["bus number 40"];
Bus51 = line ["bus number 51"];
Bus60 = line ["bus number 60"];
Bus62 = line ["bus number 62"];

Alvsnabben = line ["the alvsnabben ferry"];

oper
line : Str -> NP = \s -> regNP s Sg ** {lock_NP = <>};

}
