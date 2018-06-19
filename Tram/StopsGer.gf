--# -path=.:../Common:prelude:present

concrete StopsGer of Stops = open Prelude, GrammarGer, ParadigmsGer in {

lincat Stop = NP;

lin

Angered = stp ["angered"];
AxelDahlstromsTorg = stp ["axel dahlströms torg"];
Bergsjon = stp ["bergsjön"];
Biskopsgarden = stp ["biskopsgarden"];
Botaniska = stp ["botaniska"];
Broplatsen =  stp ["broplatsen"];
Brunnsbotorget = stp ["brunnsbotorget"];
Brunnsparken = stp ["brunnsparken"];
Centralstationen = stp ["centralstationen"];
Chalmers = stp ["chalmers"];
Eriksberg = stp ["eriksberg"];
Frihamnen = stp ["frihamnen"];
FrolundaTorg = stp ["frölunda torg"];
Gamlestadstorget = stp ["gamlestadstorget"];
Gronsakstorget = stp ["grönsakstorget"];
Guldheden = stp ["guldheden"];
Hagakyrkan = stp ["hagakyrkan"];
Harlanda = stp ["härlanda"];
Hinnebacksgatan = stp ["hinnebäcksgatan"];
HjBrantingsplatsen = stp ["hjalmar brantingsplatsen"];
Jarntorget = stp ["järntorget"];
Kalleback = stp ["kallebäck"];
Karralundsgatan = stp ["kärralundsgatan"];
Klareberg = stp ["klareberg"];
Klippan = stp ["klippan"];
Korkarlensgata = stp ["körkarlens gata"];
Korsvagen = stp ["korsvägen"];
Kortedala = stp ["kortedala"];
Kungssten = stp ["kungssten"];
Lansmansgarden = stp ["länsmansgarden"];
LillaBommen = stp ["lilla bommen"];
Lindholmen = stp ["lindholmen"];
Linneplatsen = stp ["linneplatsen"];
LundbyStrand = stp ["lundby strand"];
Mariaplan = stp ["mariaplan"];
Marklandsgatan = stp ["marklandsgatan"];
Nordstan = stp ["nordstan"];
Olivedalsgatan = stp ["olivedalsgatan"];
Olskrokstorget = stp ["olskrokstorget"];
OstraSjukhuset = stp ["östra sjukhuset"];
Pilbagsgatan = stp  ["pilbagsgatan"];
Redbergsplatsen = stp ["redbergsplatsen"];
Rosenlund = stp ["rosenlund"];
Sahlgrenska = stp ["sahlgrenska"];
Saltholmen = stp ["saltholmen"];
SanktSigfridsplan = stp ["sankt sigfrids plan"];
Sannaplan = stp ["sannaplan"];
Skogome = stp ["skogome"];
Solrosgatan = stp ["solrosgatan"];
Sorgardsskolan = stp ["sörgardsskolan"];
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

