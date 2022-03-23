(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test12 = only_capitals [] = []

val test21 = longest_string1 ["A","bc","C"] = "bc"
val test22 = longest_string1 [] = ""
val test23 = longest_string1 ["Aa","bc","Ca"] = "Aa"
val test24 = longest_string1 ["Aa","bcf","Ca"] = "bcf"

val test3 = longest_string2 ["A","bc","C"] = "bc"
val test32 = longest_string2 [] = ""
val test33 = longest_string2 ["Aa","bc","Ca"] = "Ca"
val test34 = longest_string2 ["Aa","bcf","Ca"] = "bcf"

val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4a1 = longest_string3 ["A","bc","C"] = "bc"
val test4a2 = longest_string3 [] = ""
val test4a3 = longest_string3 ["Aa","bc","Ca"] = "Aa"
val test4a4 = longest_string3 ["Aa","bcf","Ca"] = "bcf"

val test4b = longest_string4 ["A","B","C"] = "C"
val test4b1 = longest_string4 ["A","bc","C"] = "bc"
val test4b2 = longest_string4 [] = ""
val test4b3 = longest_string4 ["Aa","bc","Ca"] = "Ca"
val test4b4 = longest_string4 ["Aa","bcf","Ca"] = "bcf"

val test5 = longest_capitalized ["A","bc","C"] = "A"
val test51 = longest_capitalized ["a","bc","x"] = ""
val test52 = longest_capitalized [] = ""
val test53 = longest_capitalized ["A","bc","Cxx"] = "Cxx"

val test6 = rev_string "abc" = "cba"
val test61 = rev_string "" = ""

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test81 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test82 = all_answers (fn x => if (x mod 2)=0 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,4,6]
val test83 = all_answers (fn x => if (x mod 2)=0 then SOME [x] else NONE) [] = SOME []
(* 
val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
*)