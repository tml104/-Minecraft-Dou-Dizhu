#[STOP] 紧急停止游戏……

#草，得改成在出生点调用函数
#已经修改，但仍有bug

execute at @e[tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~ ~-1 ~ {Duration:2147483647,Tags:["doudizhu","stop"]}

tellraw @a {"text":"正在停止游戏……","bold":true,"color":"red"}
kill @e[tag=doudizhu,tag=!stop]
tag @a remove Player1
tag @a remove Player2
tag @a remove Player3
tag @a remove dizhu
clear @a

execute at @e[tag=doudizhu,tag=stop,limit=1] run function doudizhu:init
kill @e[tag=doudizhu,tag=stop]
kill @e[type=item,nbt={Item:{id:"minecraft:green_carpet"}}]