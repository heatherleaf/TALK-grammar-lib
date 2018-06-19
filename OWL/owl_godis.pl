
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% owl_godis.pl, by Peter Ljunglöf
%%
%% automatically creates GoDiS Prolog files and GF grammars
%% from an OWL ontology
%%
%% uses predicate specific to SWI Prolog
%% and the Thea OWL parser (owl_parser.pl)
%%
%% the main predicate call should be
%% make(Base)
%% - reads the OWL ontology file Base.owl
%% - creates the GoDiS file domain_Base.pl
%% - creates several GF grammars BaseXXX.pl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- use_module(owl_parser).

:- op(900, xfx, ['::', '<<', '::..', '<<..', has, hasAnnotation]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% main predicate
%%
%% make(Base)
%% - reads the file Base.owl
%% - creates the GoDiS file domain_Base.pl
%% - creates several GF grammars BaseXXX.pl

make(Base) :-
	read_owl(Base),
	make_godis(Base),
	make_grammar(Base),
	whats_left_todo(Base).

read_owl(Base) :-
	atom_concat(Base, '.owl', File),
	owl_parse(File, complete, complete, []),
	!.

automessage('This file was automatically created by owl_godis.pl').

whats_left_todo(Base) :-
	nl, nl,
	format('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n', []),
	format('>> The following files has to be written/maintained manually:\n\n', []),
	format('GoDiS: configuration file, godis_~w.pl\n', [Base]),
	format('       plus the necessary device file(s)\n', []),
	findall(Lng, Lng :: 'Language', Lngs),
	format('GF: ~wLexicon~w.gf\n', [Base, Lngs]),
	format('    ~wData~w.gf\n', [Base, Lngs]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% making the Godis predicates

make_godis(Domain) :-
	open_file([domain_,Domain,'.pl'], godis),
	automessage(Message),
	format(godis, '%% ~w\n\n', [Message]),
	sem_sorts,
	isas,
	sort_restrs,
	valid_params,
	plans,
	close(godis).


%% sortal restrictions etc

sem_sorts :-
	write(godis, '\n%% sem_sort(?ind, ?sort)\n'),
	doall(( Sort :: 'Sort',
		Sort has class = SortClass,
		Ind :: SortClass,
		format(godis, 'sem_sort(~q, ~q).\n', [Ind, Sort])
	      )),

	write(godis, '\n%% sem_sort(?action, action)\n'),
	doall(( Action :: 'Action',
		format(godis, 'sem_sort(~q, action).\n', [Action])
	      )).

isas :-
	write(godis, '\n%% isa(?sort, ?sort)\n'),
	doall(( Super :: 'Sort',
		Sort  :: 'Sort',
		Super has class = SuperClass,
		Sort  has class = SortClass,
		SortClass << SuperClass,
		format(godis, 'isa(~q, ~q).\n', [Sort, Super])
	      )),

	write(godis, '\n%% isa(?predicate, ?sort)\n'),
	doall(( Pred :: 'Predicate',
		Pred has sort = Sort,
		format(godis, 'isa(~q, ~q).\n', [Pred, Sort])
	      )).

sort_restrs :-
	write(godis, '\n%% sort_restr(+proposition)\n'),
	doall(( Pred :: 'Predicate',
		Pred has sort = Sort,
		format(godis, 'sort_restr(~q(X)) :- sem_sort(X, ~q).\n', [Pred, Sort])
	      )).

valid_params :-
	write(godis, '\n%% valid_parameter(+proposition)\n'),
	write(godis, '%% uses hook predicate valid_param(+proposition)\n'),
	write(godis, 'valid_parameter(P) :- clause(valid_param(P), _), !, valid_param(P).\n'),
	write(godis, 'valid_parameter(P) :- sort_restr(P).\n').


%% dialogue plans

plans :-
	write(godis, '\n%% plan(?name, ?list of plan constructs)\n'),
	doall(( Plan :: 'Plan',
		format(godis, 'plan(~q, ~@).\n', [Plan, prt_plan(Plan)]),
		( Plan has postcondition = _ ->
		    Plan has postcondition = PostCond,
		    format(godis, 'postcond(~q, ~@).\n', [Plan, prt_proposition(PostCond)])
		;
		    format(godis, 'postcond(~q, none).\n', [Plan])
		)
	      )).

prt_plan(Plan) :-
	findall(Con, Plan has plan_construct = Con, Cons),
	predsort(precond, Cons, PlanList),
	format(godis, '[~@]', [prt_planlist(PlanList)]).


precond(Order, A, B) :-
	( A = B           -> Order = '='
	; after(A, B, []) -> Order = '>'
	;                    Order = '<'
	).

after(A, C, Xs) :-
	( member(A, Xs) ->
	    error(['cyclic dependencies in precondition', A])
	;
	    A has precondition = B,
	    ( B = C ; after(B, C, [A|Xs]) )
	).


prt_planlist([]).
prt_planlist([Construct | Plan]) :-
	write(godis, '\n\t'),
	Construct :: Type,
	prt_construct(Type, Construct),
	( Plan == [] -> true ; write(godis, ',') ),
	prt_planlist(Plan).


prt_construct('ForgetAll', _Construct) :-
	!, format(godis, 'forget_all', []).
% prt_construct('Bind', Construct) :-
% 	...
% prt_construct('ConsultDB', Construct) :-
% 	...
prt_construct('Findout', Construct) :-
	Construct has predicate = Pred,
	!, format(godis, 'findout(X^~q(X))', [Pred]).
prt_construct('Raise', Construct) :-
	Construct has predicate = Pred,
	!, format(godis, 'raise(X^~q(X))', [Pred]).
prt_construct('DevDo', Construct) :-
	Construct has device = Dev,
	Construct has device_command = Command,
	!, format(godis, 'dev_do(~q, ~q)', [Dev, Command]).
prt_construct('DevQuery', Construct) :-
	Construct has device = Dev,
	Construct has predicate = Pred,
	!, format(godis, 'dev_query(~q, X^~q(X))', [Dev, Pred]).
prt_construct('DevGet', Construct) :-
	Construct has device = Dev,
	Construct has predicate = Pred,
	!, format(godis, 'dev_get(~q, ~q)', [Dev, Pred]).
prt_construct('DevSet', Construct) :-
	Construct has device = Dev,
	Construct has predicate = Pred,
	Construct has predicate_value = Val,
	!, format(godis, 'dev_set(~q, ~q, ~q)', [Dev, Pred, Val]).
prt_construct('IfThenElse', Construct) :-
	Construct has proposition = Test,
	Construct has plan_if_true = TruePlan,
	Construct has plan_if_false = FalsePlan,
	!, format(godis, 'if_then_else(~q, ~@, ~@)',
		  [Test, prt_plan(TruePlan), prt_plan(FalsePlan)]).
prt_construct(Type, Cons) :-
	error(['error in plan construct', Cons :: Type]).


prt_proposition(Prop) :-
	Prop :: Class,
	( Class = 'Done' ->
	    Prop has action_or_command = ActionCommand,
	    format('done(~q)', [ActionCommand])
	; Class = 'StatusFailed' ->
	    Prop has action_or_command = ActionCommand,
	    format('status(~q, failed(_))', [ActionCommand])
	;
	    error(['error in proposition', Prop :: Class])
	).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% making the GF grammar

make_grammar(Domain) :-
	initialize,
	data_grammar(Domain),
	system_grammar(Domain),
	user_grammar(Domain),
	language_grammars(Domain).

initialize :-
	retract_lexemes,
	reset_numbering.

open_grammar(Domain, Module) :-
	open_file([Domain, Module, '.gf'], gf_abs),
	open_file([Domain, Module, 'Sem.gf'], gf_sem),
	open_file([Domain, Module, 'I.gf'], gf_cnc),

	gfheader(GFHdr),
	write(gf_abs, GFHdr),
	write(gf_sem, GFHdr),
	write(gf_cnc, GFHdr).

gfheader(Hdr) :-
	gfpath(GFPath),
	automessage(Message),
	concat_atom([GFPath,'\n\n-- ',Message,'\n\n'], Hdr).

gfpath('--# -path=.:../Common:prelude:resource-1.0/abstract:resource-1.0/common').

close_grammar :-
	write(gf_abs, '}\n'),
	write(gf_sem, '}\n'),
	write(gf_cnc, '}\n'),

	close(gf_abs),
	close(gf_sem),
	close(gf_cnc).


%% the grammar for sorts and individuals

data_grammar(Domain) :-
	open_grammar(Domain, 'Data'),
	format(gf_abs, 'abstract ~wData = {\n\n', [Domain]),
	format(gf_sem, 'concrete ~wDataSem of ~wData = \n', [Domain, Domain]),
	format(gf_sem, '    open Prolog in {\n\n', []),
	format(gf_cnc, 'incomplete concrete ~wDataI of ~wData = \n', [Domain, Domain]),
	format(gf_cnc, '    open Cat, GodisLang in {\n\n', []),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Sorts and Individuals')),
	doall(( %%Sort :: 'Sort',
		%%pred2cat(Sort, Cat),

		Cat <<.. 'Individuals',
		
		gfprint(gf_abs, cat(Cat)),
		gfprint(gf_sem, lincat(Cat, 'PStr')),
		gfprint(gf_cnc, lincat(Cat, 'NP')),

		Ind :: Cat,
		arguments(Ind, Args, PPN),
		
		gfprint(gf_abs, fun(Ind, Args, Cat)),
		
		( Ind has godis_semantics = Sem -> 
		    gfprint(gf_sem, lin(Ind, [], tree(Sem)))
		; 
		    gfprint(gf_sem, lin(Ind, [], tree(PPN, [terminal(Ind)])))
		),
		
		( Ind hasAnnotation rdfs:label = Lin:_Lng -> true ; Lin = Ind ),
		gfprint(gf_cnc, lin(Ind, [], tree('sing_NP', [terminal(Lin)])))
	      )),

	close_grammar.

arguments(Ind, [Arg1,Arg2,Arg3], pp3) :-
	Ind has argument_3 = Arg3,
	!, ( Ind has argument_2 = Arg2,
	       Ind has argument_1 = Arg1 -> true
	   ;
	       error(['individual should have 3 arguments', Ind])
	   ).
arguments(Ind, [Arg1,Arg2], pp2) :-
	Ind has argument_2 = Arg2,
	!, ( Ind has argument_1 = Arg1 -> true
	   ; error(['individual should have 2 arguments', Ind])
	   ).
arguments(Ind, [Arg1], pp1) :-
	Ind has argument_1 = Arg1,
	!.
arguments(_Ind, [], pp0).


%% the grammar for system utterances

system_grammar(Domain) :-
	open_grammar(Domain, 'System'),
	format(gf_abs, 'abstract ~wSystem = \n', [Domain]),
	format(gf_abs, '    GodisSystem, ~wData ** {\n\n', [Domain]),
	format(gf_sem, 'concrete ~wSystemSem of ~wSystem = \n', [Domain, Domain]),
	format(gf_sem, '    GodisSystemSem, ~wDataSem ** \n', [Domain]),
	format(gf_sem, '    open Prolog in {\n\n', []),
	format(gf_cnc, 'incomplete concrete ~wSystemI of ~wSystem = \n', [Domain, Domain]),
	format(gf_cnc, '    GodisSystemI, ~wDataI ** \n', [Domain]),
	format(gf_cnc, '    open Grammar, GodisLang, ~wLexicon in {\n\n', [Domain]),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Short answers')),
	doall(( Sort :: 'Sort',
		pred2cat(Sort, Cat),

		gfprint(gf_abs, fun(Sort, [Cat], 'ShortAns')),
		gfprint(gf_sem, lin(Sort, [], tree('pp1', [terminal(Sort)]))),
		gfprint(gf_cnc, lin(Sort, [Sort], var(Sort)))
	      )),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Actions')),
	doall(( Action :: 'Action',

		gfprint(gf_abs, fun(Action, [], 'Action')),
		gfprint(gf_sem, lin(Action, [], tree('pp0', [terminal(Action)]))),
		findall(ETree,
			(   Action has sysRequest = Tree,
			    expand_tree(Tree, ETree, Args),
			    ( Args = [] -> true
			    ; error(['system requests should not have arguments', Action:Args]) )
			), ETrees),
		clauseForm(Action, ClForm),
		gfprint(gf_cnc, lin(Action, [], tree(ClForm) * variants(ETrees)))
	      )),

	gfprint([gf_abs,gf_sem,gf_cnc], comment('Predicates')),
	doall(( Pred :: 'Predicate',
		pred2cat(Pred, Cat),

		gfprint(gf_abs, fun(Pred, [Cat], 'Proposition')),
		gfprint(gf_sem, lin(Pred, [], tree('pp1', [terminal(Pred)]))),
		findall(ETreeA,
			(   Pred has sysAnswer = TreeA,
			    expand_tree(TreeA, ETreeA, ArgsA),
			    ( ArgsA = [Pred] -> true
			    ; error(['system answers should have exactly one argument',
				     '(the predicate itself)', Pred:ArgsA]) )
			), ETreeAs),
		clauseForm(Pred, ClForm),
		gfprint(gf_cnc, lin(Pred, [Pred], tree(ClForm) * variants(ETreeAs))),
		
		atom_concat(Pred, '\'', PredQ),
		gfprint(gf_abs, fun(PredQ, [], 'Question')),
		gfprint(gf_sem, lin(PredQ, [], tree('pWhQ', [terminal(Pred)]))),
		findall(ETreeQ,
			(   Pred has sysQuestion = TreeQ,
			    expand_tree(TreeQ, ETreeQ, ArgsQ),
			    ( ArgsQ = [] -> true
			    ; error(['system questions should not have arguments', Pred:ArgsQ]) )
			), ETreeQs),
		gfprint(gf_cnc, lin(PredQ, [], tree(ClForm) * variants(ETreeQs)))
	      )),

	close_grammar.


clauseForm(Action, ClForm) :-
	( Action has clauseForm = ClForm -> true
	; ClForm = isDoing ).


%% the grammar for user utterances

user_grammar(Domain) :-
	open_grammar(Domain, 'User'),
	format(gf_abs, 'abstract ~wUser = \n', [Domain]),
	format(gf_abs, '    GodisUser, ~wData ** {\n\n', [Domain]),
	format(gf_sem, 'concrete ~wUserSem of ~wUser = \n', [Domain, Domain]),
	format(gf_sem, '    GodisUserSem, ~wDataSem ** \n', [Domain]),
	format(gf_sem, '    open Prolog, ~wSystemSem in {\n\n', [Domain]),
	format(gf_cnc, 'incomplete concrete ~wUserI of ~wUser = \n', [Domain, Domain]),
	format(gf_cnc, '    GodisUserI, ~wDataI ** \n', [Domain]),
	format(gf_cnc, '    open Grammar, GodisLang, ~wSystem, ~wLexicon in {\n\n', [Domain, Domain]),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Answers')),
	doall(( Pred :: 'Predicate',

		Pred has usrAnswer = Tree,
		expand_tree(Tree, ETree, Args),
		gen_number(Num),
		atom_concat(Pred, Num, Pred0),
		
		preds2cats(Args, Cats),
		gfprint(gf_abs, fun(Pred0, Cats, 'Answer')),

		Tree ::.. Cat, Cat << 'Syntax',
		atom_concat(use_, Cat, UseCat),
		gfprint(gf_cnc, lin(Pred0, Args, tree(UseCat, [ETree]))),

		findall(Sem, (   member(Arg, Args),
				 user_semantics(Arg, Sem)
			     ), Sems),
		length(Sems, N),
		atom_concat(pm, N, PM),
		gfprint(gf_sem, lin(Pred0, Args, tree(PM, Sems)))
	      )),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Questions')),
	doall(( Pred :: 'Predicate',

		Pred has usrQuestion = Tree,
		expand_tree(Tree, ETree, Args),
		gen_number(Num),
		atom_concat(Pred, Num, Pred0),
		
		preds2cats(Args, Cats),
		gfprint(gf_abs, fun(Pred0, Cats, 'Question')),

		Tree ::.. Cat, Cat << 'Syntax',
		atom_concat(use_, Cat, UseCat),
		gfprint(gf_cnc, lin(Pred0, Args, tree(UseCat, [ETree]))),

		findall(Sem, (   member(Arg, Args),
				 user_semantics(Arg, Sem)
			     ), Sems),
		length([_|Sems], N),
		atom_concat(pm, N, PM),
		atom_concat(Pred, '\'', PredSys),
		Ask = tree(ask, [tree(PredSys)]),
		gfprint(gf_sem, lin(Pred0, Args, tree(PM, [Ask|Sems])))
	      )),

	gfprint([gf_abs,gf_sem,gf_cnc], comment('Short answers')),
	doall(( Sort :: 'Sort',

		Sort has usrAnswer = Tree,
		expand_tree(Tree, ETree, Args),
		gen_number(Num),
		atom_concat(Sort, Num, Sort0),
		
		preds2cats(Args, Cats),
		gfprint(gf_abs, fun(Sort0, Cats, 'ShortAns')),

		Tree ::.. Cat, Cat << 'Syntax',
		atom_concat(use_, Cat, UseCat),
		gfprint(gf_cnc, lin(Sort0, Args, tree(UseCat, [ETree]))),

		findall(Sem, (   member(Arg, Args),
				 user_semantics(Arg, Sem)
			     ), Sems),
		length(Sems, N),
		atom_concat(pm, N, PM),
		gfprint(gf_sem, lin(Sort0, Args, tree(PM, Sems)))
	      )),
	
	gfprint([gf_abs,gf_sem,gf_cnc], comment('Actions')),
	doall(( Act :: 'Action',

		Act has usrRequest = Tree,
		expand_tree(Tree, ETree, Args),
		gen_number(Num),
		atom_concat(Act, Num, Act0),
		
		preds2cats(Args, Cats),
		gfprint(gf_abs, fun(Act0, Cats, 'Action')),

		Tree ::.. Cat, Cat << 'Syntax',
		atom_concat(use_, Cat, UseCat),
		gfprint(gf_cnc, lin(Act0, Args, tree(UseCat, [ETree]))),

		findall(Sem, (   member(Arg, Args),
				 user_semantics(Arg, Sem)
			      ), Sems),
		length([_|Sems], N),
		atom_concat(pm, N, PM),
		Req = tree(request, [tree(Act)]),
		gfprint(gf_sem, lin(Act0, Args, tree(PM, [Req|Sems])))
	      )),

	close_grammar.

user_semantics(Pred, tree(Type, [tree(Pred, [var(Pred)])])) :-
	( Pred :: 'Predicate' -> Type = answer
	; Pred :: 'Sort'      -> Type = shortAns
	; error(['argument must be a predicate or a sort', Pred])
	).


%% language specific grammars

language_grammars(Domain) :-
	%% abstract lexicon grammar
	open_file([Domain,'Lexicon.gf'], gf_abs),
	gfheader(GFHdr),
	write(gf_abs, GFHdr),
	format(gf_abs, 'abstract ~wLexicon = Cat ** {\n\n', [Domain]),
	doall(( lexeme(Lex),
		Lex :: Cat,
		gfprint(gf_abs, fun(Lex, [], Cat))
	      )),
	write(gf_abs, '}\n'),
	close(gf_abs),

	%% language-specific instances of incomplete grammars
	doall(( Lng :: 'Language',
		specific_instance(Domain, Lng, 'System'),
		specific_instance(Domain, Lng, 'User')
	      )).

specific_instance(Domain, Lng, Part) :-
	open_file([Domain,Part,Lng,'.gf'], gf_cnc),
	gfpath(GFPath),
	write(gf_cnc, GFPath),
	doall(( Lng has resourcePath = Res,
		write(gf_cnc, ':resource-1.0/'),
		write(gf_cnc, Res)
	      )),
	automessage(Mess),
	format(gf_cnc, '\n\n-- ~w\n\n', [Mess]),

	format(gf_cnc, 'concrete ~w~w~w of ~w~w = \n', [Domain, Part, Lng, Domain, Part]),
	format(gf_cnc, '    Godis~w~w, ~wData~w ** \n', [Part, Lng, Domain, Lng]),
	format(gf_cnc, '    ~w~wI with \n', [Domain, Part]),
	( Part = 'User' -> 
	    format(gf_cnc, '    (~wSystem=~wSystem~w), \n', [Domain, Domain, Lng])
	; true ),
	format(gf_cnc, '    (Grammar=Grammar~w), \n', [Lng]),
	format(gf_cnc, '    (GodisLang=GodisLang~w), \n', [Lng]),
	format(gf_cnc, '    (~wLexicon=~wLexicon~w); \n', [Domain, Domain, Lng]),
	close(gf_cnc).


%% collecting all lexemes used by the domain

:- dynamic lexeme/1.

retract_lexemes :-
	retractall(lexeme(_)).

add_lexeme(Lex) :-
	( lexeme(Lex) -> true
	; assert(lexeme(Lex))
	).


%% generating unique numbers (or rather atoms of the form '_NNN')

reset_numbering :-
	reset_gensym('_').

gen_number(Num) :-
	gensym('_', Num).


%% converting predicates to GF categories
%% (used in the abstract type signature)

preds2cats([], []).
preds2cats([Pred|Preds], [Cat|Cats]) :-
	pred2cat(Pred, Cat),
	preds2cats(Preds, Cats).

pred2cat(Pred, Cat) :-
	( Pred :: 'Predicate' ->
	    Pred has sort = Sort
	; Pred = Sort ),
	Sort has class = Cat.


%% expanding GF syntax trees

expand_tree(Tree, ETree, Args) :-
	expand_tree(Tree, ETree, [], ArgsR),
	reverse(ArgsR, Args).

expand_tree(Tree, ETree, ArgsIn, ArgsOut) :-
	Tree :: Type,
	( Type << 'Semantics' ->
	    ETree = var(Tree),
	    ArgsOut = [Tree | ArgsIn]
	; Type << 'Syntax' ->
	    add_lexeme(Tree),
	    ETree = tree(Tree),
	    ArgsIn = ArgsOut
	;
	    ETree = tree(Type, Values),
	    concat_atom(Atoms, '_', Type),
	    traverse(Atoms, Tree, Type, Values, ArgsIn, ArgsOut)
	).

traverse([], _, _, [], Args, Args).
traverse([Cat|Atoms], Tree, Type, [Val|Values], ArgsIn, ArgsOut) :-
	atom_concat(dtr, Cat, Prop),
	domain(Prop, Type), range(Prop, Cat),
	!, ( Tree has Prop = Dtr ->
	       expand_tree(Dtr, Val, ArgsIn, ArgsMid),
	       traverse(Atoms, Tree, Type, Values, ArgsMid, ArgsOut)
	   ;
	       error(['missing argument', Cat, 'in tree', Tree, 'of type', Type])
	   ).
traverse([_|Atoms], Tree, Type, Values, ArgsIn, ArgsOut) :-
	traverse(Atoms, Tree, Type, Values, ArgsIn, ArgsOut).


%% printing of GF terms

gfprint(Streams, Term) :-
	is_list(Streams),
	!, doall(( member(Stream, Streams),
		   gfprint(Stream, Term)
		 )).
% gfprint(Stream, Term) :-
% 	current_output(Current),
% 	set_output(Stream),
% 	%% write(Stream:' '), 
% 	gfprint(Term),
% 	set_output(Current).

gfprint(S, cat(Cat)) :-
	!, format(S, 'cat ~w;\n', [Cat]).
gfprint(S, fun(Name, Args, Cat)) :-
	!, format(S, 'fun ~w : ~@~w;\n', [Name, prt_args(Args), Cat]).
gfprint(S, lincat(Cat, Lincat)) :-
	!, format(S, 'lincat ~w = ~w;\n', [Cat, Lincat]).
gfprint(S, lin(Name, Vars, Tree)) :-
	!, findall(var(Var), member(Var, Vars), Vars2),
	format(S, 'lin ~w ~@ = ~@;\n', [Name, prt_trees(Vars2), prt_tree(Tree)]).
gfprint(S, comment(Comment)) :-
	!, format(S, '\n-- ~w\n', [Comment]).

prt_args([]).
prt_args([X|Xs]) :- format('~w -> ~@', [X, prt_args(Xs)]).

prt_tree(Tree1 * Tree2) :-
	!, prt_tree(Tree1), write(' ** '), prt_tree(Tree2).
prt_tree(tree(Node, Trees)) :-
	!, ( Trees == [] -> write(Node)
	   ; format('(~w ~@)', [Node, prt_trees(Trees)])
	   ).
prt_tree(tree(Node)) :-
	!, write(Node).
prt_tree(terminal(Term)) :-
	!, format('["~w"]', [Term]).
prt_tree(var(Term)) :-
	!, format('x_~w', [Term]).
prt_tree(variants(Terms)) :-
	( Terms = [Term] -> prt_tree(Term)
	; format('variants{~@}', [prt_trees(Terms, ' ; ')])
	).
prt_tree(Tree) :- write(Tree).

prt_trees(Ts) :- prt_trees(Ts, ' ').

prt_trees([], _).
prt_trees([T|Ts], Sep) :-
	prt_tree(T),
	( Ts = [] -> true ; write(Sep) ),
	prt_trees(Ts, Sep).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% generic OWL predicates

short(Short, Long) :-
	\+ compound(Short),
	ontology(Ontology, _),
	atom_concat(Ontology, '#', Prefix),
	atom_concat(Prefix, Short, Long).
short(rdf:Short, Long) :-
	atom_concat('rdf:', Short, Long).
short(rdfs:Short, Long) :-
	atom_concat('rdfs:', Short, Long).
short(owl:Short, Long) :-
	atom_concat('owl:', Short, Long).

class(Class) :-
	class(ClassL, _, _, _, _),
	short(Class, ClassL).

Sub << Super :-
	subclassOf(SubL, SuperL),
	short(Sub, SubL),
	short(Super, SuperL).

Sub <<.. Super :- Sub << Sup0,
	( Sup0 = Super ; Sup0 <<.. Super ).

individual(Ind) :-
	individual(IndL, _, _, _),
	short(Ind, IndL).

Ind :: Type :-
	individual(IndL, _, Types, _),
	short(Ind, IndL),
	member(TypeL, Types),
	short(Type, TypeL).

Ind ::.. Type :- Ind :: Sub,
	( Sub = Type ; Sub <<.. Type ).

Ind has Prop = Val :-
	individual(IndL, _, _, Values),
	short(Ind, IndL),
	member(value(PropL, ValL), Values),
	short(Prop, PropL),
	( atom(ValL) ->
	    short(Val, ValL)
	; ValL = literal(type(_, Val))
	; ValL = literal(lang(_, Val))
	).

Ind hasAnnotation Prop = Val:Lng :-
	individual(IndL, Annotations, _, _),
	short(Ind, IndL),
	member(annotation(PropL, literal(Lit)), Annotations),
	short(Prop, PropL),
	( Lit = type(_, Val)
	; Lit = lang(Lng, Val)
	).

property(Prop) :-
	property(PropL, _, _, _, _, Domains, Ranges),
	( Domains = [_], Ranges = [_] ->
	    short(Prop, PropL)
	;
	    throw('all properties must have a domain and a range')
	).

domain(Prop, Domain) :-
	property(PropL, _, _, _, _, [Domains], _),
	short(Prop, PropL),
	description_member(DomainL, Domains),
	short(Domain, DomainL).

range(Prop, Range) :-
	property(PropL, _, _, _, _, _, [Ranges]),
	short(Prop, PropL),
	description_member(RangeL, Ranges),
	short(Range, RangeL).

description_member(Obj, unionOf(Descrs)) :-
	!, member(Obj, Descrs).
description_member(_, intersectionOf(_)) :-
	!, error(['cannot handle intersections']).
description_member(_, complementOf(_)) :-
	!, error(['cannot handle complements']).
description_member(Obj, Obj).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% utilities

open_file(AtomList, Stream) :-
	concat_atom(AtomList, File),
	nl,
	format('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n', []),
	format('>> Creating file: ~w = ~w\n', [Stream, File]),
	open(File, write, _, [alias(Stream)]).
	%% set_stream(user_output, alias(Stream)).

doall(Goal) :- \+ ( Goal, fail ).

error(Error) :-
	throw(Error).

