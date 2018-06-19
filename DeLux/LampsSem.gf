--# -path=.:../Common:prelude

concrete LampsSem of Lamps = open Prolog in {

lincat Lamp = PStr; DimmerValue = PStr;

lin
CeilingLamp = pp0 ["ceiling_lamp"];
DesktopLamp = pp0 ["desktop_lamp"];
FloorLamp = pp0 ["floor_lamp"];

DV25 = pp0 "25";
DV50 = pp0 "50";
DV75 = pp0 "75";

}
