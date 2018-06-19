
incomplete concrete RoomsMMI of Rooms =
    open Rooms, (Sem=RoomsSem), (MM=GodisMM), Cat in {

lincat Room = MM.Semantics ** Room;

lin
Livingroom = Livingroom ** MM.sem (Sem.Livingroom);
Hall = Hall ** MM.sem (Sem.Hall);
Kitchen = Kitchen ** MM.sem (Sem.Kitchen);
Bedroom = Bedroom ** MM.sem (Sem.Bedroom);
}
