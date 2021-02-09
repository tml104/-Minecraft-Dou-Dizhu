#[MC] 第二重循环
#input:j "MC_2"
#var:temp(标记成功执行)

scoreboard players set temp var 0
#execute as @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] run say YYY
execute as @e[tag=doudizhu,tag=Card,tag=!Onlyback,type=armor_stand,distance=..0.1,tag=!Selected] run scoreboard players set temp var 1
execute as @e[tag=doudizhu,tag=Card,tag=!Onlyback,type=armor_stand,distance=..0.1,tag=!Selected] run tag @s add MC_2
#execute as @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] run tp @s @e[limit=1,tag=doudizhu,tag=MC_1]
execute as @e[tag=doudizhu,tag=Card,tag=!Onlyback,type=armor_stand,tag=MC_2] run data modify entity @s Pos[0] set from entity @e[limit=1,tag=doudizhu,tag=MC_1] Pos[0]
execute as @e[tag=doudizhu,tag=Card,tag=!Onlyback,type=armor_stand,tag=MC_2] run data modify entity @s Pos[1] set from entity @e[limit=1,tag=doudizhu,tag=MC_1] Pos[1]
execute as @e[tag=doudizhu,tag=Card,tag=!Onlyback,type=armor_stand,tag=MC_2] run data modify entity @s Pos[2] set from entity @e[limit=1,tag=doudizhu,tag=MC_1] Pos[2]
tag @e[tag=doudizhu,tag=MC_2,type=armor_stand] remove MC_2

scoreboard players remove j var 1
execute if score j var matches 1.. if score temp var matches 0 positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/merge_cards_recursive2