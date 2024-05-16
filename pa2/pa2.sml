(* Louis Romeo - PA2 *)
(* Date: 2/22/2024 *)
(* Course: CSC 372 *)
(* Purpose: Intermediate level functions implemented in SML, questions 8-15 include higher-order functions. *)

(*Question 1*)
fun quicksort _ [] = []
| quicksort _ [x] = [x]
| quicksort f l =
let
	fun pivot p = foldr (fn (y,(lt, gte)) => if f(y,p) then (y::lt, gte) else (lt, y::gte)) ([], []);
	val (l1, l2) = pivot (hd l) (tl l);
in
	((quicksort f l1) @ [hd l] @ (quicksort f l2))
end;

(*Question 2*)

fun bubblesort f l =
let
    fun bubble [] = []
    | bubble [a] = [a]
    | bubble (a :: b :: cs) =
    if f(a,b) then (a :: bubble (b :: cs))
    else (b :: bubble (a :: cs))

    val len = length l

    fun help (x, n) =
    if n = 0 then x else help (bubble x, n-1)

in
    help (l, len)
end;


(*Question 3*)

fun insertionSort _ [] = []
| insertionSort f (x::xs) =
  let
	fun insert (x, []) = [x]
	| insert (x, (y::ys)) =
	if f(x,y) then x::y::ys
	else y::(insert (x, ys))
   in
	insert (x, insertionSort f xs)
end;

(*Question 4*)

fun substring p m =
let
   val x = explode p
   val y = explode m

   fun match ([], _) = true
   | match (_, []) = false
   | match (x::xs, y::ys) =
   	x = y andalso match (xs, ys);
   
   fun sublist (_, []) = false
   | sublist (a, z::zs) =
   match (a, z::zs) orelse
   sublist (a, zs);
in
   sublist (x, y)
end;

(*Question 5*)

fun indexOf x l =
let
	fun help _ [] _ = ~1
	| help x (y::ys) c = 
		if x = y then c else help x ys (c+1);
in
	help x l 0
end;

(*Question 6*)

fun dec2baseN n x = 
let
	val q = x div n
	val r = x mod n
in
	if x < n then Int.toString(x) 
	else (dec2baseN n q)^(dec2baseN n r)
end;

(*Question 7*)

fun dropNth n l =
let
	fun help ([], _) = []
	| help (x::xs, c) =
		if n = c then help (xs, 1)
		else x::help(xs, c+1);
in
	help (l, 1)
end;

(*Question 8*)

fun best f l = foldl (fn (x, y) => if f(x,y) then x else y) (hd l) l;

(*Question 9*)

fun sortPairs l = map (fn (x,y) => if x < y then (x,y) else (y, x)) l;

(*Question 10*)

fun flattenL l = foldr (op @) [] l;

(*Question 11*)

fun flattenP l = foldr (fn ((x,y),z) => x::y::z) [] l;

(*Question 12*) 

fun remove x list = foldr (fn (e,l) => if e = x then l else e::l) [] list;

(*Question 13*)

fun apply2DList f l = map (map f) l;

(*Question 14*)

fun condenseLists f x l = map (foldr f x) l;

(*Question 15*)

fun removeF f l = foldr (fn (x,list) => if (f x) then list else x::list) [] l;
