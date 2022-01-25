fun is_older(x:(int*int*int),y:(int*int*int))=
    if (#1 x) < (#1 y) then true else if (#1 x) > (#1 y) then false else
    if (#2 x) < (#2 y) then true else if (#2 x) > (#2 y) then false else
    if (#3 x) < (#3 y) then true else false

fun number_in_month(dates:((int*int*int) list),m:int)=
    if null dates then 0 else
    if (#2 (hd dates)) = m then 1+number_in_month((tl dates),m)
    else number_in_month((tl dates),m) 
    
fun number_in_months(dates:((int*int*int) list),ms:int list)=
    if (null ms) orelse (null dates)  then 0 else
    number_in_month(dates,(hd ms))+number_in_months(dates,(tl ms))

fun dates_in_month(dates:((int*int*int) list),m:int)=
    if null dates then [] else
    if (#2 (hd dates))=m then (hd dates)::dates_in_month((tl dates),m) else
    dates_in_month((tl dates),m)

fun dates_in_months(dates:((int*int*int) list),m:int list)=
    if (null dates) orelse (null m) then [] else
    dates_in_month(dates,(hd m))@dates_in_months(dates,(tl m))

fun get_nth(strs:string list,n:int)=
    if n<>1 then get_nth((tl strs),n-1) else (hd strs)

fun date_to_string(y:int,m:int,d:int)=
    let val months=["January", "February", "March","April","May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months,m)^" "^Int.toString(d)^", "^Int.toString(y)
    end

fun number_before_reaching_sum(sum:int,ls:int list)=
    if (hd ls)>=sum then 0 else
    1+number_before_reaching_sum(sum-(hd ls),(tl ls))

fun what_month(day:int)=
    let val ds=[31,28,31,30,31,30,31,31,30,31,30,31]
    in number_before_reaching_sum(day,ds)+1 end

fun month_range(d1:int,d2:int)=
    if d1>d2 then [] else
    what_month(d1)::month_range(d1+1,d2)
			       
fun oldest(ls:(int*int*int) list)=
    if null ls
    then NONE
    else let (* fine to assume argument nonempty because it is local *)
	fun max_nonempty (xs :(int*int*int) list) =
	    if null (tl xs) (* xs better not be [] *)
	    then hd xs
	    else let val tl_ans = max_nonempty(tl xs)
		 in
		     if is_older(hd xs , tl_ans)
		     then hd xs
		     else tl_ans
		 end
    in
	SOME (max_nonempty ls)
    end
	     
