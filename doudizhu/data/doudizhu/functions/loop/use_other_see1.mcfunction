#[UO]
#var:uo_temp uo_dizhu_cnt uo_nongmin_cnt

#类型变量
scoreboard players set uo_temp var 0
#出牌1 Pass2 出完牌了-1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"出牌"}'}}}},scores={rclick=1..}] run scoreboard players set uo_temp var 1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pass"}'}}}},scores={rclick=1..}] run scoreboard players set uo_temp var 2

#F
execute as @s[scores={test_empty=0,test_f=1..,test_q=0}] run scoreboard players set uo_temp var 1
#Q
execute as @s[scores={test_empty=0,test_f=0,test_q=1..}] run scoreboard players set uo_temp var 2



#出牌
#execute if score uo_temp var matches 1 run say 出牌
execute if score uo_temp var matches 1 run function doudizhu:conver_selected
execute if score uo_temp var matches 1 run function doudizhu:get_card_type
execute if score uo_temp var matches 1 run function doudizhu:check_valid_outcard
#不合法出牌
execute if score uo_temp var matches 1 if score cvo var matches 0 run tellraw @s {"text":"出牌不合规则","bold":true,"color":"red"}
execute if score uo_temp var matches 1 if score cvo var matches 0 run scoreboard players set uo_temp var 0
#合法出牌
#显示牌型类型
execute if score uo_temp var matches 1 if score card_type outcards matches 1 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 单牌"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 2 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 一对"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 3 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三条"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 4 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三带一"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 5 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三带二"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 6 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 四带二"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 7 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 连对"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 8 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 顺子"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 9 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 10 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 11 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 12 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 炸弹"}]
execute if score uo_temp var matches 1 if score card_type outcards matches 13 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 王炸"}]

execute if score uo_temp var matches 1 run function doudizhu:merge_cards
execute if score uo_temp var matches 1 run function doudizhu:show_outcards
execute if score uo_temp var matches 1 if score round var matches 0 run scoreboard players operation @e[tag=doudizhu,tag=Pos_Player1] remain_cards -= sum outcards
execute if score uo_temp var matches 1 if score round var matches 1 run scoreboard players operation @e[tag=doudizhu,tag=Pos_Player2] remain_cards -= sum outcards
execute if score uo_temp var matches 1 if score round var matches 2 run scoreboard players operation @e[tag=doudizhu,tag=Pos_Player3] remain_cards -= sum outcards
execute if score uo_temp var matches 1 if score round var matches 0 run scoreboard players operation @p[tag=Player1] remain_cards = @e[tag=doudizhu,tag=Pos_Player1] remain_cards
execute if score uo_temp var matches 1 if score round var matches 1 run scoreboard players operation @p[tag=Player2] remain_cards = @e[tag=doudizhu,tag=Pos_Player2] remain_cards
execute if score uo_temp var matches 1 if score round var matches 2 run scoreboard players operation @p[tag=Player3] remain_cards = @e[tag=doudizhu,tag=Pos_Player3] remain_cards
execute if score uo_temp var matches 1 if score round var matches 0 run scoreboard players add @e[tag=doudizhu,tag=Pos_Player1] shed_time 1
execute if score uo_temp var matches 1 if score round var matches 1 run scoreboard players add @e[tag=doudizhu,tag=Pos_Player2] shed_time 1
execute if score uo_temp var matches 1 if score round var matches 2 run scoreboard players add @e[tag=doudizhu,tag=Pos_Player3] shed_time 1
execute if score uo_temp var matches 1 run scoreboard players set pass_cnt var 0
execute if score uo_temp var matches 1 run function doudizhu:upd_remain_cards
execute if score uo_temp var matches 1 if entity @e[tag=doudizhu,tag=Pos_Player,scores={remain_cards=1..2}] run scoreboard players add bomb_cnt bomb 1
#声音
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 0 if entity @e[tag=doudizhu,tag=Pos_Player1,scores={remain_cards=2}] as @a at @s run playsound minecraft:doudizhu.left2 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 1 if entity @e[tag=doudizhu,tag=Pos_Player2,scores={remain_cards=2}] as @a at @s run playsound minecraft:doudizhu.left2 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 2 if entity @e[tag=doudizhu,tag=Pos_Player3,scores={remain_cards=2}] as @a at @s run playsound minecraft:doudizhu.left2 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 0 if entity @e[tag=doudizhu,tag=Pos_Player1,scores={remain_cards=1}] as @a at @s run playsound minecraft:doudizhu.left1 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 1 if entity @e[tag=doudizhu,tag=Pos_Player2,scores={remain_cards=1}] as @a at @s run playsound minecraft:doudizhu.left1 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score round var matches 2 if entity @e[tag=doudizhu,tag=Pos_Player3,scores={remain_cards=1}] as @a at @s run playsound minecraft:doudizhu.left1 voice @s

