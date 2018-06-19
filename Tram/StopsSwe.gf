--# -path=.:../Common:prelude:present

concrete StopsSwe of Stops = open Prelude, CatSwe, MorphoSwe in {

lincat Stop = NP;

lin

Angered = sing_NP ["angered"];
AxelDahlstromsTorg = sing_NP ["axel dahlstr�ms torg"];
Bergsjon = sing_NP ["bergsj�n"];
Biskopsgarden = sing_NP ["biskopsg�rden"];
Botaniska = sing_NP ["botaniska"];
Broplatsen =  sing_NP ["broplatsen"];
Brunnsbotorget = sing_NP ["brunnsbotorget"];
Brunnsparken = sing_NP ["brunnsparken"];
Centralstationen = sing_NP ["centralstationen"];
Chalmers = sing_NP ["chalmers"];
Eriksberg = sing_NP ["eriksberg"];
Frihamnen = sing_NP ["frihamnen"];
FrolundaTorg = sing_NP ["fr�lunda torg"];
Gamlestadstorget = sing_NP ["gamlestadstorget"];
Gronsakstorget = sing_NP ["gr�nsakstorget"];
Guldheden = sing_NP ["guldheden"];
Hagakyrkan = sing_NP ["hagakyrkan"];
Harlanda = sing_NP ["h�rlanda"];
Hinnebacksgatan = sing_NP ["hinneb�cksgatan"];
HjBrantingsplatsen = sing_NP ["hjalmar brantingsplatsen"];
Jarntorget = sing_NP ["j�rntorget"];
Kalleback = sing_NP ["kalleb�ck"];
Karralundsgatan = sing_NP ["k�rralundsgatan"];
Klareberg = sing_NP ["klareberg"];
Klippan = sing_NP ["klippan"];
Korkarlensgata = sing_NP ["k�rkarlens gata"];
Korsvagen = sing_NP ["korsv�gen"];
Kortedala = sing_NP ["kortedala"];
Kungssten = sing_NP ["kungssten"];
Lansmansgarden = sing_NP ["l�nsmansg�rden"];
LillaBommen = sing_NP ["lilla bommen"];
Lindholmen = sing_NP ["lindholmen"];
Linneplatsen = sing_NP ["linneplatsen"];
LundbyStrand = sing_NP ["lundby strand"];
Mariaplan = sing_NP ["mariaplan"];
Marklandsgatan = sing_NP ["marklandsgatan"];
Nordstan = sing_NP ["nordstan"];
Olivedalsgatan = sing_NP ["olivedalsgatan"];
Olskrokstorget = sing_NP ["olskrokstorget"];
OstraSjukhuset = sing_NP ["�stra sjukhuset"];
Pilbagsgatan = sing_NP  ["pilb�gsgatan"];
Redbergsplatsen = sing_NP ["redbergsplatsen"];
Rosenlund = sing_NP ["rosenlund"];
Sahlgrenska = sing_NP ["sahlgrenska"];
Saltholmen = sing_NP ["saltholmen"];
SanktSigfridsplan = sing_NP ["sankt sigfrids plan"];
Sannaplan = sing_NP ["sannaplan"];
Skogome = sing_NP ["skogome"];
Solrosgatan = sing_NP ["solrosgatan"];
Sorgardsskolan = sing_NP ["s�rg�rdsskolan"];
Stigbergstorget = sing_NP ["stigbergstorget"];
Tagene = sing_NP ["tagene"];
Torp = sing_NP ["torp"];
Tynnered = sing_NP ["tynnered"];
Ullevi = sing_NP ["ullevi"];
Valand = sing_NP ["valand"];
VasaViktoriagatan = sing_NP ["vasa viktoriagatan"];
Vasaplatsen = sing_NP ["vasaplatsen"];
WavrinskysPlats = sing_NP ["wavrinskys plats"];

oper

sing_NP : Str -> NP = \s -> regNP s (s+"s") SgUtr ** {lock_NP = <>};

}

