#[RS] Radix sort, final merge rs_0..9 to rs

data modify storage doudizhu:cards rs append from storage doudizhu:cards rs_8[0]
data remove storage doudizhu:cards rs_8[0]
execute if data storage doudizhu:cards rs_8[0] run function doudizhu:recursive/radix_sort_merge8