#单牌
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 1 as @a at @s run playsound minecraft:doudizhu.a voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 2 as @a at @s run playsound minecraft:doudizhu.2 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 3 as @a at @s run playsound minecraft:doudizhu.3 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 4 as @a at @s run playsound minecraft:doudizhu.4 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 5 as @a at @s run playsound minecraft:doudizhu.5 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 6 as @a at @s run playsound minecraft:doudizhu.6 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 7 as @a at @s run playsound minecraft:doudizhu.7 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 8 as @a at @s run playsound minecraft:doudizhu.8 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 9 as @a at @s run playsound minecraft:doudizhu.9 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 10 as @a at @s run playsound minecraft:doudizhu.10 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 11 as @a at @s run playsound minecraft:doudizhu.j voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 12 as @a at @s run playsound minecraft:doudizhu.q voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 13 as @a at @s run playsound minecraft:doudizhu.k voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 14 as @a at @s run playsound minecraft:doudizhu.joker1 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 1 if score max_card outcards matches 15 as @a at @s run playsound minecraft:doudizhu.joker2 voice @s
#对子
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 1 as @a at @s run playsound minecraft:doudizhu.pa voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 2 as @a at @s run playsound minecraft:doudizhu.p2 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 3 as @a at @s run playsound minecraft:doudizhu.p3 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 4 as @a at @s run playsound minecraft:doudizhu.p4 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 5 as @a at @s run playsound minecraft:doudizhu.p5 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 6 as @a at @s run playsound minecraft:doudizhu.p6 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 7 as @a at @s run playsound minecraft:doudizhu.p7 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 8 as @a at @s run playsound minecraft:doudizhu.p8 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 9 as @a at @s run playsound minecraft:doudizhu.p9 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 10 as @a at @s run playsound minecraft:doudizhu.p10 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 11 as @a at @s run playsound minecraft:doudizhu.pj voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 12 as @a at @s run playsound minecraft:doudizhu.pq voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 2 if score max_card outcards matches 13 as @a at @s run playsound minecraft:doudizhu.pk voice @s
#其他牌型
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 3 as @a at @s run playsound minecraft:doudizhu.t3 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 4 as @a at @s run playsound minecraft:doudizhu.t4 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 5 as @a at @s run playsound minecraft:doudizhu.t5 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 6 as @a at @s run playsound minecraft:doudizhu.t6 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 7 as @a at @s run playsound minecraft:doudizhu.t7 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 8 as @a at @s run playsound minecraft:doudizhu.t8 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 9..11 as @a at @s run playsound minecraft:doudizhu.t91011 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 12 as @a at @s run playsound minecraft:doudizhu.t12 voice @s
execute if score google var matches 1 if score uo_temp var matches 1 if score card_type outcards matches 13 as @a at @s run playsound minecraft:doudizhu.t13 voice @s

#更新倍率
#execute if score uo_temp var matches 1 if score card_type outcards matches 7 run tellraw @a {"text":"连对：倍率+2","bold":true,"color":"red"}
#execute if score uo_temp var matches 1 if score card_type outcards matches 8 run tellraw @a {"text":"顺子：倍率+2","bold":true,"color":"red"}
#execute if score uo_temp var matches 1 if score card_type outcards matches 7..8 run scoreboard players operation #scale score += 2 const
#execute if score uo_temp var matches 1 if score card_type outcards matches 9..11 run tellraw @a {"text":"飞机：倍率+3","bold":true,"color":"red"}
#execute if score uo_temp var matches 1 if score card_type outcards matches 9..11 run scoreboard players operation #scale score += 3 const
execute if score uo_temp var matches 1 if score card_type outcards matches 12 run tellraw @a {"text":"炸弹：倍率*2","bold":true,"color":"red"}
execute if score uo_temp var matches 1 if score card_type outcards matches 12 run scoreboard players operation #scale score *= 2 const
execute if score uo_temp var matches 1 if score card_type outcards matches 13 run tellraw @a {"text":"王炸：倍率*4","bold":true,"color":"red"}
execute if score uo_temp var matches 1 if score card_type outcards matches 13 run scoreboard players operation #scale score *= 4 const
execute if score uo_temp var matches 1 if score card_type outcards matches 12..13 run function doudizhu:upd_score_bossbar
#更新bomb
execute if score uo_temp var matches 1 if score card_type outcards matches 12..13 run scoreboard players add bomb_cnt bomb 1
execute if score uo_temp var matches 1 if score bomb_cnt bomb matches 1.. run scoreboard players operation time_index timer = now_time timer
#防止重复触发……
execute if score uo_temp var matches 1 if score bomb_cnt bomb matches 1.. run scoreboard players set bomb_cnt bomb -2147483648

