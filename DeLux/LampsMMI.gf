
incomplete concrete LampsMMI of Lamps =
    open Lamps, (Sem=LampsSem), (MM=GodisMM), Cat in {

lincat Lamp = MM.Semantics ** N; 
lincat DimmerValue = MM.Semantics ** N;

lin

CeilingLamp = CeilingLamp ** MM.sem (Sem.CeilingLamp);
DesktopLamp = DesktopLamp ** MM.sem (Sem.DesktopLamp);
FloorLamp = FloorLamp ** MM.sem (Sem.FloorLamp);

DV25 = DV25 ** MM.sem (Sem.DV25);
DV50 = DV50 ** MM.sem (Sem.DV50);
DV75 = DV75 ** MM.sem (Sem.DV75);

}
