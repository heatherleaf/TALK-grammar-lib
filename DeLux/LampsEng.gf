--# -path=.:../Common:prelude:alltenses

concrete LampsEng of Lamps = 
    open DeluxLexiconEng, CatEng, ParadigmsEng in {

lincat Lamp = N; DimmerValue = N;

lin

CeilingLamp = compoundN "ceiling" lamp_N;
DesktopLamp = compoundN "desktop" lamp_N;
FloorLamp   = compoundN "floor"   lamp_N;

DV25 = variants{};
DV50 = variants{};
DV75 = variants{};

}
