datatype Nat = Zero
		      | Succ of Nat

fun is_equal(n_pair) =
  case n_pair of
    (Zero,Zero) => true
    |(Succ x,Succ y) => is_equal(x,y)
    |(Zero,Succ y) => false
    |(Succ y,Zero) => false

val test1 = is_equal (Succ(Zero),Succ(Zero)) = true;
