--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/english

concrete TramGodisDataEng of TramGodisData = 
    open GrammarEng, GodisLangEng, TramGodisLexiconEng, ParamX in {


-- Conjunctions
oper
and_then_Conj : Conj = {s = ["and then"]; n = Pl; lock_Conj = <>};


-- Sorts and Individuals
lincat Place = NP;
lincat Street = NP;
lin ceresgatan  = (sing_NP ["ceresgatan"]);
lincat Number = NP;
lincat Time = NP;
lincat Route = NP;
lin oneLeg x = x;
lin mkRoute = ConjNP and_then_Conj;
lincat Date = NP;
lincat Line = NP;
lincat LegList = [NP];
lin BaseLeg  = BaseNP;
lin ConsLeg  = ConsNP;
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
lin leg  line from to = AdvNP (AdvNP line (PrepNP from_Prep from)) (PrepNP to_Prep to);
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

