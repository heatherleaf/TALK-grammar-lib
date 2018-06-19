--# -path=.:../Common:prelude:present

concrete StopsFin of Stops = open Prelude, CatFin, ParadigmsFin in {

lincat Stop = NP;

lin
Angered = strNP ["angeredia"];
AxelDahlstromsTorg = strNP ["axel_dahlstr�ms_torgia"];
Bergsjon = strNP ["bergsj�nia"];
Biskopsgarden = strNP ["biskopsgardenia"];
Botaniska = nounNP (nTalo ["botaniska"]);
Broplatsen =  strNP ["broplatsenia"];
Brunnsbotorget = strNP ["brunnsbotorgetia"];
Brunnsparken = strNP ["brunnsparkenia"];
Centralstationen = strNP ["centralstationenia"];
Chalmers = strNP ["chalmersia"];
Eriksberg = strNP ["eriksbergia"];
Frihamnen = strNP ["frihamnenia"];
FrolundaTorg = strNP ["fr�lunda_torgia"];
Gamlestadstorget = strNP ["gamlestadstorgetia"];
Gronsakstorget = strNP ["gr�nsakstorgetia"];
Guldheden = strNP ["guldhedenia"];
Hagakyrkan = strNP ["hagakyrkania"];
Harlanda = nounNP (nTalo ["h�rlanda"]);
Hinnebacksgatan = strNP ["hinneb�cksgatania"];
HjBrantingsplatsen = strNP ["hjalmar_brantingsplatsenia"];
Jarntorget = strNP ["j�rntorgetia"];
Kalleback = strNP ["kalleb�ckia"];
Karralundsgatan = strNP ["k�rralundsgatania"];
Klareberg = strNP ["klarebergia"]; --- �
Klippan = strNP ["klippania"];
Korkarlensgata = 
  nounNP (nKukko ["k�rkarlens_gata"]["k�rkarlens_gatan"]["k�rkarlens_gatoja"]);
Korsvagen = strNP ["korsv�genia"];
Kortedala = nounNP (nTalo ["kortedala"]) ;
Kungssten = strNP ["kungsstenia"];
Lansmansgarden = strNP ["l�nsmansgardenia"];
LillaBommen = strNP ["lilla_bommenia"];
Lindholmen = strNP ["lindholmenia"];
Linneplatsen = strNP ["linn�platsenia"];
LundbyStrand = strNP ["lundby_strandia"];
Mariaplan = strNP ["mariaplania"];
Marklandsgatan = strNP ["marklandsgatania"];
Nordstan = strNP ["nordstania"];
Olivedalsgatan = strNP ["olivedalsgatania"];
Olskrokstorget = strNP ["olskrokstorgetia"];
OstraSjukhuset = strNP ["�stra_sjukhusetia"];
Pilbagsgatan = strNP  ["pilbagsgatania"];
Redbergsplatsen = strNP ["redbergsplatsenia"];
Rosenlund = strNP ["rosenlundia"];
Sahlgrenska = nounNP (nTalo ["sahlgrenska"]);
Saltholmen = strNP ["saltholmenia"];
SanktSigfridsplan = strNP ["sankt_sigfrids_plania"];
Sannaplan = strNP ["sannaplania"];
Skogome = nounNP (nTalo ["skogome"]);
Solrosgatan = strNP ["solrosgatania"];
Sorgardsskolan = strNP ["sorgardsskolania"];
Stigbergstorget = strNP ["stigbergstorgetia"];
Tagene = nounNP (nTalo ["tagene"]);
Torp = strNP ["torpia"];
Tynnered = strNP ["tynneredia"];
Ullevi = nounNP (nTalo ["ullevi"]);
Valand = strNP ["valandia"];
VasaViktoriagatan = strNP ["vasa_viktoriagatania"];
Vasaplatsen = strNP ["vasaplatsenia"];
WavrinskysPlats = strNP ["wavrinskys_platsia"];

oper

nounNP : N -> NP = \n -> mkNP n singular;
strNP : Str -> NP = \s -> nounNP (nLinux s);

}
