--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete AgendaLexiconSwe of AgendaLexicon = CatSwe ** 
    open Prelude, ParadigmsSwe, LexiconSwe, IrregSwe in {

lin

-- Nouns
booking_N = regGenN "bokning" utrum;
agenda_N = regGenN "agenda" utrum;
time_N = regGenN "tid" utrum;
date_N = regGenN "datum" neutrum;
event_N = regGenN "typ" utrum;
month_N = regGenN "m�nad" utrum;


-- Verbs-1

add_V = partV l�gga_V "till";

--Verbs-2

add_V2    = dirV2 (partV l�gga_V "till");
change_V2 = dirV2 �ndra_V;
delete_V2 = dirV2 (partV ta_V "bort");
goto_V2 = dirV2 (partV g�_V "till");
move_V2   = dirV2 (regV "flyttar");

--Verbs-3

add_V3    = add_V3;
change_V3 = dirV3 �ndra_V (mkPrep "f�r");
delete_V3 = dirV3 (partV ta_V "bort") (mkPrep "fr�n");

oper 
�ndra_V = regV "�ndrar";
ta_V    = mkV "ta" "tar" "ta" "tog" "tagit" "tagen";

}
