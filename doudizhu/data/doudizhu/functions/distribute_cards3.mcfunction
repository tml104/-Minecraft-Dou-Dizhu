#[DE] 生成背牌
#return:-
#注意：调用此函数之前务必特判skin_type==3

kill @e[tag=doudizhu,tag=Card,tag=Onlyback]

execute store result score de_i var run scoreboard players get @e[tag=doudizhu,tag=Pos_Player1,limit=1] remain_cards
scoreboard players set de_as5dir var -90
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player1,limit=1] positioned ^ ^ ^-2.95 run function doudizhu:recursive/distribute_summon_as5
execute store result score de_i var run scoreboard players get @e[tag=doudizhu,tag=Pos_Player2,limit=1] remain_cards
scoreboard players set de_as5dir var 0
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player2,limit=1] positioned ^ ^ ^-2.95 run function doudizhu:recursive/distribute_summon_as5
execute store result score de_i var run scoreboard players get @e[tag=doudizhu,tag=Pos_Player3,limit=1] remain_cards
scoreboard players set de_as5dir var 180
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player3,limit=1] positioned ^ ^ ^-2.95 run function doudizhu:recursive/distribute_summon_as5