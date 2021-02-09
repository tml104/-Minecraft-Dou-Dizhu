#[SG] 检查准备人数，然后开始游戏
#调用：玩家
#var:sg_temp
#注：结束游戏的逻辑在use_other_see1里面


scoreboard players set sg_temp var 0
#execute as @a[tag=Prepared] run scoreboard players add sg_temp var 1
#DEBUG
execute as @e[tag=Prepared] run scoreboard players add sg_temp var 1
#tellraw @a {"score":{"name":"sg_temp","objective":"var"}}

#sg_temp==3 开始游戏
#加标签
execute if score sg_temp var matches 3 run tag @r[tag=Prepared,tag=!Player1,tag=!Player2,tag=!Player3] add Player1
execute if score sg_temp var matches 3 run tag @r[tag=Prepared,tag=!Player1,tag=!Player2,tag=!Player3] add Player2
execute if score sg_temp var matches 3 run tag @r[tag=Prepared,tag=!Player1,tag=!Player2,tag=!Player3] add Player3
#传送玩家
execute if score sg_temp var matches 3 run gamemode adventure @a[tag=Prepared]
execute if score sg_temp var matches 3 run gamemode spectator @a[tag=!Prepared]
execute if score sg_temp var matches 3 at @e[limit=1,tag=doudizhu,tag=Pos_Player1] run tp @a[tag=Player1] ~ ~2 ~ ~90 ~
execute if score sg_temp var matches 3 at @e[limit=1,tag=doudizhu,tag=Pos_Player2] run tp @a[tag=Player2] ~ ~2 ~ ~90 ~
execute if score sg_temp var matches 3 at @e[limit=1,tag=doudizhu,tag=Pos_Player3] run tp @a[tag=Player3] ~ ~2 ~ ~90 ~
execute if score sg_temp var matches 3 at @e[limit=1,tag=doudizhu,tag=Center] run tp @a[tag=!Prepared] ~ ~2 ~
#给东西
execute if score sg_temp var matches 3 run clear @a minecraft:carrot_on_a_stick
execute if score sg_temp var matches 3 if score qiang_mode var matches 0 as @a[tag=Prepared] run function doudizhu:replaceitem_jiao
execute if score sg_temp var matches 3 if score qiang_mode var matches 1 as @a[tag=Prepared] run function doudizhu:replaceitem_qiang
#execute if score sg_temp var matches 3 run replaceitem entity @a[tag=Prepared] hotbar.0 minecraft:carrot_on_a_stick{display:{Name:'{"text":"Pass"}'}}
#execute if score sg_temp var matches 3 run replaceitem entity @a[tag=Prepared] hotbar.1 minecraft:carrot_on_a_stick{display:{Name:'{"text":"1分"}'}}
#execute if score sg_temp var matches 3 run replaceitem entity @a[tag=Prepared] hotbar.2 minecraft:carrot_on_a_stick{display:{Name:'{"text":"2分"}'}}
#execute if score sg_temp var matches 3 run replaceitem entity @a[tag=Prepared] hotbar.3 minecraft:carrot_on_a_stick{display:{Name:'{"text":"3分"}'}}
#清空头盔
execute if score sg_temp var matches 3 run clear @a leather_helmet

