(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2.sml";
val test1_1= all_except_option ("string", ["string"]) = SOME []
val test1_2 = all_except_option ("string", ["zxl","string","KK"]) = SOME ["zxl","KK"]
val test1_3 = all_except_option ("string", ["strin","???"]) = NONE


val test2_1= get_substitutions1 ([["foo"],["there"]], "foo") = []

val test2_2=get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred")=["Fredrick","Freddie","F"]

val test2_3=get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff")=["Jeffrey","Geoff","Jeffrey"] 

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test3_2=get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred")=["Fredrick","Freddie","F"]

val test3_3=get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff")=["Jeffrey","Geoff","Jeffrey"] 

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test5_1 = card_color (Clubs, Num 2) = Black

val test5_2 = card_color (Hearts, Num 2) = Red

val test6_1 = card_value (Clubs, Num 2) = 2
val test6_2 = card_value (Clubs, Ace) =11
val test6_3 = card_value (Clubs, Jack) =10

val test7_1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_2 = remove_card ([(Hearts, Ace),(Hearts, Num 3),(Hearts, Jack)], (Hearts, Num 3), IllegalMove) = [(Hearts, Ace),(Hearts, Jack)]

(* val test7_3 = remove_card ([(Hearts, Ace)], (Hearts, Jack), IllegalMove) *)

val test8_1 = all_same_color [(Hearts, Ace), (Hearts, Ace),(Hearts, Num 2)] = true
val test8_2= all_same_color [(Hearts, Ace), (Diamonds, Ace)] = true
val test8_3= all_same_color [(Hearts, Ace)] = true
val test8_4 = all_same_color [(Spades, Ace), (Hearts, Ace)] = false

val test9_1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test9_2 = sum_cards [] = 0
val test9_3 = sum_cards [(Clubs, Num 2),(Clubs, Num 9)] = 11
val test9_4 = sum_cards [(Clubs, Num 2),(Clubs, Num 24),(Clubs, Num 10)] = 36

val test10_1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_2 = score ([(Hearts, Num 2),(Hearts, Num 2),(Hearts, Num 2),(Hearts, Num 2)],10) = 1
val test10_3 = score ([(Hearts, Num 2),(Clubs, Num 9)],10) = 3
val test10_4 = score ([],10) = 10
val test10_5 = score ([(Clubs, Num 9)],7) = 3


val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