#更新弃牌堆
execute if score uo_temp var matches 1 run scoreboard players operation 1 abandoned_cards += 1 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 2 abandoned_cards += 2 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 3 abandoned_cards += 3 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 4 abandoned_cards += 4 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 5 abandoned_cards += 5 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 6 abandoned_cards += 6 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 7 abandoned_cards += 7 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 8 abandoned_cards += 8 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 9 abandoned_cards += 9 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 10 abandoned_cards += 10 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 11 abandoned_cards += 11 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 12 abandoned_cards += 12 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 13 abandoned_cards += 13 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 14 abandoned_cards += 14 outcards
execute if score uo_temp var matches 1 run scoreboard players operation 15 abandoned_cards += 15 outcards
execute if score uo_temp var matches 1 run function doudizhu:upd_abandoned_cards_bossbar


#判断牌数是否小于0
execute if score uo_temp var matches 1 as @e[tag=doudizhu,tag=Pos_Player,scores={remain_cards=0}] run tag @s add Finished
execute if score uo_temp var matches 1 as @e[tag=doudizhu,tag=Pos_Player,scores={remain_cards=0}] run scoreboard players set uo_temp var -1


#Pass
#阻止不合法的Pass
execute if score uo_temp var matches 2 if score card_type last_outcards matches 0 run tellraw @s {"text":"您是第一个出牌的啊哥哥？？","bold":true,"color":"red"}
execute if score uo_temp var matches 2 if score card_type last_outcards matches 0 run scoreboard players set uo_temp var 0
#execute if score uo_temp var matches 2 run say @s Pass
execute if score uo_temp var matches 2 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": Pass"}]
#取消正在选择的牌
execute if score uo_temp var matches 2 as @e[tag=Card,tag=doudizhu,tag=Selected] at @s run tp @s ~ ~-0.5 ~
execute if score uo_temp var matches 2 as @e[tag=Card,tag=doudizhu,tag=Selected] run team leave @s
execute if score uo_temp var matches 2 as @e[tag=Card,tag=doudizhu,tag=Selected] run tag @s remove Selected
execute if score uo_temp var matches 2 run scoreboard players add pass_cnt var 1
#声音
execute if score uo_temp var matches 2 run function doudizhu:get_random
execute if score uo_temp var matches 2 run scoreboard players operation rd_x var %= 2 const
execute if score uo_temp var matches 2 if score rd_x var matches 0 as @a at @s run playsound minecraft:doudizhu.pass1 voice @s
execute if score uo_temp var matches 2 if score rd_x var matches 1 as @a at @s run playsound minecraft:doudizhu.pass2 voice @s
#展示Pass符号
execute if score uo_temp var matches 2 run function doudizhu:show_pass


#弃牌堆更新已经移动到另一函数中


#操作成功后，下一位出牌
execute if score uo_temp var matches 1..2 run scoreboard players add round var 1
execute if score uo_temp var matches 1..2 run scoreboard players operation round var %= 3 const
execute if score uo_temp var matches 1..2 if score round var matches 0 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player1]","bold":true,"color":"gold"},{"text":"出牌","color":"gold"}]
execute if score uo_temp var matches 1..2 if score round var matches 1 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player2]","bold":true,"color":"gold"},{"text":"出牌","color":"gold"}]
execute if score uo_temp var matches 1..2 if score round var matches 2 run tellraw @a ["",{"text":"轮到","color":"gold"},{"selector":"@p[tag=Player3]","bold":true,"color":"gold"},{"text":"出牌","color":"gold"}]
execute if score uo_temp var matches 1..2 if score round var matches 0 run kill @e[tag=Card,tag=Player1,tag=doudizhu,tag=Outcard]
execute if score uo_temp var matches 1..2 if score round var matches 1 run kill @e[tag=Card,tag=Player2,tag=doudizhu,tag=Outcard]
execute if score uo_temp var matches 1..2 if score round var matches 2 run kill @e[tag=Card,tag=Player3,tag=doudizhu,tag=Outcard]
#pass_cnt>=2， 归零last_outcards记分板
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run scoreboard players set card_type last_outcards 0
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run scoreboard players set sum last_outcards 0
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run scoreboard players set max_card last_outcards 0
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run tellraw @a {"text":"回合结束：倍率+1","bold":true,"color":"red"}
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run scoreboard players operation #scale score += 1 const
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run function doudizhu:upd_score_bossbar
execute if score uo_temp var matches 1..2 if score pass_cnt var matches 2.. run scoreboard players set pass_cnt var 0

