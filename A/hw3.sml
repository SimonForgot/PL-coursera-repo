(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(stringlist)=
    List.filter (fn x =>Char.isUpper(String.sub(x,0))) stringlist
		
fun longest_string1(stringlist)=
    List.foldl (fn (x,a) =>if String.size(x)>String.size(a) then x else a) "" stringlist
	       
fun longest_string2(stringlist)=
    List.foldl (fn (x,a) =>if String.size(x)>=String.size(a) then x else a) "" stringlist
	       
fun longest_string_helper(f)=
    List.foldl	(fn (x,a) =>if f(String.size(x),String.size(a)) then x else a) "" 
		
fun longest_string3(stringlist)=
    longest_string_helper(fn (a,b)=>a>b) stringlist
			 
fun longest_string4(stringlist)=
    longest_string_helper(fn (a,b)=>a>=b) stringlist
			 
fun longest_capitalized(stringlist)=
    (longest_string1 o only_capitals)stringlist
				     
fun rev_string(str)=
    (implode o rev o explode)str
