#[TFP] 传送首次进入服务器的玩家到大厅、调整游戏模式、重置记分板...


execute as @a[tag=!TP_FIRST] run tp @s @e[limit=1,tag=doudizhu,tag=Join_game]
execute as @a[tag=!TP_FIRST] run gamemode adventure @s
execute as @a[tag=!TP_FIRST] run scoreboard players set @s score 10000
execute as @a[tag=!TP_FIRST] run scoreboard players set @s remain_cards 0
execute as @a[tag=!TP_FIRST] run tag @s add TP_FIRST