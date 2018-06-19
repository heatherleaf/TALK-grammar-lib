--# -path=.:../Common:prelude:alltenses

concrete LampsSwe of Lamps = 
    open CatSwe, ParadigmsSwe in {

lincat Lamp = N; DimmerValue = N;

lin

CeilingLamp = regGenN "taklampa" utrum;
DesktopLamp = regGenN "skrivbordslampa" utrum;
FloorLamp   = regGenN "golvlampa" utrum;

DV25 = variants{};
DV50 = variants{};
DV75 = variants{};

}

