#[SO] 循环找到被选中的牌并转移到桌面上
#input:i,"SO_1"
#var:"SO_2"

execute as @e[tag=doudizhu,tag=Selected,type=armor_stand,distance=..0.1] run tag @s add SO_2
# 0 -> 90 -> -90
execute as @e[tag=doudizhu,tag=SO_2,type=armor_stand] run data merge entity @s {Pose:{Head:[90.0f,0.0f,0.0f]}}
execute as @e[tag=doudizhu,tag=SO_2,type=armor_stand] run data modify entity @s Pos[0] set from entity @e[limit=1,tag=SO_1,tag=doudizhu] Pos[0]
execute as @e[tag=doudizhu,tag=SO_2,type=armor_stand] run data modify entity @s Pos[1] set from entity @e[limit=1,tag=SO_1,tag=doudizhu] Pos[1]
execute as @e[tag=doudizhu,tag=SO_2,type=armor_stand] run data modify entity @s Pos[2] set from entity @e[limit=1,tag=SO_1,tag=doudizhu] Pos[2]
execute if entity @e[tag=doudizhu,tag=SO_2,type=armor_stand] as @e[tag=doudizhu,tag=SO_1] at @s positioned ~ ~-0.01 ~ run tp @s ^ ^ ^0.4

tag @e[tag=doudizhu,tag=SO_2,type=armor_stand] add Outcard
tag @e[tag=doudizhu,tag=SO_2,type=armor_stand] remove Selected
execute as @e[tag=doudizhu,tag=SO_2,type=armor_stand] run team leave @s
tag @e[tag=doudizhu,tag=SO_2,type=armor_stand] remove SO_2

scoreboard players remove i var 1
execute if score i var matches 1.. positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/show_outcards_recursive