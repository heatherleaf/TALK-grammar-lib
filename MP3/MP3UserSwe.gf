--# -path=.:../Common:prelude:alltenses

concrete MP3UserSwe of MP3User = MP3GlobalSwe ** 
    open Prelude, GrammarSwe, GodisLangSwe, MP3LexiconSwe, Prolog, 
         MP3SystemSwe, CommonScand, (P=MP3SystemSem), GodisMM in {

oper 
avail_song : SS = 
    variants{askQS available_song_Q;
	     ss vilka_finns;
	     ss (vilka_har ++ honhan ++ gjort)};

avail_artist : SS = 
    variants{askQS available_artist_Q;
	     ss (variants{"vem";["vilka"];["vilka artister"];["vilken artist"]} ++ 
		     variants{["finns det"];["har jag"];["har du"]})};


-- predicates 

lin

available_song = issueClick (pp0 "available_song") avail_song;

not_available_song = issueNegClick P.available_song_Q;

available_song__artist x =
    maybeClick (variants{ss (vilka_finns ++ "med" ++ x.s!NPNom);
			 ss (vilka_har ++ x.s!NPNom ++ gjort);
			 ss (["har du"] ++ någon_låt ++ "med" ++ x.s!NPNom)})
    avail_song (P.answer x.sem);


available_artist = issueClick (pp0 "available_artist") avail_artist;

not_available_artist = issueNegClick P.available_artist_Q;

available_artist__song x =
    maybeClick (ss (variants{"vem";["vilka"];["vilka artister"];["vilken artist"]} ++ 
			"har" ++ gjort ++ x.s!NPNom))
    avail_artist (P.answer x.sem);



oper vilka_finns : Str = ["vilka låtar finns det"];
oper vilka_har   : Str = ["vilka låtar har"];
oper honhan      : Str = variants{"de";"hon";"han"};
oper gjort       : Str = variants{"gjort";"skrivit"};
oper någon_låt   : Str = variants{["något"];["någonting"];["nånting"];
				  ["någon låt"];["några låtar"]};


-- short answers

lin
artist x = maybeClick (ansNP x)
    (ss (optStr thisArtist2)) (P.answer x.sem);

song x = maybeClick (ansNP x)
    (ss (optStr thisSong2)) (P.answer x.sem);

song_artist s a = 
    {sNone  = ss (variants{s.s!NPNom ++ av ++ a.s!NPNom;
			   a.s!NPNom ++ "med" ++ s.s!NPNom;
			   a.s!(NPPoss SgUtr) ++ optStr "låt" ++ s.s!NPNom});
     sLeft  = ss (optStr thisSong2 ++ optStr av ++ a.s!NPNom);
     sRight = ss (s.s!NPNom ++ optStr av ++ optStr thisArtist2);
     sBoth  = ss (thisSong2 ++ av ++ thisArtist2);
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};

not_artist x = propNegClick x.sem;
not_song   x = propNegClick x.sem;

oper
thisSong2   : Str = this_that_Str ++ optStr "låten";
thisArtist2 : Str = this_that_Str ++ optStr "artisten";
av          : Str = variants{"med";"av"};


-- actions

lin
top = noClick -- actionClick (pp0 "top")
    (variants{ss (["starta om"]);
	      ss (["omstart"]);
	      ss (optStr ["tillbaka till"] ++ ["huvudmenyn"])});

help = noClick -- actionClick (P.help)
    (variants{reqVP help;
	      ss (variants{[];["jag vill ha"];["jag behöver"]}
		      ++ ["hjälp"]);
	      ss (["kan du hjälpa mig"]);
	      ss (["hur gör jag nu"])}); 


}

