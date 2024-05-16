% Louis Romeo %
% CSC 372 PA4 %
% 4/11/2024 %

% Question 1 %
% Predicate to check if a list is a clique in the graph
is_clique([], _).
is_clique([_], _).
is_clique([X|Xs], G) :-
    member(X, G),
    all_connected(X, Xs, G),
    is_clique(Xs, G).

% Helper to check if all vertices in a list are connected to a vertex
all_connected(_, [], _).
all_connected(X, [Y|Ys], G) :-
    member(edge(X, Y, _), G),
    all_connected(X, Ys, G).
all_connected(X, [Y|Ys], G) :-
    member(edge(Y, X, _), G),
    all_connected(X, Ys, G).

% Predicate to find a clique of size K in the graph
kclique(G, C, K) :-
    length(C, K),
    is_clique(C, G).

% Question 2 %
% Predicate to check if a vertex dominates the graph
dominates_vertex(_, [], _).
dominates_vertex(V, [edge(V,_,_)|_], _).
dominates_vertex(V, [edge(_,V,_)|_], _).
dominates_vertex(V, [edge(U,_,_)|Edges], Visited) :-
    \+ member(U, Visited),
    dominates_vertex(V, Edges, [U|Visited]).
dominates_vertex(V, [edge(_,U,_)|Edges], Visited) :-
    \+ member(U, Visited),
    dominates_vertex(V, Edges, [U|Visited]).

% Predicate to check if a set of vertices dominates the graph
dominates_set(_, [], _).
dominates_set(G, [V|Vs], Visited) :-
    dominates_vertex(V, G, Visited),
    dominates_set(G, Vs, Visited).

% Predicate to find a dominating set of a given size
dominatingSet(G, D, S) :-
    subsets(G, Subset),
    length(Subset, S),
    dominates_set(G, Subset, []),
    D = Subset.

% Question 3 %
% Predicate to check if a path is Hamiltonian
hamiltonian_path([], _).
hamiltonian_path([_], _).
hamiltonian_path([X,Y|Rest], G) :-
    member(edge(X,Y,_), G),
    hamiltonian_path([Y|Rest], G).

% Predicate to find a Hamiltonian path in the graph
hamiltonianPath(G, P) :-
    permutation(G, Perm),
    hamiltonian_path(Perm, G),
    P = Perm.

% Question 4 %
% Predicate to check if a path is a Hamiltonian cycle
hamiltonian_cycle([X,Y|Rest], G) :-
    member(edge(X,Y,_), G),
    append(Rest, [X], Path),
    hamiltonian_path(Path, G).

% Predicate to find a Hamiltonian cycle in the graph
hamiltonianCycle(G, C) :-
    append(G, [FirstVertex], Cycle),
    hamiltonian_cycle(Cycle, G),
    C = Cycle.

% Question 5 %
% Helper predicate to find all possible cycles in a graph
cycle(G, C) :-
    member(Node, G),
    cyclicPath(G, Node, Node, [], C).
cyclicPath(_, Start, Node, Path, [Node | Path]) :-
    member(Start, Node).
cyclicPath(G, Start, Node, Path, Cycle) :-
    member(Next, G),
    Next \= Start,
    \+ member(Next, Path),
    cyclicPath(G, Start, Next, [Node | Path], Cycle).

% Helper predicate to calculate the total weight of a cycle
cycleWeight(_, [], 0).
cycleWeight(G, [X | []], Weight) :-
    last([X | []], Y),
    edgeWeight(G, X, Y, Weight).
cycleWeight(G, [X, Y | Rest], Weight) :-
    edgeWeight(G, X, Y, W1),
    cycleWeight(G, [Y | Rest], W2),
    Weight is W1 + W2.

% Helper predicate to get the weight of an edge
edgeWeight(G, X, Y, Weight) :-
    member(edge(X, Y, Weight), G);
    member(edge(Y, X, Weight), G).

% Main predicate to find a spanning cycle with given maximum weight
spanningCycle(G, MaxWeight, Cycle, TotalWeight) :-
    cycle(G, Cycle),
    cycleWeight(G, Cycle, TotalWeight),
    TotalWeight = MaxWeight.
