--# -path=.:../Common:prelude

abstract DeluxUser = DeluxGlobal ** {

fun

-------------------------------------------------------------------------
-- Actions
-- we use Question since we do not want coordination

-- U: restart
top : Question;

-- U: help
-- help : Question;


------------------------------------------------------------------------
-- Short answers

room : Room -> ShortAns;
lamp : Lamp -> ShortAns;

room_lamp : Room -> Lamp -> ShortAns;

not_room : Room -> ShortAns;
not_lamp : Lamp -> ShortAns;

}


