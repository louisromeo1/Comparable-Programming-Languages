(*Question 1*)
quicksort (op <) [3,1,5,2,6,7]; (* Exp: [1,2,3,5,6,7] *)
quicksort (op >) [1.2, 4.5, ~1.1]; (* Exp: [4.5, 1.2, ~1.1] *)

(*Question 2*)
implode(bubblesort (op <) (explode "computer science")); (* Exp: " ccceeeimnoprstu" *)
bubblesort (fn ((a,b),(c,d)) => a + b < c + d) [(1,2),(0,5),(~1,7),(2,3)]; (* Exp: [(1,2),(2,3),(0,5),(~1,7)]*)

(*Question 3*)
insertionSort (op <) [1.2, 4.5, ~1.1]; (* Exp: [~1.1, 1.2, 4.5] *)
implode(insertionSort (op >) (explode "computer science")); (* Exp: "utsrponmieeeccc " *)

(*Question 4*)
substring "hello" "hello, world!"; (* Exp: true *)
substring "world" "hello, world!"; (* Exp: true *)
substring "hi" "hello, world!"; (* Exp: false *)

(*Question 5*)
indexOf 3 [7,1,2,3,8,9]; (* Exp: 3 *)
indexOf 3 [1, 4, 7, 9, 0]; (* Exp: ~1 *)
indexOf #"s" (explode "bananas!"); (* Exp: 6 *)

(*Question 6*)
dec2baseN 2 45; (* Exp: "101101" *)
dec2baseN 3 45; (* Exp: "1200" *)
dec2baseN 10 45; (* Exp: "45" *)

(*Question 7*)
dropNth 3 [1,2,3,4,5,6,7,8,9]; (* Exp: [1,2,4,5,7,8] *)
implode(dropNth 2 (explode("hello, world!"))); (* Exp: "hlo ol!" *) 

(*Question 8*)
best (op <) [1.2, 4.5, ~3.3, 0.9, ~1.8]; (* Exp: ~3.3 *)
best (fn(s, t) => length(explode s) > length(explode t)) ["apple", "peach", "banana", "pear"]; (* Exp: "banana" *)

(*Question 9*)
sortPairs [(1,4),(0,~1),(9,4)]; (* Exp: [(1,4),(~1,0),(4,9)] *);

(*Question 10*)
flattenL [[1,2,3],[4,5],[],[6,7,8,9],[0]]; (* Exp: [1,2,3,4,5,6,7,8,9,0] *)
implode(flattenL [explode "apple", explode "banana"]); (* Exp: "applebanana" *)

(*Question 11*)
flattenP [(1,2),(3,4),(5,6)]; (* Exp: [1,2,3,4,5,6] *)
flattenP [(1.1,2.2),(3.4,5.6)]; (* Exp: [1.1,2.2,3.4,5.6] *)

(*Question 12*)
remove 0 [1,0,2,0,3,0,4,0,0,5,6,7,8,9,0]; (* Exp: [1,2,3,4,5,6,7,8,9] *)
implode(remove #"a" (explode "bananas")); (* Exp: "bnns" *)

(*Question 13*)
apply2DList (fn x => x + 1) [[1,2,3],[],[4,5],[6,7,8,9],[0]]; (* Exp: [[2,3,4],[],[5,6],[7,8,9,10],[1]] *)
apply2DList ord [explode "apple", explode "peach"]; (* Exp: [[97,112,112,108,101],[112,101,97,99,104]]*)

(*Question 14*)
condenseLists (op +) 0 [[1,2,3],[4,5,6,7],[8,9,0]]; (* Exp: [6,22,17] *)
condenseLists (op -) 0.0 [[1.2, 3.4, 5.6],[2.2]];
(* Exp: [3.4,2.2] *)

(*Question 15*)
removeF (fn x => x < 0) [1, ~2, 3, 4, ~5, 7, 8, ~9]; (* Exp: [1, 3, 4, 7, 8] *)
removeF (fn s => hd(explode s) = #"a") ["apple", "peach", "pear", "avocado", "banana"]; (* Exp: ["peach", "pear", "banana"] *)
