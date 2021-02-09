#[SO] 将Selected的牌生成并kill掉Selected的牌
#var:"SO_1",temp,i

#确定初始位置
execute if score round var matches 0 as @e[tag=doudizhu,tag=Pos_Player1] at @s positioned ^-3 ^ ^ run summon area_effect_cloud ~ ~-3 ~ {Duration:2147483647,Tags:["doudizhu","SO_1"]}
execute if score round var matches 1 as @e[tag=doudizhu,tag=Pos_Player2] at @s positioned ^-3 ^ ^ run summon area_effect_cloud ~ ~-3 ~ {Duration:2147483647,Tags:["doudizhu","SO_1"]}
execute if score round var matches 2 as @e[tag=doudizhu,tag=Pos_Player3] at @s positioned ^-3 ^ ^ run summon area_effect_cloud ~ ~-3 ~ {Duration:2147483647,Tags:["doudizhu","SO_1"]}
execute if score round var matches 0 run data modify entity @e[tag=doudizhu,tag=SO_1,limit=1] Rotation[0] set from entity @e[tag=doudizhu,tag=Pos_Player1,limit=1] Rotation[0]
execute if score round var matches 1 run data modify entity @e[tag=doudizhu,tag=SO_1,limit=1] Rotation[0] set from entity @e[tag=doudizhu,tag=Pos_Player2,limit=1] Rotation[0]
execute if score round var matches 2 run data modify entity @e[tag=doudizhu,tag=SO_1,limit=1] Rotation[0] set from entity @e[tag=doudizhu,tag=Pos_Player3,limit=1] Rotation[0]

execute if score card_cnt outcards matches 2.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 4.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 6.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 8.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 10.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 12.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 14.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 16.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 18.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4
execute if score card_cnt outcards matches 20.. as @e[tag=doudizhu,tag=SO_1] at @s run tp ^ ^ ^-0.4

#找被选择的牌并出牌
scoreboard players set i var 20
execute if score round var matches 0 as @e[tag=doudizhu,tag=Pos_Player1] at @s positioned ^ ^ ^-3 positioned ~ ~0.5 ~ run function doudizhu:recursive/show_outcards_recursive
execute if score round var matches 1 as @e[tag=doudizhu,tag=Pos_Player2] at @s positioned ^ ^ ^-3 positioned ~ ~0.5 ~ run function doudizhu:recursive/show_outcards_recursive
execute if score round var matches 2 as @e[tag=doudizhu,tag=Pos_Player3] at @s positioned ^ ^ ^-3 positioned ~ ~0.5 ~ run function doudizhu:recursive/show_outcards_recursive
kill @e[tag=doudizhu,tag=SO_1]
execute if score skin_type skin matches 3 run schedule function doudizhu:show_outcards_elapse 5t replace
execute unless score skin_type skin matches 3 run function doudizhu:show_outcards_elapse

#更新last_outcards记分板
scoreboard players operation max_card last_outcards = max_card outcards
scoreboard players operation card_type last_outcards = card_type outcards
scoreboard players operation sum last_outcards = sum outcards

