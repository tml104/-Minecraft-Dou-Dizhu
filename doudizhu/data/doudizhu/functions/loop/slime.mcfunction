#[SLM] 史莱姆隐身/高频杀死史莱姆

effect give @e[tag=Slime,tag=doudizhu] minecraft:invisibility 100 0 true
#kill @e[tag=!Slime,tag=!doudizhu,type=slime]
execute as @e[type=slime,tag=!Slime,tag=!doudizhu] at @s run tp @s ~ ~-64 ~