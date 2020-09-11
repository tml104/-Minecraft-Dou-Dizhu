#[FSC] 摊牌循环
#input: "FSC_1", i
#var: "FSC_2"

execute as @e[tag=doudizhu,tag=Card,type=armor_stand,distance=..0.1] run tag @s add FSC_2
execute as @e[tag=doudizhu,tag=FSC_2,type=armor_stand] run data merge entity @s {Pose:{Head:[-90.0f,0.0f,0.0f]}}
execute as @e[tag=doudizhu,tag=FSC_2,type=armor_stand] run data modify entity @s Pos[0] set from entity @e[limit=1,tag=FSC_1,tag=doudizhu] Pos[0]
execute as @e[tag=doudizhu,tag=FSC_2,type=armor_stand] run data modify entity @s Pos[1] set from entity @e[limit=1,tag=FSC_1,tag=doudizhu] Pos[1]
execute as @e[tag=doudizhu,tag=FSC_2,type=armor_stand] run data modify entity @s Pos[2] set from entity @e[limit=1,tag=FSC_1,tag=doudizhu] Pos[2]
execute if entity @e[tag=doudizhu,tag=FSC_2,type=armor_stand] as @e[tag=doudizhu,tag=FSC_1] at @s positioned ~ ~-0.01 ~ run tp @s ^ ^ ^0.4
tag @e[tag=doudizhu,tag=FSC_2,type=armor_stand] remove FSC_2


scoreboard players remove i var 1
execute if score i var matches 1.. positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/final_show_cards_recursive