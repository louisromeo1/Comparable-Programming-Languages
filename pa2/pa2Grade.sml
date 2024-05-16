fun check (exp, act, score) = if exp = act then score else 0.0;
val score = 0.0;

val iList = [1,9,0,2,~3,4,6];
val sList = ["zebra", "dog", "cat", "bird", "antelope"];
val pList = [(8,2),(~4,~5),(7,~2),(9,0),(2,2),(4,~1)];
val ilList = [[6,1,2,8],[],[2,5,3,7],[1,2],[0,9,9]];

(*Question 1*)
print("\ntesting quicksort\n");
val act = quicksort (op >) iList;
val score = score + check([9,6,4,2,1,0,~3], act, 1.5); 
val act = quicksort (op <) sList; 
val score = score + check(["antelope","bird","cat","dog","zebra"], act, 1.5); 

(*Question 2*)
print("\ntesting bubblesort\n");
val act = implode(bubblesort (op <) (explode "wildcats"));
val score = score + check("acdilstw", act, 1.5); 
val act = bubblesort (fn (s,t) => length(explode s) < length(explode t)) sList;
val score = score + check(["cat","dog","bird","zebra","antelope"], act, 1.5); 
val score = score + check(["dog","cat","bird","zebra","antelope"], act, 1.5);

(*Question 3*)
print("\ntesting insertion sort\n");
val act = insertionSort (fn ((a,b),(c,d)) => a*b > c*d) [(1,2),(3,4),(5,1),(6,3)];
val score = score + check([(6,3),(3,4),(5,1),(1,2)], act, 1.5); 
val act = implode(insertionSort (op >) (explode "armadillo")); 
val score = score + check("romllidaa", act, 1.5); 

(*Question 4*)
print("\ntesting substring\n");
val act = substring "cat" "wildcats";
val score = score + check(true, act, 1.5); 
val act = substring "dog" "wildcats";
val score = score + check(false, act, 1.5); 

(*Question 5*)
print("\ntesting indexOf\n");
val act = indexOf 3 iList; 
val score = score + check(~1, act, 1.5); 
val act = indexOf #"i" (explode "Arizona");
val score = score + check(2, act, 1.5); 

(*Question 6*)
print("\ntesting dec2baseN\n");
val act = dec2baseN 2 82;
val score = score + check("1010010", act, 1.5); 
val act = dec2baseN 8 100;
val score = score + check("144", act, 1.5); 

(*Question 7*)
print("\ntesting dropNth\n");
val act = dropNth 4 [1,2,3,4,5,6,7,8,9,0];
val score = score + check([1,2,3,5,6,7,9,0], act, 1.5); 
val act = implode(dropNth 3 (explode("University of Arizona")));
val score = score + check("Unvesiy f rion", act, 1.5); 

(*Question 8*)
print("\ntesting best\n");
val act = best (op >) iList;
val score = score + check(9, act, 1.5); 
val act = best (op <) sList;
val score = score + check("antelope", act, 1.5); 

(*Question 9*)
print("\ntesting sortPairs\n");
val act = sortPairs pList;
val score = score + check([(2,8),(~5,~4),(~2,7),(0,9),(2,2),(~1,4)], act, 3.0); 

(*Question 10*)
print("\ntesting flattenL\n");
val act = flattenL ilList;
val score = score + check([6,1,2,8,2,5,3,7,1,2,0,9,9], act, 1.5); 
val act = implode(flattenL [explode "ant", explode "bee", explode "cactus"]); 
val score = score + check("antbeecactus", act, 1.5); 

(*Question 11*)
print("\ntesting flattenP\n");
val act = flattenP pList;
val score = score + check([8,2,~4,~5,7,~2,9,0,2,2,4,~1], act, 1.5); 
val act = flattenP [("apple", "bear"),("cod", "dog"),("egg", "eat")];
val score = score + check(["apple", "bear", "cod", "dog", "egg", "eat"], act, 1.5);  

(*Question 12*)
print("\ntesting remove\n");
val act = remove 5 [5,5,1,5,9,0,5,2,~3,5,4,5,5,5,6,5];
val score = score + check(iList, act, 1.5); 
val act = implode(remove #"s" (explode "susie sells seashells at the seashore"));
val score = score + check("uie ell eahell at the eahore", act, 1.5); 

(*Question 13*)
print("\ntesting apply2DList\n");
val act = apply2DList (op ~) ilList; 
val score = score + check([[~6,~1,~2,~8],[],[~2,~5,~3,~7],[~1,~2],[0,~9,~9]], act, 1.5); 
val act = apply2DList floor [[2.3, 4.5],[],[~1.2, 6.8, ~9.0],[2.77, ~1.1, ~0.88]];
val score = score + check([[2,4],[],[~2,6,~9],[2,~2,~1]], act, 1.5); 

(*Question 14*)
print("\ntest condenseLists\n");
val act = condenseLists (op * ) 1 ilList;
val score = score + check([96,1,210,2,0], act, 1.5); 
val act = condenseLists (op ^) "" [["a","b","c"], ["d","e"], ["f"], [], ["g","h","i","j"]];
val score = score + check(["abc", "de", "f", "", "ghij"], act, 1.5); 
val score = score + check(["cba", "ed", "f", "", "jihg"], act, 1.5); 

(*Question 15*)
print("\ntest removeF\n");
val act = removeF (fn x => x < 1 orelse x > 5)  iList; 
val score = score + check([1,2,4], act, 1.5); 
val act = implode(removeF (fn x => x = #"a" orelse x = #"e") (explode "susie sells seashells at the seashore"));
val score = score + check("susi slls sshlls t th sshor", act, 1.5); 
