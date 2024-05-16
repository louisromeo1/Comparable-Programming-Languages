val score = 0.0;
fun check (a, b, s) = if a = b then s else 0.0;
fun compR (a, b) = (a >= b andalso a-b <= 0.0001)
orelse (b > a andalso b-a <= 0.0001);
fun checkR (a, b, s) = if compR(a,b) then s else 0.0;
fun checkRList (l1, l2, s) =
let
	fun help ([],[]) = true
	| help (x::xs, y::ys) = 
		compR(x,y) andalso help(xs,ys);
in
	if help(l1,l2) then s else 0.0
end;
		 

val iList = [1,5,2,6,3,7];
val rList = [1.2, ~3.4, 5.6, ~8.9];
val sList = ["Arizona", "Arkansas", "Alabama", "Connecticut", "Colorado"];
val cList = explode "This is a string!";
val iList2 = [3,4,1,0,9,2,2,3];
val sList2 = ["Phoenix", "Little Rock", "Montgomery", "Hartford", "Denver"];
val eList : int list = [];

(*1*)
(*fun triangle (a, b, c) =
a + b >= c andalso b + c >= a andalso a + c >= b;*)

print("\ntesting triangle\n");
val x = triangle (2, 3, 4);
val score = score + check(x, true, 1.0);
val x = triangle (5, 3, 1);
val score = score + check(x, false, 1.0); 
(* this function = 2.0, total = 2.0 *)

(*2*)
(*fun triangleR (a: real, b, c) =
a + b >= c andalso b + c >= a andalso a + c >= b;*)

print("\ntesting triangleR\n");
val x = triangleR (2.3, 5.6, 1.5);
val score = score + check(x, false, 1.0);
val x = triangleR (1.2, 1.5, 1.6);
val score = score + check(x, true, 1.0);
(* this function = 2.0, total = 4.0 *)

(*3*)
(*fun addPairs ((a,b),(c,d)) = (a+c,b+d);*)

print("\n\ntesting addPairs\n");
val (y, z) = addPairs ((~1,3),(6,~2));
val score = score + check(y, 5, 1.0);
val score = score + check(z, 1, 1.0);
(* this function = 2.0, total = 6.0 *)

(*4*)
(*fun cycle (0,x) = x
| cycle (_,[]) = []
| cycle (n,x::xs) = cycle(n-1,(xs@[x]));*)

print("\ntesting cycle\n");
val x = cycle (0, iList);
val score = score + check(x, iList, 0.5);
val x = cycle (5, eList);
val score = score + check(x, eList, 0.5);
val x = implode(cycle(3, cList));
val score = score + check(x, "s is a string!Thi", 1.0);
(* this function = 2.0, total = 8.0 *)

(*5*)
(*fun last [x] = x
| last (x::xs) = last xs;*)

print("\ntesting last\n");
val x = last [4];
val score = score + check(x, 4, 1.0);
val x = last sList;
val score = score + check(x, "Colorado", 1.0);
(* this function = 2.0, total = 10.0 *)

(*6*)
(*fun pairs ([],y) = []
| pairs (x,[]) = []
| pairs (x::xs,y::ys) = (x,y)::pairs(xs,ys);*)

print("\ntesting pairs\n");
val x = pairs(eList,iList);
val score = score + check(x, []:(int*int) list, 0.5);
val x = pairs(iList,eList);
val score = score + check(x, []:(int*int) list, 0.5);
val x = pairs(iList, iList2);
val score = score + check(x, [(1,3),(5,4),(2,1),(6,0),(3,9),(7,2)],1.0);
val x = pairs(sList2, sList);
val score = score + check(x, [("Phoenix","Arizona"), ("Little Rock","Arkansas"), ("Montgomery","Alabama"), ("Hartford","Connecticut"), ("Denver","Colorado")], 1.0); 
(* this function = 3.0, total = 13.0 *)

(*7*)
(*fun divideList ([],_) = []
| divideList (x::xs,y) = (x/y)::divideList(xs,y);*)

print("\ntesting divideList\n");
val x = divideList ([]:real list,5.0);
val score = score + checkRList(x,[]:real list,0.5);
val x = divideList (rList, ~2.0);
val score = score + checkRList(x,[~0.6, 1.7, ~2.8, 4.45],1.0);
val x = divideList (rList, 0.5);
val score = score + checkRList(x, [2.4, ~6.8, 11.2, ~17.8],1.0);
(* this function = 2.5, total = 15.5 *)

