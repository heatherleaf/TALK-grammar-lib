%% This file was automatically created by owl_godis.pl


%% sem_sort(?ind, ?sort)
sem_sort(hogenskildsgatan, stop).
sem_sort(lilla_bommen, stop).
sem_sort(brunnsparken, stop).
sem_sort(rosenlund, stop).
sem_sort(korsvagen, stop).
sem_sort(valand, stop).
sem_sort(klippan, stop).
sem_sort(lindholmen, stop).
sem_sort(kungsportsplatsen, stop).
sem_sort(oneLeg, route).
sem_sort(mkRoute, route).

%% sem_sort(?action, action)
sem_sort(help, action).
sem_sort(top, action).

%% isa(?sort, ?sort)
isa(stop, location).

%% isa(?predicate, ?sort)
isa(destination, stop).
isa(departure, stop).
isa(shortest_route, route).

%% sort_restr(+proposition)
sort_restr(destination(X)) :- sem_sort(X, stop).
sort_restr(departure(X)) :- sem_sort(X, stop).
sort_restr(shortest_route(X)) :- sem_sort(X, route).

%% valid_parameter(+proposition)
%% uses hook predicate valid_param(+proposition)
valid_parameter(P) :- clause(valid_param(P), _), !, valid_param(P).
valid_parameter(P) :- sort_restr(P).

%% plan(?name, ?list of plan constructs)
plan(find_route, [
	findout(X^departure(X)),
	findout(X^destination(X)),
	dev_query(tram_solver, X^shortest_route(X)),
	dev_do(tram_solver, draw_route)]).
postcond(find_route, status(draw_route, failed(_))).
postcond(find_route, done(draw_route)).
