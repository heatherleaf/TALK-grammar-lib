--# -path=.:../Common:prelude:present

concrete StopsFre of Stops = open Prelude, CatFre, ParadigmsFre in {

lincat Stop = NP;

lin

Angered = stp ["angered"];
AxelDahlstromsTorg = stp ["axel dahlstroms torg"];
Bergsjon = stp ["bergsjon"];
Biskopsgarden = stp ["biskopsgarden"];
Botaniska = stp ["botaniska"];
Broplatsen =  stp ["broplatsen"];
Brunnsbotorget = stp ["brunnsbotorget"];
Brunnsparken = stp ["brunnsparken"];
Centralstationen = stp ["centralstationen"];
Chalmers = stp ["chalmers"];
Eriksberg = stp ["eriksberg"];
Frihamnen = stp ["frihamnen"];
FrolundaTorg = stp ["frolunda torg"];
Gamlestadstorget = stp ["gamlestadstorget"];
Gronsakstorget = stp ["gronsakstorget"];
Guldheden = stp ["guldheden"];
Hagakyrkan = stp ["hagakyrkan"];
Harlanda = stp ["harlanda"];
Hinnebacksgatan = stp ["hinnebacksgatan"];
HjBrantingsplatsen = stp ["hjalmar brantingsplatsen"];
Jarntorget = stp ["jarntorget"];
Kalleback = stp ["kalleback"];
Karralundsgatan = stp ["karralundsgatan"];
Klareberg = stp ["klareberg"];
Klippan = stp ["klippan"];
Korkarlensgata = stp ["korkarlens gata"];
Korsvagen = stp ["korsvagen"];
Kortedala = stp ["kortedala"];
Kungssten = stp ["kungssten"];
Lansmansgarden = stp ["lansmansgarden"];
LillaBommen = stp ["lilla bommen"];
Lindholmen = stp ["lindholmen"];
Linneplatsen = stp ["linneplatsen"];
LundbyStrand = stp ["lundby strand"];
Mariaplan = stp ["mariaplan"];
Marklandsgatan = stp ["marklandsgatan"];
Nordstan = stp ["nordstan"];
Olivedalsgatan = stp ["olivedalsgatan"];
Olskrokstorget = stp ["olskrokstorget"];
OstraSjukhuset = stp ["ostra sjukhuset"];
Pilbagsgatan = stp  ["pilbagsgatan"];
Redbergsplatsen = stp ["redbergsplatsen"];
Rosenlund = stp ["rosenlund"];
Sahlgrenska = stp ["sahlgrenska"];
Saltholmen = stp ["saltholmen"];
SanktSigfridsplan = stp ["sankt sigfrids plan"];
Sannaplan = stp ["sannaplan"];
Skogome = stp ["skogome"];
Solrosgatan = stp ["solrosgatan"];
Sorgardsskolan = stp ["sorgardsskolan"];
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
    mkNP s masculine singular;

}
