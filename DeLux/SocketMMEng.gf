--# -path=.:../Common:prelude:alltenses

concrete SocketMMEng of Socket = SocketMMI with
    (Socket=SocketEng), (Cat=CatEng);
