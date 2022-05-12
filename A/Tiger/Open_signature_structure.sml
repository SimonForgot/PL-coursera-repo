signature TREE=
 sig
   datatype 'a tree = Lf | Node of 'a * 'a tree * 'a tree
   val size: 'a tree -> int
 end
 
 structure T:> TREE =
 struct
   datatype 'a tree = Lf | Node of 'a * 'a tree * 'a tree
   fun size Lf = 0
     | size(Node(_,t1, t2)) = 1 + size t1 + size t2
 end
 
 val n = let val t = T.Node(7, T.Node(1, T.Lf, T.Lf), 
                               T.Node(9, T.Lf, T.Lf))
         in T.size t
         end;

open List
structure W= List