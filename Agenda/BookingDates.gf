--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common

abstract BookingDates = {

cat Date;
cat Month;

cat Date_Str;
cat Date_Ref;


-- cat Year;
cat Month_Str;
cat Day;
cat Weekday;

fun

amonth : Month;
adate : Date;
aweekday : Weekday;


that_date : Date_Ref;

-- Since Date information is generated as classes. 

{-
mkDate : Date_Str -> Date;
mkMonth : Month_Str -> Month;

date__day : Day -> Date_Str;
-- date__month : Month_Str -> Month;
date__day_month : Day -> Month_Str -> Date_Str;



date__weekday : Weekday -> Date_Str;
date__weekday_day : Weekday -> Day -> Date_Str;
date__weekday_day_month : Weekday -> Day -> Month_Str -> Date_Str;


-- date__year : Year -> Date_Str;
-- date__month_year : Month -> Year -> Date_Str;
-- date__day_month_year : Day -> Month -> Year -> Date_Str;
-- date__weekday_day_month_year : Weekday -> Day -> Month -> Year -> Date_Str;



-- twothousandfour,
-- twouthousandfive,
-- twothousandsix,
-- twothousandseven : Year;


january,
february,
march,
april,
june,
july,
august,
september,
october,
november,
december : Month_Str;

next_month,
previous_month,
this_month : Month_Str;


first,
second,
third,
fourth,
fifth,
sixth,
seventh,
eighth,
ninth,
tenth,
eleventh,
twelvth,
thirteenth,
fourteenth,
fifteenth,
sixteenth,
seventeenth,
eighteenth,
nineteenth,
twentieth,
twentyfirst,
twentysecond,
twentythird,
twentyfourth,
twentyfifth,
twentysixth,
twentyseventh,
twentyeight,
twentyninth,
thirtieth,
thirtyfirst : Day;

monday,
tuesday,
wednesday,
thursday,
friday,
saturday,
sunday : Weekday;

today,
tomorrow,
yesterday,
day_after_tomorrow,
day_before_yesterday : Date_Str;
-}


}






