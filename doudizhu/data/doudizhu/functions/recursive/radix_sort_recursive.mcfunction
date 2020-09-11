#[RS] Radix sort for bit k
#input:a list (in doudizhu:cards -> rs), rs_k
#var:lists (rs_0 to rs_9 in doudizhu:cards), rs_i(i-th number of list)
#return:rs

data merge storage doudizhu:cards {rs_0:[],rs_1:[],rs_2:[],rs_3:[],rs_4:[],rs_5:[],rs_6:[],rs_7:[],rs_8:[],rs_9:[]}
#get rs length
execute store result score rs_i var run data get storage doudizhu:cards rs
function doudizhu:recursive/radix_sort_recursive2

function doudizhu:recursive/radix_sort_merge0
function doudizhu:recursive/radix_sort_merge1
function doudizhu:recursive/radix_sort_merge2
function doudizhu:recursive/radix_sort_merge3
function doudizhu:recursive/radix_sort_merge4
function doudizhu:recursive/radix_sort_merge5
function doudizhu:recursive/radix_sort_merge6
function doudizhu:recursive/radix_sort_merge7
function doudizhu:recursive/radix_sort_merge8
function doudizhu:recursive/radix_sort_merge9

scoreboard players add rs_k var 1
execute if score rs_k var matches ..10 run function doudizhu:recursive/radix_sort_recursive