--# -path=.:../Common:prelude:present

concrete StopsGer of Stops = open Prelude, GrammarGer, ParadigmsGer in {

lincat Stop = NP;

lin

Angered = stp ["angered"];
AxelDahlstromsTorg = stp ["axel dahlstr�ms torg"];
Bergsjon = stp ["bergsj�n"];
Biskopsgarden = stp ["biskopsgarden"];
Botaniska = stp ["botaniska"];
Broplatsen =  stp ["broplatsen"];
Brunnsbotorget = stp ["brunnsbotorget"];
Brunnsparken = stp ["brunnsparken"];
Centralstationen = stp ["centralstationen"];
Chalmers = stp ["chalmers"];
Eriksberg = stp ["eriksberg"];
Frihamnen = stp ["frihamnen"];
FrolundaTorg = stp ["fr�lunda torg"];
Gamlestadstorget = stp ["gamlestadstorget"];
Gronsakstorget = stp ["gr�nsakstorget"];
Guldheden = stp ["guldheden"];
Hagakyrkan = stp ["hagakyrkan"];
Harlanda = stp ["h�rlanda"];
Hinnebacksgatan = stp ["hinneb�cksgatan"];
HjBrantingsplatsen = stp ["hjalmar brantingsplatsen"];
Jarntorget = stp ["j�rntorget"];
Kalleback = stp ["kalleb�ck"];
Karralundsgatan = stp ["k�rralundsgatan"];
Klareberg = stp ["klareberg"];
Klippan = stp ["klippan"];
Korkarlensgata = stp ["k�rkarlens gata"];
Korsvagen = stp ["korsv�gen"];
Kortedala = stp ["kortedala"];
Kungssten = stp ["kungssten"];
Lansmansgarden = stp ["l�nsmansgarden"];
LillaBommen = stp ["lilla bommen"];
Lindholmen = stp ["lindholmen"];
Linneplatsen = stp ["linneplatsen"];
LundbyStrand = stp ["lundby strand"];
Mariaplan = stp ["mariaplan"];
Marklandsgatan = stp ["marklandsgatan"];
Nordstan = stp ["nordstan"];
Olivedalsgatan = stp ["olivedalsgatan"];
Olskrokstorget = stp ["olskrokstorget"];
OstraSjukhuset = stp ["�stra sjukhuset"];
Pilbagsgatan = stp  ["pilbagsgatan"];
Redbergsplatsen = stp ["redbergsplatsen"];
Rosenlund = stp ["rosenlund"];
Sahlgrenska = stp ["sahlgrenska"];
Saltholmen = stp ["saltholmen"];
SanktSigfridsplan = stp ["sankt sigfrids plan"];
Sannaplan = stp ["sannaplan"];
Skogome = stp ["skogome"];
Solrosgatan = stp ["solrosgatan"];
Sorgardsskolan = stp ["s�rgardsskolan"];
Stigbergstorget = stp ["stigbergstorget"];
Tagene = stp ["tagene"];
Torp = stp ["torp"];
Tynnered = stp ["tynnered"];
Ullevi = stp ["ullevi"];
Valand = stp ["valand"];
VasaViktoriagatan = stp ["vasa viktoriagatan"];
Vasaplatsen = stp ["vasaplatsen"];
WavrinskysPlats = stp ["wavrinskys plats"];

oper 
stp : Str -> NP = \s ->
    UsePN (mkPN s (s+"s"));


}

