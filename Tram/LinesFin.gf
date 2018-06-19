--# -path=.:../Common:prelude:present

concrete LinesFin of Lines = open Prelude, CatFin, ParadigmsFin, ResFin in {

lincat Line = NP;

lin
Tram1 = ratikka "1" ;
Tram2 = ratikka "2";
Tram3 = ratikka "3";
Tram4 = ratikka "4";
Tram5 = ratikka "5";
Tram6 = ratikka "6";
Tram7 = ratikka "7";
Tram8 = ratikka "8";
Tram9 = ratikka "9";

Bus34 = bussi "34";
Bus40 = bussi "40";
Bus51 = bussi "51";
Bus60 = bussi "60";
Bus62 = bussi "62";

Alvsnabben = mkNP (regN "älvsnabben-lautta") singular ;

oper

ratikka : Str -> NP = \s -> ratikka_bussi (regN "ratikka") s ;
bussi : Str -> NP = \s -> ratikka_bussi (regN "bussi") s ;

ratikka_bussi : N -> Str -> NP = \n,str ->
    { s = \\c => n.s ! NCase Sg (npform2case Sg c) ++ str ;
      a = agrP3 Sg ;
      isPron = False
    } ;

}
