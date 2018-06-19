--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

-- This file was automatically created by owl_godis.pl

abstract TramGodisData = {


-- Sorts and Individuals
cat Place;
cat Street;
fun ceresgatan : Street;
cat Number;
cat Time;
cat Route;
fun oneLeg : Leg -> Route;
fun mkRoute : LegList -> Route;
cat Date;
cat Line;
cat LegList;
fun BaseLeg : Leg -> Leg -> LegList;
fun ConsLeg : Leg -> LegList -> LegList;
cat BusLine;
fun bus_16 : BusLine;
fun bus_60 : BusLine;
cat City;
fun lerum : City;
fun partille : City;
fun kungalv : City;
fun alingsas : City;
fun goteborg : City;
fun kungsbacka : City;
fun molndal : City;
cat Leg;
fun leg : Line -> Stop -> Stop -> Leg;
cat TramLine;
fun tram_4 : TramLine;
fun tram_5 : TramLine;
cat Stop;
fun hogenskildsgatan : Stop;
fun lilla_bommen : Stop;
fun brunnsparken : Stop;
fun rosenlund : Stop;
fun korsvagen : Stop;
fun valand : Stop;
fun klippan : Stop;
fun lindholmen : Stop;
fun kungsportsplatsen : Stop;
cat FerryLine;
fun alvsnabben_ferry : FerryLine;
cat Location;
cat Area;
fun majorna : Area;
fun skargarden : Area;
fun centrum : Area;
fun hisingen : Area;
}
