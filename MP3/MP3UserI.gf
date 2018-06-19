
incomplete concrete MP3UserI of MP3User = 
    open Grammar, GodisLang, GodisMM, Prolog,
         (P=MP3SystemSem), MP3System, MP3Lexicon in {


-- predicates 
lin

available_song = issueClick P.available_song_Q
    (askQS available_song_Q);

not_available_song = issueNegClick P.available_song_Q;

available_song__artist x =
    maybeClick (askQS (which_N_has_NP_V2 song_N x write_V2))
    (askQS available_song_Q) (P.answer x.sem);


available_artist = issueClick P.available_artist_Q
    (askQS available_artist_Q);

not_available_artist = issueNegClick P.available_artist_Q;

available_artist__song x =
    maybeClick (askQS (who_VP (ComplV2 write_V2 x)))
    (askQS available_artist_Q) (P.answer x.sem);




-- short answers
lin

artist x = maybeClick (variants{ansNP x;
				ansNP (NP_Prep_NP by_Prep (indef_N_sg song_N) x)})
     (variants{{s=[]}; ansNP thisthatArtist2; ansNP thisthat2}) (P.answer x.sem);

song x = maybeClick (variants{ansNP x})
    (variants{{s=[]}; ansNP thisthatSong2; ansNP thisthat2}) (P.answer x.sem);

song_artist s a =  
    {sNone  = variants{ansNP (NP_Prep_NP by_Prep s a);
		       ansNP (NP_Prep_NP with_Prep a s)};
     sLeft  = variants{ansNP a;
		       ansNP (NP_Prep_NP by_Prep thisthatSong2 a);
		       ansNP (NP_Prep_NP by_Prep thisthat2 a);
		       ansNP (NP_Prep_NP with_Prep a thisthatSong2);
		       ansNP (NP_Prep_NP with_Prep a thisthat2)};
     sRight = variants{ansNP s;
		       ansNP (NP_Prep_NP by_Prep s thisthatArtist2);
		       ansNP (NP_Prep_NP by_Prep s thisthat2);
		       ansNP (NP_Prep_NP with_Prep thisthatArtist2 s);
		       ansNP (NP_Prep_NP with_Prep thisthat2 s)};
     sBoth  = variants{ansNP (NP_Prep_NP by_Prep thisthatSong2 thisthatArtist2);
		       ansNP (NP_Prep_NP by_Prep thisthatSong2 thisthat2);
		       ansNP (NP_Prep_NP by_Prep thisthat2 thisthatArtist2);
		       ansNP (NP_Prep_NP by_Prep thisthat2 thisthat2);
		       ansNP (NP_Prep_NP with_Prep thisthatArtist2 thisthatSong2);
		       ansNP (NP_Prep_NP with_Prep thisthatArtist2 thisthat2);
		       ansNP (NP_Prep_NP with_Prep thisthat2 thisthatSong2);
		       ansNP (NP_Prep_NP with_Prep thisthat2 thisthat2)};
     cLeft  = click (P.answer s.sem);
     cRight = click (P.answer a.sem)};

not_artist x = propNegClick x.sem;
not_song   x = propNegClick x.sem;

oper 

thisthatSong2   : NP = variants{this_N_sg song_N; that_N_sg song_N};
thisthatArtist2 : NP = variants{this_N_sg artist_N; that_N_sg artist_N};
thisthat2       : NP = variants{this_NP; that_NP};


-- actions
lin

top = noClick
    (reqVP top);

help = noClick
    (reqVP help); 

}



