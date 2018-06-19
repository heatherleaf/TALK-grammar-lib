
incomplete concrete SocketMMI of Socket =
	open Socket, (Sem=SocketSem), (MM=GodisMM), Cat in {

lincat Socket = MM.Semantics ** CN;

lin

socket1 = socket1 ** MM.sem (Sem.socket1);
socket2 = socket2 ** MM.sem (Sem.socket2);
socket3 = socket3 ** MM.sem (Sem.socket3);
socket4 = socket4 ** MM.sem (Sem.socket4);
socket5 = socket5 ** MM.sem (Sem.socket5);
socket6 = socket6 ** MM.sem (Sem.socket6);
socket7 = socket7 ** MM.sem (Sem.socket7);

}
