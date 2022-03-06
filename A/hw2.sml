(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(s : string,slist : string list)=
    case slist of
        [] => NONE
       |x::xs => if same_string(x,s) then SOME xs
                 else case all_except_option(s,xs) of
                          NONE => NONE
                         |SOME i => SOME (x::i)

fun get_substitutions1(subs : string list list,s : string)=
    case subs of
	[]=>[]
      | x::xs =>case all_except_option(s,x) of
		    NONE=>get_substitutions1(xs,s)
		  | SOME i => i@get_substitutions1(xs,s)

		 
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
