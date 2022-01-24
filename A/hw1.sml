fun is_older(x:(int*int*int),y:(int*int*int))=
    if (#1 x) < (#1 y) then true else
    if (#2 x) < (#2 y) then true else
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


