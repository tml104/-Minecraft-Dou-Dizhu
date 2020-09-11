#[TB] 控制玩家在大厅和牌桌之间的传送……

#1:牌桌 2：大厅
scoreboard players add @s pos 1
scoreboard players operation @s pos %= 2 const
execute if score @s pos matches 1 run tp @s @e[tag=doudizhu,tag=Center,limit=1]
execute if score @s pos matches 1 at @s run tp @s ~ ~2 ~
execute unless score @s pos matches 1 run tp @s @e[tag=doudizhu,tag=Join_game,limit=1]


scoreboard players set @s rclick 0