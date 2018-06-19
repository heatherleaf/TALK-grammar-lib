--# -path=.:../Common:prelude:alltenses

concrete MP3UserEng of MP3User = MP3GlobalEng ** 
    open Prelude, GodisLangEng, MP3SystemEng, ResEng, Prolog,
         MP3LexiconEng, (P=MP3SystemSem), GodisMM in {


oper 

avail_song : SS = 
    variants{askQS available_song_Q;
	     ss (variants{"what";"which"} ++ ["songs"] ++
		     variants{variants{["have they"];["has he"];["has she"]} ++ written;
			      ["do you have"];
			      ["do i have"];
			      ["are there"]})};

avail_song__artist : NP -> SS = \x ->
    variants{askQS (which_N_has_NP_V2 song_N x write_V2);
	     ss (variants{"what";"which"} ++ ["songs"] ++
		     variants{["are there by"] ++ x.s!Nom; 
			      has!x.a.n ++ x.s!Nom ++ written;
			      ["do you have by"] ++ x.s!Nom});
	     ss (["do you have"] ++ variants{["any songs"];["anything"]} ++ "by" ++ x.s!Nom);
	     ss (["what do you have by"] ++ x.s!Nom );
	     ss (["are there any songs by"] ++ x.s!Nom );
	     ss (["do you have any"] ++ x.s!Nom );
	     ss (["is there any"] ++ x.s!Nom );
	     ss (["are there any"] ++ x.s!Nom ++ ["songs"])};

avail_artist : SS = 
    variants{askQS available_artist_Q;
	     ss (variants{"what";"which"} ++ ["artists"] ++
		     variants{["do you have"];
			      ["do i have"];
			      ["are there"]})};

avail_artist__song : NP -> SS = \x ->
    ss (variants{"who";["which artist"]} ++
	    variants{"has";"have"} ++ written ++ x.s!Nom);

written : Str = variants{"done";"made";"written"};
has     : Number => Str = table {Sg => "has"; Pl => "have"};


-- predicates 
lin

available_song = issueClick (pp0 "available_song") avail_song;

not_available_song = issueNegClick P.available_song_Q;

available_song__artist x =
    maybeClick (avail_song__artist x)
    avail_song (P.answer x.sem);


available_artist = issueClick (pp0 "available_artist") avail_artist;

not_available_artist = issueNegClick P.available_artist_Q;

available_artist__song x =
    maybeClick (avail_artist__song x)
    avail_artist (P.answer x.sem);




-- short answers
lin

artist x = maybeClick (variants{ansNP x;
				ss (variants{"select"; 
					     "something" ++ by; 
					     ["a song"] ++ by; 
					     ["the song"] ++ by} ++ x.s!Nom);
				ss (x.s!Nom ++ "please")})
     (ss (optStr thisArtist2)) (P.answer x.sem);

song x = maybeClick (variants{ansNP x;
			      ss (["the song"] ++ x.s!Nom)})
    (ss (optStr thisSong2)) (P.answer x.sem);

song_artist s a =  
    {sNone  = ss (variants{s.s!Nom ++ by ++ a.s!Nom;
			   a.s!Nom ++ "with" ++ s.s!Nom;
			   "the" ++ a.s!Nom ++ "song" ++ s.s!Nom;
			   a.s!Gen ++ optStr "song" ++ s.s!Nom});
     sLeft  = ss (optStr thisSong2 ++ optStr by ++ a.s!Nom);
     sRight = ss (s.s!Nom ++ optStr by ++ optStr thisArtist2);
     sBoth  = ss (thisSong2 ++ by ++ thisArtist2);
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};

not_artist x = propNegClick x.sem;
not_song   x = propNegClick x.sem;

oper 
thisSong2   : Str = this_that_Str ++ optStr "song";
thisArtist2 : Str = this_that_Str ++ optStr "artist";
by          : Str = variants{"by";"with"};


-- actions
lin

top = noClick -- actionClick (pp0 "top")
    (variants{req1 (["return to"] ++ optStr "the" ++ "top" ++ optStr "menu");
	      req1 "restart"}); 

help = noClick -- actionClick (P.help)
    (variants{reqVP help;
	      ss (optStr ["i need"] ++ ["help"]);
	      ss (optStr ["can you"] ++ ["help me"])}); 

}



