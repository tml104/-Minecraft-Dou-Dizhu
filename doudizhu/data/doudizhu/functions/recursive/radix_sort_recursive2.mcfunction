#[RS] Radix sort for bit k -> sf_i
#input: rs(list), rs_i, rs_k, lists (rs_0 to rs_9 in doudizhu:cards)
#var: temp(temporarily store rs[0] in var)

#get value
#data modify storage doudizhu:cards temp set from storage doudizhu:cards rs[0]
execute store result score temp var run data get storage doudizhu:cards rs[0]
#DEBUG
#tellraw @a [{"score": {"name": "rs_k","objective": "var"}},{"text":" rs_k"}]
#tellraw @a [{"score": {"name": "temp","objective": "var"}},{"text":" temp"}]

execute if score rs_k var matches 2.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 3.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 4.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 5.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 6.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 7.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 8.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 9.. run scoreboard players operation temp var /= 10 const
execute if score rs_k var matches 10.. run scoreboard players operation temp var /= 10 const
scoreboard players operation temp var %= 10 const

execute if score temp var matches 0 run data modify storage doudizhu:cards rs_0 append from storage doudizhu:cards rs[0]
execute if score temp var matches 1 run data modify storage doudizhu:cards rs_1 append from storage doudizhu:cards rs[0]
execute if score temp var matches 2 run data modify storage doudizhu:cards rs_2 append from storage doudizhu:cards rs[0]
execute if score temp var matches 3 run data modify storage doudizhu:cards rs_3 append from storage doudizhu:cards rs[0]
execute if score temp var matches 4 run data modify storage doudizhu:cards rs_4 append from storage doudizhu:cards rs[0]
execute if score temp var matches 5 run data modify storage doudizhu:cards rs_5 append from storage doudizhu:cards rs[0]
execute if score temp var matches 6 run data modify storage doudizhu:cards rs_6 append from storage doudizhu:cards rs[0]
execute if score temp var matches 7 run data modify storage doudizhu:cards rs_7 append from storage doudizhu:cards rs[0]
execute if score temp var matches 8 run data modify storage doudizhu:cards rs_8 append from storage doudizhu:cards rs[0]
execute if score temp var matches 9 run data modify storage doudizhu:cards rs_9 append from storage doudizhu:cards rs[0]

data remove storage doudizhu:cards rs[0]
scoreboard players remove rs_i var 1
execute if score rs_i var matches 1.. run function doudizhu:recursive/radix_sort_recursive2
