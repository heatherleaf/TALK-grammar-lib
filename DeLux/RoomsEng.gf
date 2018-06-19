--# -path=.:../Common:prelude:alltenses

concrete RoomsEng of Rooms = 
    open CatEng, ParadigmsEng in {

lincat Room = N;

lin

Livingroom = compoundN "living" (regN "room");
Bedroom    = regN "bedroom";
Hall       = regN "hall";
Kitchen    = regN "kitchen";

}
