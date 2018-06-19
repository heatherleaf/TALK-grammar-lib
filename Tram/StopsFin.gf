--# -path=.:../Common:prelude:present

concrete StopsFin of Stops = open Prelude, CatFin, ParadigmsFin in {

lincat Stop = NP;

lin
Angered = strNP ["angeredia"];
AxelDahlstromsTorg = strNP ["axel_dahlströms_torgia"];
Bergsjon = strNP ["bergsjönia"];
Biskopsgarden = strNP ["biskopsgardenia"];
Botaniska = nounNP (nTalo ["botaniska"]);
Broplatsen =  strNP ["broplatsenia"];
Brunnsbotorget = strNP ["brunnsbotorgetia"];
Brunnsparken = strNP ["brunnsparkenia"];
Centralstationen = strNP ["centralstationenia"];
Chalmers = strNP ["chalmersia"];
Eriksberg = strNP ["eriksbergia"];
Frihamnen = strNP ["frihamnenia"];
FrolundaTorg = strNP ["frölunda_torgia"];
Gamlestadstorget = strNP ["gamlestadstorgetia"];
Gronsakstorget = strNP ["grönsakstorgetia"];
Guldheden = strNP ["guldhedenia"];
Hagakyrkan = strNP ["hagakyrkania"];
Harlanda = nounNP (nTalo ["härlanda"]);
Hinnebacksgatan = strNP ["hinnebäcksgatania"];
HjBrantingsplatsen = strNP ["hjalmar_brantingsplatsenia"];
Jarntorget = strNP ["järntorgetia"];
Kalleback = strNP ["kallebäckia"];
Karralundsgatan = strNP ["kärralundsgatania"];
Klareberg = strNP ["klarebergia"]; --- ä
Klippan = strNP ["klippania"];
Korkarlensgata = 
  nounNP (nKukko ["körkarlens_gata"]["körkarlens_gatan"]["körkarlens_gatoja"]);
Korsvagen = strNP ["korsvägenia"];
Kortedala = nounNP (nTalo ["kortedala"]) ;
Kungssten = strNP ["kungsstenia"];
Lansmansgarden = strNP ["länsmansgardenia"];
LillaBommen = strNP ["lilla_bommenia"];
Lindholmen = strNP ["lindholmenia"];
Linneplatsen = strNP ["linnéplatsenia"];
LundbyStrand = strNP ["lundby_strandia"];
Mariaplan = strNP ["mariaplania"];
Marklandsgatan = strNP ["marklandsgatania"];
Nordstan = strNP ["nordstania"];
Olivedalsgatan = strNP ["olivedalsgatania"];
Olskrokstorget = strNP ["olskrokstorgetia"];
OstraSjukhuset = strNP ["östra_sjukhusetia"];
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
