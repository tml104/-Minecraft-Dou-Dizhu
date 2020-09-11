#[RT] 游戏开始后对牌的选择(Player2)
#var:temp


scoreboard players set temp var 0
execute as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run data merge entity @s {Glowing:1b}
execute as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run scoreboard players set temp var -1
#原来是选择的1，原来是没选的2，只是看着为-1
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Selected,tag=Card,tag=Player2,tag=!Outcard] run scoreboard players set temp var 1
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=!Selected,tag=Card,tag=Player2,tag=!Outcard] run scoreboard players set temp var 2
execute if score temp var matches 1 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run team leave @s
execute if score temp var matches 1 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run tag @s remove Selected
execute if score temp var matches 1 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] at @s run tp @s ~ ~-0.5 ~

execute if score temp var matches 2 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run team join Selected @s
execute if score temp var matches 2 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] run tag @s add Selected
execute if score temp var matches 2 if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,type=armor_stand,distance=..0.3,limit=1,tag=Card,tag=Player2,tag=!Outcard] at @s run tp @s ~ ~0.5 ~



#execute if entity @s[distance=..5] unless entity @e[type=armor_stand,tag=doudizhu,limit=1,distance=..0.3] positioned ^ ^ ^0.3 run function doudizhu:loop/see
execute if entity @s[distance=..5] if score temp var matches 0 positioned ^ ^ ^0.3 run function doudizhu:loop/see2