--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingWeekdaysSwe of BookingWeekdays = 
    open NounSwe, Prelude, ParadigmsSwe, IrregSwe, GodisLangSwe in {

lincat 

Weekday_NP = NP;
Weekday_PN = PN;

lin 

monday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "m�ndag" utrum));
tuesday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "tisdag" utrum));
wednesday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "onsdag" utrum));
thursday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "torsdag" utrum));
friday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "fredag" utrum));
saturday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "l�rdag" utrum));
sunday_np = DetCN (DetSg MassDet NoOrd) (UseN (regGenN "s�ndag" utrum));

-- Hur g�r man PN?

monday_pn = regGenPN "m�ndag" neutrum;
tuesday_pn = regGenPN "tisdag" neutrum;
wednesday_pn = regGenPN "onsdag" neutrum;
thursday_pn = regGenPN "torsdag" neutrum;
friday_pn = regGenPN "fredag" neutrum;
saturday_pn = regGenPN "l�rdag" neutrum;
sunday_pn = regGenPN "s�ndag" neutrum;
}
