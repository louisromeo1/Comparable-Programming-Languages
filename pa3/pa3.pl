% Louis Romeo
% CSC 372 PA3
% 3/26/2024

% Question 1 
teammate(X, Y) :-
    team(Z, X),
    team(Z, Y),   
    X \= Y,     
    manager(Z, M),
    manager(X, M),
    manager(Y, M).

% Question 2
bossOfBoss(X, Y) :-
    boss(X, Z),      % X is the boss of Z
    boss(Z, Y).      % Z is the boss of Y

% Question 3
superior(X, Y) :-
    superior(X, Z), % X is a superior to Z
    superior(Z, Y). % Z is a superior to Y

% Question 4
sameRank(X, Y) :-
    boss(Z, X),       % Z is the boss of X
    boss(Z, Y),       % Z is also the boss of Y
    X \= Y.           % X and Y are not the same person
sameRank(X, Y) :-
    boss(A, X),       % A is the boss of X
    boss(B, Y),       % B is the boss of Y
    A \= B,           % A and B are not the same person
    boss(C, A),       % C is the boss of A
    boss(C, B),       % C is also the boss of B
    X \= Y.           % X and Y are not the same person

% Question 5
chainOfCommand([X]) :-
    \+ boss(_, X).             % X has no boss
chainOfCommand([X|Rest]) :-
    boss(Y, X),                % Y is the boss of X
    chainOfCommand([Y|Rest]).  

% Question 6
triangle(A, B, C) :-
  A + B > C,
  A + C > B,
  B + C > A.

% Question 7
delete3([_A,_B,_C|Tail], Tail).

% Question 8
swap2([X,Y|Z], [Y,X|Z]).

% Question 9
last(X, [X]). % Base case: X is the last element
last(X, [_|Tail]) :- last(X, Tail). % Recursion: X is the last element

% Question 10
mirror([], []). % Base case: an empty list
mirror([X], [X]). % Base case: A single element
mirror([X|Xs], Y) :- % Recursive case
    mirror(Xs, Ys), 
    append(Ys, [X], Y1),
    append(Y1, Ys, Y).

% Question 11
mirror2([], []).
mirror2([X], [X]).
mirror2([X|Xs], Y) :-
    append(Mid, [Last], Xs), % Split the list
    reverse(Mid, RevMid),    % Reverse the middle
    mirror2(RevMid, RevMidMirror), % Mirror
    append(RevMidMirror, [Last|RevMid], Y). % Combine

% Question 12
even([]). % Base case: An empty list
even([_,_|Xs]) :- even(Xs). % Recursive case

% Question 13
repeatList([], []).
repeatList([X|Xs], [X,X|Ys]) :-
    repeatList(Xs, Ys).

% Question 14
evens([], []).
evens([X|Xs], [X|Ys]) :-
    odd_length(Xs),
    evens(Xs, Ys).
evens([_|Xs], Ys) :-
    even_length(Xs),
    evens(Xs, Ys).
odd_length([_|_]).
even_length([]).
even_length([_|Xs]) :-
    odd_length(Xs).

% Question 15
odds([], []).
odds([_|Xs], Ys) :-
    evens(Xs, Ys).
evens([], []).
evens([X|Xs], [X|Ys]) :-
    odds(Xs, Ys).

% Question 16
doubleList([], []).
doubleList([X|Xs], [Y|Ys]) :-
    Y is X * 2,
    doubleList(Xs, Ys).

% Question 17
merge([], Y, Y).
merge(X, [], X).
merge([X|Xs], [Y|Ys], [X|Zs]) :-
    X =< Y,
    merge(Xs, [Y|Ys], Zs).
merge([X|Xs], [Y|Ys], [Y|Zs]) :-
    X > Y,
    merge([X|Xs], Ys, Zs).

% Question 18
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Question 19
removeAll(_, [], []).         % Base case: An empty list
removeAll(X, [X|Xs], Ys) :-   % Check matches
    removeAll(X, Xs, Ys).
removeAll(X, [Y|Xs], [Y|Ys]) :-
    X \= Y,
    removeAll(X, Xs, Ys).

% Question 20
removeDuplicates([], []).
removeDuplicates([X|Xs], Ys) :-
    member(X, Xs), 
    !,    % Cut to prevent backtracking further
    removeDuplicates(Xs, Ys).
removeDuplicates([X|Xs], [X|Ys]) :-
    removeDuplicates(Xs, Ys).

% Question 21
sum([], 0).         % Base case: empty list
sum([X|Xs], S) :-   % Recursive case
    sum(Xs, S1),     % Recursively calculate sum
    S is X + S1.     % Add the head to sum of tail

% Question 22
subset([], _). % Base case: An empty list
subset([X|Xs], Y) :- % Recursive case
    member(X, Y), 
    subset(Xs, Y). % Recursively check the rest

% Question 23
makeList(1, [1]). % Base case: If N is 1, the list contains only 1
makeList(N, [N|L]) :- % Recursive case
    N > 1,
    N1 is N - 1,
    makeList(N1, L). % Recurse

% Question 24
sumLists([], [], []). % Base case: Sum of two empty lists is an empty list
sumLists([X|Xs], [Y|Ys], [Z|Zs]) :- % Recursive case
    Z is X + Y, % Add corresponding elements from X and Y to get Z
    sumLists(Xs, Ys, Zs). % Recursively compute the sum for the rest of the lists

% Question 25
repeat(_, 0, []). % Base case: empty list
repeat(X, N, Z) :- % Recursive case
    N > 0, 
    N1 is N - 1, % Decrement N by 1
    repeat(X, N1, Z1), % Recurse
    append(X, Z1, Z). % Append X to Z1 to get Z

% company.txt
% manager(X,Y) means "X is the manager of Y"
manager(alice, bob).
manager(alice, carla).
manager(alice, dave).
manager(alice, elsa).
manager(alice, frank).
manager(bob, george).
manager(bob, harry).
manager(bob, inez).
manager(bob, juan).
manager(bob, kevin).
manager(george, keeley).
manager(inez, leon).
manager(leon, manuel).
manager(juan, nancy).
manager(nancy, ophelia).
manager(ophelia, parker).
manager(kevin, quincey).
manager(quincey, ray).
manager(dave, stephen).
manager(dave, tracy).
manager(tracy, violet).
manager(stephen, whitney).
manager(stephen, xavier).
manager(whitney, angelica).
manager(violet, zeke).
manager(violet, betty).
manager(violet, candace).
manager(violet, donna).
manager(elsa, eddie).
manager(eddie, francine).
manager(eddie, ginny).
manager(eddie, hans).
manager(ginny, iris).
manager(hans, jack).

team(Manager, Employee) :-
    manager(Manager, Employee).
team(Manager, Employee) :-
    manager(Manager, Subordinate),
    team(Subordinate, Employee).