#确定开始叫牌的人
execute if score sg_temp var matches 3 run function doudizhu:get_random
execute if score sg_temp var matches 3 run scoreboard players operation rd_x var %= 3 const
execute if score sg_temp var matches 3 run scoreboard players operation round var = rd_x var
execute if score sg_temp var matches 3 if score round var matches 0 run tellraw @a ["",{"selector":"@p[tag=Player1]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]
execute if score sg_temp var matches 3 if score round var matches 1 run tellraw @a ["",{"selector":"@p[tag=Player2]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]
execute if score sg_temp var matches 3 if score round var matches 2 run tellraw @a ["",{"selector":"@p[tag=Player3]","bold":true,"color":"gold"},{"text":"开始叫分","color":"gold"}]

#发牌
#先清空所有玩家的牌
execute if score sg_temp var matches 3 run scoreboard players set @a remain_cards 0
execute if score sg_temp var matches 3 run kill @e[tag=doudizhu,tag=Card]
execute if score sg_temp var matches 3 run function doudizhu:shuffle
execute if score sg_temp var matches 3 run function doudizhu:distribute_cards
execute if score sg_temp var matches 3 run function doudizhu:distribute_cards2
execute if score sg_temp var matches 3 if score skin_type skin matches 3 run function doudizhu:distribute_cards3
#清空记分板
execute if score sg_temp var matches 3 run scoreboard players set max_card last_outcards 0
execute if score sg_temp var matches 3 run scoreboard players set card_type last_outcards 0
execute if score sg_temp var matches 3 run scoreboard players set card_cnt last_outcards 0
execute if score sg_temp var matches 3 run scoreboard players set sum last_outcards 0

execute if score sg_temp var matches 3 run scoreboard players set max_card outcards 0
execute if score sg_temp var matches 3 run scoreboard players set card_type outcards 0
execute if score sg_temp var matches 3 run scoreboard players set card_cnt outcards 0
execute if score sg_temp var matches 3 run scoreboard players set sum outcards 0

execute if score sg_temp var matches 3 run scoreboard players set pass_cnt var 0
execute if score sg_temp var matches 3 run scoreboard objectives setdisplay list remain_cards
execute if score sg_temp var matches 3 run scoreboard objectives setdisplay sidebar score
execute if score sg_temp var matches 3 run scoreboard players set bomb_cnt bomb 0
#放大镜也重置了
execute if score sg_temp var matches 3 run scoreboard players set @a amplifier 0


#积分重置
#execute if score sg_temp var matches 3 run scoreboard players set #base score 1000
execute if score sg_temp var matches 3 run scoreboard players set #scale score 1
execute if score sg_temp var matches 3 run function doudizhu:upd_score_bossbar
execute if score sg_temp var matches 3 run scoreboard players set @e[tag=doudizhu,tag=Pos_Player] shed_time 0
#弃牌堆重置
execute if score sg_temp var matches 3 run scoreboard players set 1 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 2 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 3 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 4 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 5 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 6 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 7 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 8 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 9 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 10 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 11 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 12 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 13 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 14 abandoned_cards 0
execute if score sg_temp var matches 3 run scoreboard players set 15 abandoned_cards 0
execute if score sg_temp var matches 3 run function doudizhu:upd_abandoned_cards_bossbar
#Phase1 叫地主阶段 Phase2 出牌阶段 Phase3 抢地主阶段
execute if score sg_temp var matches 3 run tag @e[tag=doudizhu,tag=Center] remove Phase1
execute if score sg_temp var matches 3 run tag @e[tag=doudizhu,tag=Center] remove Phase2
execute if score sg_temp var matches 3 run tag @e[tag=doudizhu,tag=Center] remove Phase3
execute if score sg_temp var matches 3 if score qiang_mode var matches 0 run tag @e[tag=doudizhu,tag=Center] add Phase1
execute if score sg_temp var matches 3 if score qiang_mode var matches 1 run tag @e[tag=doudizhu,tag=Center] add Phase3
execute if score sg_temp var matches 3 run scoreboard players set @e[tag=doudizhu,tag=Pos_Player] jiaofen 0
execute if score sg_temp var matches 3 run scoreboard players set maxscore jiaofen 0
execute if score sg_temp var matches 3 run scoreboard players set jiaofen_times jiaofen 0
execute if score sg_temp var matches 3 run tag @e[tag=doudizhu,tag=Pos_Player] remove dizhu
execute if score sg_temp var matches 3 run tag @e[tag=doudizhu,tag=Pos_Player] remove Finished
execute if score sg_temp var matches 3 run tag @a remove Prepared
#Bossbar
execute if score sg_temp var matches 3 run bossbar set show_score_and_scale visible true
execute if score sg_temp var matches 3 run bossbar set show_abandoned_cards visible true
#execute if score sg_temp var matches 3 run bossbar set show_abandoned_cards2 visible true


#BGM
execute if score sg_temp var matches 3 run stopsound @a
execute if score sg_temp var matches 3 run scoreboard players operation time_index timer = now_time timer
#重置场景 改为手动填充场景……
execute if score sg_temp var matches 3 as @e[tag=doudizhu,tag=Center,limit=1] at @s run function doudizhu:fill_barrier
#execute if score sg_temp var matches 3 as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-6 ~-10 minecraft:structure_block{mode:"LOAD",name:"doudizhu:playing_room",posX:0,posY:1,posZ:0,sizeX:30,sizeY:10,sizeZ:20} destroy
#execute if score sg_temp var matches 3 as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-5 ~-10 minecraft:redstone_block
#execute if score sg_temp var matches 3 as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-6 ~-10 minecraft:air

#sg_temp!=3 提示人数不足
execute unless score sg_temp var matches 3 run tellraw @s ["",{"text":"在？没三个人怎么玩斗地主？","bold":true,"color":"red"},{"text":"(当前有","color":"red"},{"score":{"name":"sg_temp","objective":"var"},"color":"red"},{"text":"人准备）","color":"red"}]


scoreboard players set @a rclick 0