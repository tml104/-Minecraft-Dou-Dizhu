#[JS] 叫地主的结束判定
#调用对象：Pos_Player123
#var:js_temp

scoreboard players set js_temp var 0
#声音
execute if score google var matches 1 if score @s jiaofen matches -1 as @a at @s run playsound minecraft:doudizhu.pass_jiao voice @s
execute if score google var matches 1 if score @s jiaofen matches 1 as @a at @s run playsound minecraft:doudizhu.1p voice @s
execute if score google var matches 1 if score @s jiaofen matches 2 as @a at @s run playsound minecraft:doudizhu.2p voice @s
execute if score google var matches 1 if score @s jiaofen matches 3 as @a at @s run playsound minecraft:doudizhu.3p voice @s


#更新倍率记分板
execute if score @s jiaofen matches 1.. run scoreboard players operation #scale score += @s jiaofen
execute if score @s jiaofen matches 1.. run function doudizhu:upd_score_bossbar

#三分直接结束
execute if score @s jiaofen matches 3 run tag @s add dizhu

#否则最后叫分最大者成为地主
#更新叫分最大者
execute if score @s jiaofen >= maxscore jiaofen run tag @e[tag=doudizhu,tag=Pos_Player] remove Maxscore
execute if score @s jiaofen >= maxscore jiaofen run tag @s add Maxscore
execute if score @s jiaofen >= maxscore jiaofen run scoreboard players operation maxscore jiaofen = @s jiaofen

#当所有玩家分数都有，那么确定Maxscore标签者为地主
execute unless score @e[tag=doudizhu,tag=Pos_Player1,limit=1] jiaofen matches 0 unless score @e[tag=doudizhu,tag=Pos_Player2,limit=1] jiaofen matches 0 unless score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 0 run tag @e[tag=Maxscore,limit=1] add dizhu

#地主存在，结束叫分
execute if entity @e[tag=dizhu] run tag @e[tag=doudizhu,tag=Pos_Player] remove Maxscore
execute if entity @e[tag=dizhu] run tag @e[tag=doudizhu,tag=Center] remove Phase1
execute if entity @e[tag=dizhu] run tag @e[tag=doudizhu,tag=Center] add Phase2
execute if entity @e[tag=dizhu] run scoreboard players set js_temp var 1
execute if score js_temp var matches 1 run clear @a minecraft:carrot_on_a_stick
execute if score js_temp var matches 1 run scoreboard players set @a rclick 0

#添加底牌
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run tellraw @a ["",{"selector":"@p[tag=Player1]","bold":true,"color":"gold"},{"text":"成为地主，由其开始出牌","color":"gold"}]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run kill @e[tag=doudizhu,tag=Card,tag=Player1]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run data modify storage doudizhu:cards player1_copy append from storage doudizhu:cards facedown_copy[0]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run data modify storage doudizhu:cards player1_copy append from storage doudizhu:cards facedown_copy[1]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run data modify storage doudizhu:cards player1_copy append from storage doudizhu:cards facedown_copy[2]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run data modify storage doudizhu:cards rs set from storage doudizhu:cards player1_copy
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run function doudizhu:radix_sort
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run data modify storage doudizhu:cards player1 set from storage doudizhu:cards rs
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player1,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as1
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run scoreboard players add @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] remain_cards 3
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run scoreboard players set round var 0
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player1] armor.head minecraft:leather_helmet{display:{color:16701501}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player2] armor.head minecraft:leather_helmet{display:{color:16777215}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player3] armor.head minecraft:leather_helmet{display:{color:16777215}}


execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run tellraw @a ["",{"selector":"@p[tag=Player2]","bold":true,"color":"gold"},{"text":"成为地主，由其开始出牌","color":"gold"}]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run kill @e[tag=doudizhu,tag=Card,tag=Player2]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run data modify storage doudizhu:cards player2_copy append from storage doudizhu:cards facedown_copy[0]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run data modify storage doudizhu:cards player2_copy append from storage doudizhu:cards facedown_copy[1]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run data modify storage doudizhu:cards player2_copy append from storage doudizhu:cards facedown_copy[2]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run data modify storage doudizhu:cards rs set from storage doudizhu:cards player2_copy
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run function doudizhu:radix_sort
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run data modify storage doudizhu:cards player2 set from storage doudizhu:cards rs
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player2,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as2
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run scoreboard players add @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] remain_cards 3
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player2] run scoreboard players set round var 1
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player1] armor.head minecraft:leather_helmet{display:{color:16777215}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player2] armor.head minecraft:leather_helmet{display:{color:16701501}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player3] armor.head minecraft:leather_helmet{display:{color:16777215}}

execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run tellraw @a ["",{"selector":"@p[tag=Player3]","bold":true,"color":"gold"},{"text":"成为地主，由其开始出牌","color":"gold"}]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run kill @e[tag=doudizhu,tag=Card,tag=Player3]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run data modify storage doudizhu:cards player3_copy append from storage doudizhu:cards facedown_copy[0]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run data modify storage doudizhu:cards player3_copy append from storage doudizhu:cards facedown_copy[1]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run data modify storage doudizhu:cards player3_copy append from storage doudizhu:cards facedown_copy[2]
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run data modify storage doudizhu:cards rs set from storage doudizhu:cards player3_copy
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run function doudizhu:radix_sort
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run data modify storage doudizhu:cards player3 set from storage doudizhu:cards rs
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player3,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as3
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run scoreboard players add @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] remain_cards 3
execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player3] run scoreboard players set round var 2
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player1] armor.head minecraft:leather_helmet{display:{color:16777215}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player2] armor.head minecraft:leather_helmet{display:{color:16777215}}
#execute if entity @e[tag=dizhu,tag=doudizhu,tag=Pos_Player1] run replaceitem entity @p[tag=Player3] armor.head minecraft:leather_helmet{display:{color:16701501}}
#底牌翻过来，更新牌信息
execute if score js_temp var matches 1 as @e[tag=doudizhu,tag=Facedown] run data merge entity @s {Rotation:[-90.0f,0.0f]}
function doudizhu:upd_remain_cards
#更新钓竿
execute if score js_temp var matches 1 as @e[tag=Player1] run function doudizhu:replaceitem_chupai
execute if score js_temp var matches 1 as @e[tag=Player2] run function doudizhu:replaceitem_chupai
execute if score js_temp var matches 1 as @e[tag=Player3] run function doudizhu:replaceitem_chupai


#全部Pass(-1)，重新发牌并决定谁叫地主
execute if score @e[tag=doudizhu,tag=Pos_Player1,limit=1] jiaofen matches -1 if score @e[tag=doudizhu,tag=Pos_Player2,limit=1] jiaofen matches -1 if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches -1 run scoreboard players set js_temp var -1
execute if score js_temp var matches -1 run tellraw @a {"text":"无人叫地主，重新发牌……"}
execute if score js_temp var matches -1 run kill @e[tag=doudizhu,tag=Card]
execute if score js_temp var matches -1 run function doudizhu:shuffle
execute if score js_temp var matches -1 run function doudizhu:distribute_cards
execute if score js_temp var matches -1 run function doudizhu:distribute_cards2
execute if score js_temp var matches -1 run function doudizhu:get_random
execute if score js_temp var matches -1 run scoreboard players operation rd_x var %= 3 const
execute if score js_temp var matches -1 run scoreboard players operation round var = rd_x var
execute if score js_temp var matches -1 if score round var matches 0 run tellraw @a ["",{"selector":"@p[tag=Player1]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]
execute if score js_temp var matches -1 if score round var matches 1 run tellraw @a ["",{"selector":"@p[tag=Player2]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]
execute if score js_temp var matches -1 if score round var matches 2 run tellraw @a ["",{"selector":"@p[tag=Player3]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]
execute if score js_temp var matches -1 run tag @e[tag=doudizhu,tag=Center] remove Phase1
execute if score js_temp var matches -1 run tag @e[tag=doudizhu,tag=Center] remove Phase2
execute if score js_temp var matches -1 run tag @e[tag=doudizhu,tag=Center] add Phase1
execute if score js_temp var matches -1 run scoreboard players set @e[tag=doudizhu,tag=Pos_Player1] jiaofen 0
execute if score js_temp var matches -1 run scoreboard players set @e[tag=doudizhu,tag=Pos_Player2] jiaofen 0
execute if score js_temp var matches -1 run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen 0
execute if score js_temp var matches -1 run scoreboard players set maxscore jiaofen 0

#否则轮到下一个玩家打分
execute if score js_temp var matches 0 run scoreboard players add round var 1
execute if score js_temp var matches 0 run scoreboard players operation round var %= 3 const
execute if score js_temp var matches 0 if score round var matches 0 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player1]","bold":true,"color":"gold"},{"text":"叫分","color":"gold"}]
execute if score js_temp var matches 0 if score round var matches 1 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player2]","bold":true,"color":"gold"},{"text":"叫分","color":"gold"}]
execute if score js_temp var matches 0 if score round var matches 2 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player3]","bold":true,"color":"gold"},{"text":"叫分","color":"gold"}]