(*8*)
(*fun mirror [] = []
| mirror (x::xs) = (x::(mirror xs))@[x];*)

print("\ntesting mirror\n");
val x = mirror eList;
val score = score + check(x,[],0.5);
val x = mirror iList2;
val score = score + check(x, [3,4,1,0,9,2,2,3,3,2,2,9,0,1,4,3], 1.0);
val x = implode(mirror cList);
val score = score + check(x, "This is a string!!gnirts a si sihT", 1.0);
(* this function = 2.5, total = 18.0 *)

(*9*)
(*fun removeZeros [] = []
| removeZeros (0::xs) = removeZeros xs
| removeZeros (x::xs) = x::(removeZeros xs);*)

print("\ntesting removeZeros\n");
val x = removeZeros [];
val score = score + check(x,[],0.5);
val x = removeZeros iList;
val score = score + check(x, iList, 1.0);
val x = removeZeros [0,0,1,5,0,2,0,0,6,3,0,0,7,0,0,0];
val score = score + check(x, iList, 1.0);
(* this function = 2.5, total = 20.5 *)

(*10*)
(*fun gtList ([],_) = []
| gtList (x::xs,e) =
  if x > e then x::(gtList (xs,e))
  else (gtList (xs,e));*)

print("\ntesting gtList\n");
val x = gtList([],4);
val score = score + check(x, [], 0.5);
val x = gtList(iList, 3);
val score = score + check(x, [5,6,7], 1.0);
val x = gtList(iList2, 9);
val score = score + check(x, [], 1.0);
(* this function = 2.5, total = 23.0 *)

(*11*)
(*fun prefix ([],_) = true
| prefix (x,[]) = false
| prefix (x::xs,y::ys) = x = y andalso prefix (xs, ys);*)

print("\ntesting prefix\n");
val x = prefix(eList, iList);
val score = score + check(x, true, 0.5);
val x = prefix(iList,eList);
val score = score + check(x, false, 0.5);
val x = prefix(["Arizona", "Arkansas", "Alabama"], sList);
val score = score + check(x, true, 1.0);
val x = prefix(explode "This is not", cList);
val score = score + check(x, false, 1.0);
(* this function = 3.0, total = 26.0 *)

(*12*)
(*fun get (l, i) = if i = 0 then hd l else get (tl l, i-1);*)

