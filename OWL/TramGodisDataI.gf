--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

incomplete concrete TramGodisDataI of TramGodisData = 
    open Cat, GodisLang in {


-- Sorts and Individuals
lincat Place = NP;
lincat Street = NP;
lin ceresgatan  = (sing_NP ["ceresgatan"]);
lincat Number = NP;
lincat Time = NP;
lincat Route = NP;
lin oneLeg  = (sing_NP ["oneLeg"]);
lin mkRoute  = (sing_NP ["mkRoute"]);
lincat Date = NP;
lincat Line = NP;
lincat LegList = NP;
lin BaseLeg  = (sing_NP ["BaseLeg"]);
lin ConsLeg  = (sing_NP ["ConsLeg"]);
lincat BusLine = NP;
lin bus_16  = (sing_NP ["bus_16"]);
lin bus_60  = (sing_NP ["bus_60"]);
lincat City = NP;
lin lerum  = (sing_NP ["lerum"]);
lin partille  = (sing_NP ["partille"]);
lin kungalv  = (sing_NP ["kungalv"]);
lin alingsas  = (sing_NP ["alingsas"]);
lin goteborg  = (sing_NP ["goteborg"]);
lin kungsbacka  = (sing_NP ["kungsbacka"]);
lin molndal  = (sing_NP ["molndal"]);
lincat Leg = NP;
lin leg  = (sing_NP ["leg"]);
lincat TramLine = NP;
lin tram_4  = (sing_NP ["tram_4"]);
lin tram_5  = (sing_NP ["tram_5"]);
lincat Stop = NP;
lin hogenskildsgatan  = (sing_NP ["hogenskildsgatan"]);
lin lilla_bommen  = (sing_NP ["lilla bommen"]);
lin brunnsparken  = (sing_NP ["brunnsparken"]);
lin rosenlund  = (sing_NP ["rosenlund"]);
lin korsvagen  = (sing_NP ["korsvägen"]);
lin valand  = (sing_NP ["valand"]);
lin klippan  = (sing_NP ["klippan"]);
lin lindholmen  = (sing_NP ["lindholmen"]);
lin kungsportsplatsen  = (sing_NP ["kungsportsplatsen"]);
lincat FerryLine = NP;
lin alvsnabben_ferry  = (sing_NP ["alvsnabben_ferry"]);
lincat Location = NP;
lincat Area = NP;
lin majorna  = (sing_NP ["majorna"]);
lin skargarden  = (sing_NP ["skargarden"]);
lin centrum  = (sing_NP ["centrum"]);
lin hisingen  = (sing_NP ["hisingen"]);
}
