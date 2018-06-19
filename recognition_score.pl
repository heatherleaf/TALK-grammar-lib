
:- use_module(library(lists)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% initialize_scores(+Word-scores)
%%
%% takes a list of scores for individual words,
%% and creates a database range_score/3 of all combined substring scores
%%
%% range_score(?From, ?To, ?Score)

:- dynamic range_score/3.

initialize_scores(Sentence) :-
	retractall(range_score(_,_,_)),
	\+ (
	     range(Sentence, Range, From, To),
	     score(Range, Score),
	     assert(range_score(From, To, Score)),
	     fail
	   ).

range(Sentence, Range, From, To) :-
	Range = [_|_],
	append(Pre, RangePost, Sentence),
	length(Pre, From),
	prefix(Range, RangePost),
	length(Range, Len),
	To is From + Len.

score(Range, Score) :-
	multiply_list(Range, 1, Score).

multiply_list([], P, P).
multiply_list([X|Xs], P0, P) :-
	P1 is X*P0,
	multiply_list(Xs, P1, P).

subtract_range([], _, []).
subtract_range([Rng0|Rngs0], Sub, FinalRng) :-
	subtract1(Rng0, Sub, Rng),
	append(Rng, Rngs, FinalRng),
	subtract_range(Rngs0, Sub, Rngs).

subtract1(Rng, [], Rng).
subtract1(I0-J0, [I1-J1], Rng) :-
	( (J0=<I1 ; J1=<I0) ->
	    Rng = [I0-J0]
	; I0<I1 ->
	    ( J1<J0 ->
		Rng = [I0-I1, J1-J0]
	    ;
		Rng = [I0-I1]
	    )
	;
	    ( J1<J0 ->
		Rng = [J1-J0]
	    ;
		Rng = []
	    )
	).
	    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% translate_ranges(+Moves with ranges, -Moves with scores)
%%
%% convert output from JavaGF-agent

translate_ranges(Moves0, Moves) :-
	trans0(Moves0, Moves1),
	trans_ranges(Moves1, Moves).

trans0([App : Ranges] = _, [App : Scores]) :-
	trans1(Ranges, Scores).

trans1([Move = Rng], [StripMove = Rng]) :-
	strip(Move, StripMove).
trans1([Move0, Move1 = Rng], [Strip0=Rng0, Strip1=Rng1]) :-
	strip(Move0, Strip0),
	trans2(Move1, Strip1, Rng1),
	subtract_range(Rng, Rng1, Rng0).
trans1([Move0, Move1, Move2 = Rng], [Strip0=Rng0, Strip1=Rng1, Strip2=Rng2]) :-
	strip(Move0, Strip0),
	trans2(Move1, Strip1, Rng1),
	subtract_range(Rng, Rng1, Rng00),
	trans2(Move2, Strip2, Rng2),
	subtract_range(Rng00, Rng2, Rng0).


trans2(Move = Rng, Strip, Rng) :-
	!, strip(Move, Strip).
trans2(Move, Strip, Rng) :-
	Move =.. [F,Move1],
	Strip =.. [F,Strip1],
	trans2(Move1, Strip1, Rng).

strip(Move = _, Strip) :-
	!, strip(Move, Strip).
strip(Move, Strip) :-
	Move =.. [F|Args],
	strips(Args, Strips),
	Strip =.. [F|Strips].

strips([], []).
strips([M|Ms], [S|Ss]) :-
	strip(M, S), strips(Ms, Ss).


trans_ranges([App:Moves0], [App:Moves]) :-
	trans_ranges1(Moves0, Moves).

trans_ranges1([], []).
trans_ranges1([Move=Range|Moves0], [Move=Score|Moves]) :-
	ranges2score(Range, Score),
	trans_ranges1(Moves0, Moves).

ranges2score([Rng|Rngs], Score) :-
	range2score(Rng, Score0),
	( Rngs == [] ->
	    Score = Score0
	;
	    ranges2score(Rngs, Score1),
	    Score is Score0*Score1
	).
	
range2score(I-J, Score) :-
	range_score(I, J, Score).
