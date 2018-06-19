--# -path=.:../Common:prelude:alltenses

concrete SocketEng of Socket = 
    open DeluxLexiconEng, LangEng, ParadigmsEng, LampsEng in {

lincat Socket = CN;

lin

socket1 = UseN (compoundN "livingroom" CeilingLamp);
socket2 = UseN (compoundN "livingroom" FloorLamp);
socket3 = UseN (compoundN "livingroom" DesktopLamp);
socket4 = UseN (compoundN "hall"       CeilingLamp);
socket5 = UseN (compoundN "kitchen"    CeilingLamp);
socket6 = UseN (compoundN "bedroom"    CeilingLamp);
socket7 = UseN (compoundN "bedroom"    DesktopLamp);

}
