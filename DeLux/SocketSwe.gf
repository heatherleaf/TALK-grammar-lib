--# -path=.:../Common:prelude:alltenses

concrete SocketSwe of Socket = 
    open LangSwe, GodisLangSwe, LampsSwe, RoomsSwe in {

lincat Socket = CN;

lin

socket1 = lamp_in_room CeilingLamp Livingroom;
socket2 = lamp_in_room FloorLamp   Livingroom;
socket3 = lamp_in_room DesktopLamp Livingroom;
socket4 = lamp_in_room CeilingLamp Hall;
socket5 = lamp_in_room CeilingLamp Kitchen;
socket6 = lamp_in_room CeilingLamp Bedroom;
socket7 = lamp_in_room DesktopLamp Bedroom;

oper lamp_in_room : N -> N -> CN
	 = \lamp, room -> AdvCN (UseN lamp) (PrepNP in_Prep (the_N_sg room));

}
