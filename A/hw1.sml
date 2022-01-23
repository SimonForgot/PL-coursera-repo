fun is_older(x:(int*int*int),y:(int*int*int))=
    if (#1 x) < (#1 y) then true else
    if (#2 x) < (#2 y) then true else
    if (#3 x) < (#3 y) then true else false

fun number_in_month(datas:((int*int*int) list),m:int)=
    if null datas then 0 else
    if (#2 (hd datas)) = m then 1+number_in_month((tl datas),m)
    else number_in_month((tl datas),m) 
    
fun number_in_months(datas:((int*int*int) list),ms:int list)=
    if null ms  then 0 else
    number_in_month(datas,(hd ms))+number_in_months(datas,(tl ms))

fun dates_in_month(datas:((int*int*int) list),m:int)=
    if null datas then [] else
    if (#2 (hd datas))=m then (hd datas)::dates_in_month((tl datas),m) else
    dates_in_month((tl datas),m)

fun dates_in_months(datas:((int*int*int) list),m:int)