#已经出完牌了
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player1,tag=dizhu] run tag @p[tag=Player1] add dizhu
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player2,tag=dizhu] run tag @p[tag=Player2] add dizhu
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player3,tag=dizhu] run tag @p[tag=Player3] add dizhu
execute if score uo_temp var matches -1 run tag @p[tag=Player1] add Playing
execute if score uo_temp var matches -1 run tag @p[tag=Player2] add Playing
execute if score uo_temp var matches -1 run tag @p[tag=Player3] add Playing
execute if score uo_temp var matches -1 run scoreboard players set uo_dizhu_cnt var 0
execute if score uo_temp var matches -1 run scoreboard players set uo_nongmin_cnt var 0
execute if score uo_temp var matches -1 as @e[tag=doudizhu,tag=Pos_Player,tag=dizhu] run scoreboard players operation uo_dizhu_cnt var += @s shed_time
execute if score uo_temp var matches -1 as @e[tag=doudizhu,tag=Pos_Player,tag=!dizhu] run scoreboard players operation uo_nongmin_cnt var += @s shed_time
#春天
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] if score uo_nongmin_cnt var matches 0 run tellraw @a {"text":"春天：倍率*4","bold":true,"color":"red"}
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] if score uo_nongmin_cnt var matches 0 run scoreboard players operation #scale score *= 4 const
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] if score uo_dizhu_cnt var matches 1 run tellraw @a {"text":"反向春天：倍率*4","bold":true,"color":"red"}
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] if score uo_dizhu_cnt var matches 1 run scoreboard players operation #scale score *= 4 const
execute if score uo_temp var matches -1 run function doudizhu:upd_score_bossbar
#最后计算
execute if score uo_temp var matches -1 run scoreboard players operation #base score *= #scale score
execute if score uo_temp var matches -1 run scoreboard players operation #base2 score = #base score
execute if score uo_temp var matches -1 run scoreboard players operation #base2 score /= 2 const
#地主胜利
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run tellraw @a {"text":"===地主获胜===","bold":true,"color":"gold"}
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run scoreboard players operation @a[tag=dizhu,tag=Playing] score += #base score
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run scoreboard players operation @a[tag=!dizhu,tag=Playing] score -= #base2 score
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run tellraw @a ["",{"selector":"@a[tag=dizhu,tag=Playing]","bold":true,"color":"gold"},{"text":":+","bold":true,"color":"gold"},{"score":{"name":"#base","objective":"score"},"bold":true,"color":"gold"}]
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run tellraw @a ["",{"selector":"@a[tag=!dizhu,tag=Playing]","bold":true,"color":"red"},{"text":":-","bold":true,"color":"red"},{"score":{"name":"#base2","objective":"score"},"bold":true,"color":"red"}]
#农民胜利
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run tellraw @a {"text":"===农民获胜===","bold":true,"color":"red"}
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run scoreboard players operation @a[tag=dizhu,tag=Playing] score -= #base score
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run scoreboard players operation @a[tag=!dizhu,tag=Playing] score += #base2 score
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run tellraw @a ["",{"selector":"@a[tag=dizhu,tag=Playing]","bold":true,"color":"gold"},{"text":":-","bold":true,"color":"gold"},{"score":{"name":"#base","objective":"score"},"bold":true,"color":"gold"}]
execute if score uo_temp var matches -1 if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run tellraw @a ["",{"selector":"@a[tag=!dizhu,tag=Playing]","bold":true,"color":"red"},{"text":":+","bold":true,"color":"red"},{"score":{"name":"#base2","objective":"score"},"bold":true,"color":"red"}]
#摊牌处理
execute if score uo_temp var matches -1 as @e[tag=doudizhu,tag=Pos_Player] at @s run function doudizhu:final_show_cards
#场景fill air
execute if score uo_temp var matches -1 as @e[tag=Center,tag=doudizhu,limit=1] at @s run fill ~2 ~1 ~2 ~-3 ~4 ~-3 minecraft:air
#TP 观察者
execute if score uo_temp var matches -1 as @a[tag=!Player1,tag=!Player2,tag=!Player3] run tp @s @e[tag=doudizhu,tag=Join_game,limit=1]
execute if score uo_temp var matches -1 as @a[tag=!Player1,tag=!Player2,tag=!Player3] run gamemode adventure @s

#去掉标签并重置……
execute if score uo_temp var matches -1 as @e[tag=doudizhu,tag=Center] run tag @s remove Phase1
execute if score uo_temp var matches -1 as @e[tag=doudizhu,tag=Center] run tag @s remove Phase2
execute if score uo_temp var matches -1 run scoreboard players set round var -1
execute if score uo_temp var matches -1 run tag @a remove Player1
execute if score uo_temp var matches -1 run tag @a remove Player2
execute if score uo_temp var matches -1 run tag @a remove Player3
execute if score uo_temp var matches -1 run tag @a remove Playing
execute if score uo_temp var matches -1 run tag @a remove dizhu

execute if score uo_temp var matches -1 run bossbar set show_abandoned_cards visible false
#execute if score uo_temp var matches -1 run bossbar set show_abandoned_cards2 visible false
execute if score uo_temp var matches -1 run clear @a minecraft:carrot_on_a_stick