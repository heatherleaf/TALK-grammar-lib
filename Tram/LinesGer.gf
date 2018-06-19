--# -path=.:../Common:prelude:present

concrete LinesGer of Lines = 
  open Prelude, CatGer, ResGer, GrammarGer, ParadigmsGer, SymbolGer, GodisResource in {

lincat Line = NP;

lin

Tram1 = bahn "1";
Tram2 = bahn "2";
Tram3 = bahn "3";
Tram4 = bahn "4";
Tram5 = bahn "5";
Tram6 = bahn "6";
Tram7 = bahn "7";
Tram8 = bahn "8";
Tram9 = bahn "9";

Bus34 = buss "34";
Bus40 = buss "40";
Bus51 = buss "51";
Bus60 = buss "60";
Bus62 = buss "62";

Alvsnabben = UsePN (mkPN ["Älvsnabben"] ["Älvsnabbens"]);

---
oper
 
buss : Str -> NP = \s -> def_NP (regN "Buss") (regN "Nummer") s;
bahn : Str -> NP = \s -> def_NP (reg2N "Straßenbahn" "Straßenbahnen" feminine) (regN "Nummer") s;

def_NP : N -> N -> Str -> NP = \bus,no,n ->
    DetCN (DetSg (SgQuant DefArt) NoOrd) 
    (ApposCN (UseN bus) (CNIntNP (UseN no) (int n)));

}