print("\ntesting get\n");
val x = get (iList, 0);
val score = score + check(x, 1, 1.0);
val x = get (sList2, 3);
val score = score + check(x, "Hartford", 1.0);
val x = get (cList, 5);
val score = score + check(x, #"i", 1.0); 
(* this function = 3.0, total = 29.0 *)  

(*13*)
(*fun subList (l, i, j) = if i = j then get(l, i)::[] else get(l, i)::subList(l, i+1, j);*)

print("\ntesting subList\n");
val x = subList(cList, 6, 6);
val score = score + check(x, [#"s"], 1.0);
val score = score + check(x, [#"i"], 1.0);
val x = implode(subList(cList, 3, 8));
val score = score + check(x, "s is a", 1.0);
val score = score + check(x, "is is ", 1.0);
val x = subList (rList, 1, 2);
val score = score + checkRList(x, [~3.4, 5.6], 1.0);
val score = score + checkRList(x, [1.2, ~3.4], 1.0);
(* this function = 3.0, total = 32.0 *)  

(*14*)
(*fun condense [] = []
| condense [x] = [x]
| condense (a::b::cs) = (a andalso b)::(condense cs);*)

print("\ntesting condense\n");
val x = condense [];
val score = score + check(x, [], 0.5);
val x = condense [true];
val score = score + check(x, [true], 0.5);
val x = condense [true, false, false, false, true, true, true, false];
val score = score + check(x, [false, false, true, false], 1.0);
(* this function = 2.0, total = 34.0 *) 

(*15*)
(*fun insert (x,[]) = [x]
| insert (x,y::ys) =
  if x <= y then x::y::ys
  else y::(insert (x,ys));*)

print("\ntesting insert\n");
val x = insert (2, []);
val score = score + check(x, [2], 1.0);
val x = insert (0, [1,2,3,4,5]);
val score = score + check(x, [0,1,2,3,4,5], 1.0);
val x = insert (6, [0,2,4]);
val score = score + check(x, [0,2,4,6], 1.0);
val x = insert (3, [1,3,5,7,9]);
val score = score + check (x, [1,3,3,5,7,9], 1.0);
(* this function = 4.0, total = 38.0 *) 

(*16*)
(*fun merge ([],y) = y
| merge (x,[]) = x
| merge (x::xs,y::ys) =
  if x <= y then x::(merge(xs,y::ys))
  else y::(merge(x::xs,ys));*)

print("\ntesting merge\n");
val x = merge ([], [1,2,3,4,5]);
val score = score + check(x, [1,2,3,4,5], 0.5);
val x = merge ([1,3,5,7], []);
val score = score + check(x, [1,3,5,7], 0.5);
val x = merge ([1,3,5,7], [2,4,6,8]);
val score = score + check(x, [1,2,3,4,5,6,7,8], 1.0);
val x = merge ([~3, ~2, 0, 5], [~1, ~1, 2, 4, 5, 6, 7]);
val score = score + check(x, [~3, ~2, ~1, ~1, 0, 2, 4, 5, 5, 6, 7], 1.0);
(* this function = 3.0, total = 41.0 *) 


(*17*)
(*fun reverse [] = []
| reverse (x::xs) = (reverse xs)@[x];*)

print("\ntesting reverse\n");
val x = reverse eList;
val score = score + check(x, eList, 0.5);
val x = reverse iList;
val score = score + check(x, [7,3,6,2,5,1], 1.0);
val x = implode(reverse cList);
val score = score + check(x, "!gnirts a si sihT", 1.0);
(* this function = 2.5, total = 43.5 *) 


(*18*)
(*fun zip ([],y) = []
| zip (x,[]) = []
| zip (x::xs,y::ys) = x::y::(zip (xs,ys));*)

print("\ntesting zip\n");
val x = zip ([], iList);
val score = score + check(x, [], 0.5);
val x = zip (iList2, []);
val score = score + check(x, [], 0.5);
val x = zip (iList, iList2);
val score = score + check(x, [1,3,5,4,2,1,6,0,3,9,7,2], 0.75);
val x = implode(zip(cList, explode "apple"));
val score = score + check(x, "Tahpipsl e", 0.75);
val x = zip(sList2, sList);
val score = score + check(x, ["Phoenix", "Arizona", "Little Rock", "Arkansas", "Montgomery", "Alabama", "Hartford", "Connecticut", "Denver", "Colorado"], 0.75); 
(* this function = 3.25, total = 46.75 *)  

(*19*)
(*fun apply ([],_) = []
| apply (x::xs,f) = (f x)::apply(xs,f);*)

print("\ntesting apply\n");
val x = apply ([], ord);
val score = score + check(x, [], 0.5);
val x = apply (iList, (fn x => x + 5));
val score = score + check(x, [6,10,7,11,8,12], 0.75);
val x = apply (rList, trunc);
val score = score + check(x, [1, ~3, 5, ~8], 0.75);
val x = apply (sList, (fn x => length(explode x)));
val score = score + check(x, [7, 8, 7, 11, 8], 0.75);
val x = implode(apply(explode "apple", (fn x => chr(ord x + 1))));
val score = score + check(x, "bqqmf", 0.75);
(* this function = 3.5, total = 50.25 *) 

(*20*)
(*fun collapse ([],s,_) = s
| collapse (x::xs,s,f) = collapse (xs, f(x,s), f);*)

print("\ntesting collapse\n");
val x = collapse([],0,(op +));
val exp = foldl (op +) 0 [];
val score = score + check(x, exp, 0.5);
val x = collapse(iList2,1,(op * ));
val exp = foldl (op * ) 1 iList2;
val score = score + check(x, exp, 0.75);
val x = collapse(rList, 10.0, (op -));
val exp = foldl (op -) 10.0 rList;
val score = score + checkR(x, exp, 0.75);
val x = collapse(sList, "", (op ^));
val exp = foldl (op ^) "" sList;
val score = score + check(x, exp, 0.75);
val x = collapse(rList, 0, (fn (a, b) => floor a - b));
val exp = foldl (fn (a, b) => floor a - b) 0 rList;
val score = score + check(x, exp, 0.75);
(* this function = 3.5, total = 53.75 *) 


