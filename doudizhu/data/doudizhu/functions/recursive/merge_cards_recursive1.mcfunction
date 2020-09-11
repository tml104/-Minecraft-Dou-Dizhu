#[MC] 第一重循环
#input:i
#var: AEC with tag "MC_1", j

scoreboard players set j var 19
#execute as @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] run say @s
#execute unless entity @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] run say NNN
execute unless entity @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["MC_1","doudizhu"]}
execute unless entity @e[tag=doudizhu,type=armor_stand,distance=..0.1,tag=!Selected] positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/merge_cards_recursive2
kill @e[tag=doudizhu,tag=MC_1]

scoreboard players remove i var 1
execute if score i var matches 1.. positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/merge_cards_recursive1