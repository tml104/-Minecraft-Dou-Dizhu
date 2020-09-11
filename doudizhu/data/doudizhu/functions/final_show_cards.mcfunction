#[FSC] 游戏结束后，玩家的摊牌环节
#调用对象：Pos_Player
#var: "FSC_1", i


execute positioned ^ ^ ^-3 run summon area_effect_cloud ~ ~-1 ~ {Duration:2147483647,Tags:["doudizhu","FSC_1"]}
data modify entity @e[tag=doudizhu,tag=FSC_1,limit=1] Rotation[0] set from entity @s Rotation[0]
scoreboard players set i var 20
execute positioned ^ ^ ^-3 run function doudizhu:recursive/final_show_cards_recursive


kill @e[tag=doudizhu,tag=FSC_1]