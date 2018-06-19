--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

concrete TramGodisDataSem of TramGodisData = 
    open Prolog in {


-- Sorts and Individuals
lincat Place = PStr;
lincat Street = PStr;
lin ceresgatan  = (pp0 ["ceresgatan"]);
lincat Number = PStr;
lincat Time = PStr;
lincat Route = PStr;
lin oneLeg  = pList1;
lin mkRoute  = pBrackets;
lincat Date = PStr;
lincat Line = PStr;
lincat LegList = PStr;
lin BaseLeg  = pSeq;
lin ConsLeg  = pSeq;
lincat BusLine = PStr;
lin bus_16  = (pp0 ["bus_16"]);
lin bus_60  = (pp0 ["bus_60"]);
lincat City = PStr;
lin lerum  = (pp0 ["lerum"]);
lin partille  = (pp0 ["partille"]);
lin kungalv  = (pp0 ["kungalv"]);
lin alingsas  = (pp0 ["alingsas"]);
lin goteborg  = (pp0 ["goteborg"]);
lin kungsbacka  = (pp0 ["kungsbacka"]);
lin molndal  = (pp0 ["molndal"]);
lincat Leg = PStr;
lin leg  = (pp3 ["leg"]);
lincat TramLine = PStr;
lin tram_4  = (pp0 ["tram_4"]);
lin tram_5  = (pp0 ["tram_5"]);
lincat Stop = PStr;
lin hogenskildsgatan  = (pp0 ["hogenskildsgatan"]);
lin lilla_bommen  = (pp0 ["lilla_bommen"]);
lin brunnsparken  = (pp0 ["brunnsparken"]);
lin rosenlund  = (pp0 ["rosenlund"]);
lin korsvagen  = (pp0 ["korsvagen"]);
lin valand  = (pp0 ["valand"]);
lin klippan  = (pp0 ["klippan"]);
lin lindholmen  = (pp0 ["lindholmen"]);
lin kungsportsplatsen  = (pp0 ["kungsportsplatsen"]);
lincat FerryLine = PStr;
lin alvsnabben_ferry  = (pp0 ["alvsnabben_ferry"]);
lincat Location = PStr;
lincat Area = PStr;
lin majorna  = (pp0 ["majorna"]);
lin skargarden  = (pp0 ["skargarden"]);
lin centrum  = (pp0 ["centrum"]);
lin hisingen  = (pp0 ["hisingen"]);
}
