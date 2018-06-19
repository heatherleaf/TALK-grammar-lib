--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common:resource-1.0/scandinavian:resource-1.0/swedish

concrete BookingDatesSwe of BookingDates = 
	open CommonScand, GodisLangSwe, Prelude, CatSwe, GodisLangSwe, LangSwe, ParadigmsSwe in {

lincat Date = NP;
lincat Month = NP;

lincat Date_Str = {s : Str};
lincat Date_Ref = NP;


-- lincat Year = {s : Str};
lincat Month_Str = {s : Str};
lincat Day = {s : Str};
lincat Weekday = NP;


lin


amonth = sing_NP ["MONTH"];
adate = sing_NP ["DATE"];
aweekday = sing_NP ["WEEKDAY"];

that_date = sing_NP (variants {["den dagen"]; ["det datumet"]});

-- Since Date information is generated as classes

{-
mkDate s = mkNP s.s s.s Sg utrum;
mkMonth s = mkNP s.s s.s Sg utrum;


date__day d = d;
-- date__month m = m;
date__day_month d m = {s = d.s ++  m.s};


date__weekday w = {s = variants{("p�" ++ w.s) ; w.s}};
date__weekday_day w d = {s = (variants {("p�" ++ w.s);w.s}) ++ d.s};
date__weekday_day_month w d m = {s = (variants {("p�" ++ w.s);w.s}) ++  d.s ++  m.s};


-- date__year y = y;
-- date__month_year m y = {s = m.s ++ y.s};
-- date__day_month_year d m y = {s = d.s ++ m.s ++ y.s};
-- date__weekday_day_month_year w d m y = {s = (variants {("p�" ++ w.s);w.s}) ++ d.s ++ m.s ++ y.s};


lin

-- twothousandfour = ss (["tv�tusenfyra"]);
-- twouthousandfive = ss (["tv�tusenfem"]);
-- twothousandsix = ss (["tv�tusensex"]);
-- twothousandseven = ss (["tv�tusensju"]);

january = ss (["januari"]);
february = ss (["februari"]); 
march = ss (["mars"]); 
april = ss (["april"]);
june = ss (["juni"]); 
july = ss (["juli"]); 
august = ss (["augusti"]);
september = ss (["september"]);
october = ss (["oktober"]); 
november = ss (["november"]);
december = ss (["december"]);

next_month = ss (["next month"]);
previous_month = ss (["previous month"]);
this_month = ss (["this month"]);

first = ss (variants {["f�rsta"];["den f�rsta"]});
second = ss (variants {["andra"];["den andra"]});
third = ss (variants {["tredje"];["den tredje"]});
fourth = ss (variants {["fj�rde"];["den fj�rde"]});
fifth = ss (variants {["femte"];["den femte"]});
sixth = ss (variants {["sj�tte"];["den sj�tte"]});
seventh = ss (variants {["sjunde"];["den sjunde"]});
eighth = ss (variants {["�ttonde"];["den �ttonde"]});
ninth = ss (variants {["nionde"];["den nionde"]});
tenth = ss (variants {["tionde"];["den tionde"]});
eleventh = ss (variants {["elfte"];["den elfte"]}); 
twelvth = ss (variants {["tolfte"];["den tolfte"]});
thirteenth = ss (variants {["trettonde"];["den trettonde"]});
fourteenth = ss (variants {["fjortonde"];["den fjortonde"]});
fifteenth = ss (variants {["femtonde"];["den femtonde"]});
sixteenth = ss (variants {["sextonde"];["den sextonde"]});
seventeenth = ss (variants {["sjutonde"];["sjutonde"]});
eighteenth = ss (variants {["artonde"];["den artonde"]});
nineteenth = ss (variants {["nittonde"];["den nittonde"]});
twentieth = ss (variants {["tjugonde"];["den tjugonde"]}); 
twentyfirst = ss (variants {["tjugof�rsta"];["den tjugof�rsta"]}); 
twentysecond = ss (variants {["tjugoandra"];["den tjugoandra"]}); 
twentythird = ss (variants {["tjugotredje"];["den tjugotredje"]}); 
twentyfourth = ss (variants {["tjugofj�rde"];["den tjugofj�rde"]}); 
twentyfifth = ss (variants {["tjugofemte"];["den tjugofemte"]}); 
twentysixth = ss (variants {["tjugosj�tte"];["den tjugosj�tte"]}); 
twentyseventh = ss (variants {["tjugosjunde"];["den tjugosjunde"]}); 
twentyeight = ss (variants {["tjugo�ttonde"];["den tjugo�ttonde"]}); 
twentyninth = ss (variants {["tjugonionde"];["den tjugonionde"]}); 
thirtieth = ss (variants {["trettionde"];["den trettionde"]}); 
thirtyfirst = ss (variants {["trettiof�rsta"];["den trettiof�rsta"]});


monday = ss (variants {["m�ndag"];["m�ndagen"]});
tuesday = ss (variants {["tisdag"];["tisdagen"]});
wednesday = ss (variants {["onsdag"];["onsdagen"]});
thursday = ss (variants {["torsdag"];["torsdagen"]});
friday = ss (variants {["fredag"];["fredagen"]});
saturday = ss (variants {["l�rdag"];["l�rdagen"]});
sunday = ss (variants {["s�ndag"];["s�ndagen"]});

today = ss (["idag"]);
tomorrow = ss (["i morgon"]);
yesterday = ss (["i g�r"]);
day_after_tomorrow = ss (["i �vermorgon"]);
day_before_yesterday = ss (["i f�rrg�r"]);
-}

}




