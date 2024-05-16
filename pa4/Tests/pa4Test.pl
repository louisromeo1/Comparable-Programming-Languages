consFiles :- consult(graphs), consult(pa4Verify), consult(pa4), !.

test1 :- write("\n\ntesting kclique"), write("\ntest1\n"), not(kclique([a,b,c,d,e,f,g,h,i,j,k,l], _, 6)), !.
test2 :- write("\ntest2\n"), G = [a,b,c,d,e,f,g,h,i,j,k,l], kclique(G,C,5), kc(G,C,5), !.
test3 :- write("\ntest3\n"), G = [a,b,c,d,e,f,g,h], kclique(G,C,4), kc(G,C,4), !.
test4 :- write("\ntest4\n"), G = [m,n,o,p,q,r], kclique(G,C,3), kc(G,C,3), !.

test5 :- write("\n\ntesting hamiltonianPath"), write("\ntest5\n"), G = [s,t,u,v,w], not(hamiltonianPath(G,_)), !.
test6 :- write("\ntest6\n"), G = [a,b,c,d,e,f,g,h], hamiltonianPath(G,P), hp(G,P), !.
test7 :- write("\ntest7\n"), G = [a,b,c,d,e,f,g,h,i,j,k,l], hamiltonianPath(G,P), hp(G,P), !.
test8 :- write("\ntest8\n"), G = [m,n,o,p,q,r], hamiltonianPath(G,P), hp(G,P), !.

test9 :- write("\n\ntesting hamiltonianCycle"), write("\ntest9\n"), G = [a,b,c,d,e,f,g,h], not(hamiltonianCycle(G,_)), !.
test10 :- write("\ntest10\n"), G = [a,b,c,d,e,f,g,h,i,j,k], hamiltonianCycle(G,C), hc(G,C), !.
test11 :- write("\ntest11\n"), G = [m,n,o,p,q,r], hamiltonianCycle(G,C), hc(G,C), !.
test12 :- write("\ntest12\n"), G = [s,t,u,v,w,x,y,z], hamiltonianCycle(G,C), hc(G,C), !.

test13 :- write("\n\ntesting dominatingSet\n"), write("\ntest13\n"), G = [s,t,u,v], dominatingSet(G,D,1), ds(G,D,1).
test14 :- write("\ntest14\n"), G = [m,n,o,p,q,r], not(dominatingSet(G,_,1)), !.
test15 :- write("\ntest15\n"), G = [m,n,o,p,q,r], dominatingSet(G,D,2), ds(G,D,2), !.
test16 :- write("\ntest16\n"), G = [a,b,c,d,e,f,g,h,i,j,k,l], dominatingSet(G,D,4), ds(G,D,4), !.

test17 :- write("\n\ntesting spanning cycle\n"), write("\ntest17\n"), G = [a,b,c,d,e,f,g], not(spanningCycle(G,5,_,_)), !.
test18 :- write("\ntest18\n"), G = [m,n,o,p,q,r], spanningCycle(G,12,C,D), sc(G,12,C,D), !.
test19 :- write("\ntest19\n"), G = [s,t,u,v,w,x,y,z], spanningCycle(G,10,C,D), sc(G,10,C,D), !.
test20 :- write("\ntest20\n"), G = [a,b,c,d,e,f,g,h,i], spanningCycle(G,12,C,D), sc(G,12,C,D), !.

testQ1 :- 
test1,
test2,
test3,
test4,
!.

testQ2 :-
test5,
test6,
test7,
test8,
!.

testQ3 :-
test9,
test10,
test11,
test12,
!.

testQ4 :-
test13,
test14,
test15,
test16,
!.

testQ5 :-
test17,
test18,
test19,
test20,
!.

testAll :-
testQ1,
testQ2,
testQ3,
testQ4,
testQ5,
!.


