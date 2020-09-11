#——记分板——
scoreboard objectives add var dummy
scoreboard objectives add card_id dummy
scoreboard objectives add const dummy
scoreboard objectives add rclick minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add amplifier dummy
scoreboard objectives add remain_cards dummy
#皮肤
scoreboard objectives add skin dummy
scoreboard players set skin_type skin 2

##voice_chat/BGM/google叫牌 开关
scoreboard players set voice_chat var 1
scoreboard players set bgm var 1
scoreboard players set google var 1

#位置记分板：控制玩家牌桌和大厅之间的传送
scoreboard objectives add pos dummy


#下面的记分板用于控制出牌信息
#里面有max_card card_type， 以及1、2、...、13、14、15、sum
scoreboard objectives add outcards dummy
scoreboard objectives add last_outcards dummy
#叫分记分板
scoreboard objectives add jiaofen dummy
#积分系统
scoreboard objectives add score dummy
scoreboard objectives setdisplay sidebar score
scoreboard players set @a score 10000
scoreboard players set #base score 1000
scoreboard players set #scale score 0
#出牌次数记分板
scoreboard objectives add shed_time dummy
#检测QF记分板
scoreboard objectives add test_q minecraft.dropped:minecraft.carrot_on_a_stick
scoreboard objectives add test_f dummy
scoreboard objectives add test_empty dummy
#检测green_dye被拿起的记分板
scoreboard objectives add test_green_dye dummy
#弃牌堆记牌器
scoreboard objectives add abandoned_cards dummy

#计时器
scoreboard objectives add timer dummy
scoreboard players set time_index timer 0
scoreboard players set res timer 0
execute store result score now_time timer run time query gametime
scoreboard players operation time_index timer = now_time timer

#炸弹记分板
scoreboard objectives add bomb dummy

#队伍
team add Selected
team modify Selected color red

#常数
scoreboard players set 1 const 1
scoreboard players set 2 const 2
scoreboard players set 3 const 3
scoreboard players set 4 const 4
scoreboard players set 5 const 5
scoreboard players set 10 const 10
scoreboard players set 20 const 20
scoreboard players set 700 const 700

#回合变量（-1表示未开始游戏）
scoreboard players set round var -1

#——记分板END——


#Tag reset
tag @a remove Prepared
tag @a remove Player1
tag @a remove Player2
tag @a remove Player3
tag @a remove dizhu


#倍率和底分的bossbar
bossbar add show_score_and_scale ["",{"text":"底分：","bold":true,"color":"light_purple"},{"score":{"name":"#base","objective":"score"},"bold":true,"color":"light_purple"},{"text":"      "},{"text":"倍率：","bold":true,"color":"red"},{"score":{"name":"#scale","objective":"score"},"bold":true,"color":"red"}]
bossbar set show_score_and_scale color red
bossbar set show_score_and_scale players @a
bossbar set show_score_and_scale visible false

#弃牌堆Bossbar
bossbar add show_abandoned_cards ""
bossbar set show_abandoned_cards color red
bossbar set show_abandoned_cards players
bossbar set show_score_and_scale visible false

#bossbar add show_abandoned_cards2 ""
#bossbar set show_abandoned_cards2 color red
#bossbar set show_abandoned_cards2 players
#bossbar set show_score_and_scale2 visible false


#位置marker
execute unless entity @e[type=area_effect_cloud,tag=doudizhu,tag=Center] run summon area_effect_cloud ~ ~2 ~ {Duration:2147483647,Tags:["doudizhu","Center"]}
execute unless entity @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player1] at @e[type=area_effect_cloud,tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~4 ~ ~ {Duration:2147483647,Tags:["doudizhu","Pos_Player1","Pos_Player"],Rotation:[0.0f,0.0f]}
execute unless entity @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player2] at @e[type=area_effect_cloud,tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~ ~ ~4 {Duration:2147483647,Tags:["doudizhu","Pos_Player2","Pos_Player"],Rotation:[90.0f,0.0f]}
execute unless entity @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player3] at @e[type=area_effect_cloud,tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~ ~ ~-4 {Duration:2147483647,Tags:["doudizhu","Pos_Player3","Pos_Player"],Rotation:[-90.0f,0.0f]}
execute unless entity @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Facedown] at @e[type=area_effect_cloud,tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~-4 ~ ~ {Duration:2147483647,Tags:["doudizhu","Pos_Facedown"],Rotation:[0.0f,0.0f]}
tag @e[tag=doudizhu,tag=Center] remove Phase1
tag @e[tag=doudizhu,tag=Center] remove Phase2
tag @e[tag=doudizhu,tag=Pos_Player] remove dizhu

clear @a
execute as @a run function doudizhu:replaceitem_beforestart
execute as @a run function doudizhu:replaceitem_green_dye

#放一次音乐
stopsound @a
#execute as @a at @s run playsound minecraft:doudizhu.bgm2 block @s

#生成UI……
#summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"轻点这里以准备"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","Join_game"],ArmorItems:[{id:"black_dye",Count:1b}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Join_game] as @e[tag=doudizhu,tag=Center,limit=1] at @s positioned ~47 ~ ~-1 run summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"准备/取消准备"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","Join_game"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:205}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Start_game] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~ ~-2 run summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"开始游戏"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","Start_game"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:206}}]}

execute unless entity @e[tag=doudizhu,tag=UI,tag=L_score] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-1 ~-2 run summon armor_stand ~ ~ ~ {CustomNameVisible:false,CustomName:'{"text":"L1"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","L_score"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:201}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=R_score] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-1 ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:false,CustomName:'{"text":"R1"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","R_score"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:202}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Base_score] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-2 ~-1 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"Base_score"}',Tags:["doudizhu","UI","Base_score"],Duration:2147483647}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Base_score_name] as @e[tag=doudizhu,tag=UI,tag=Base_score] at @s positioned ~ ~0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"初始底分"}',Tags:["doudizhu","UI","Base_score_name"],Duration:2147483647}

execute unless entity @e[tag=doudizhu,tag=UI,tag=L_skin] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-1 ~1 run summon armor_stand ~ ~ ~ {CustomNameVisible:false,CustomName:'{"text":"L2"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","L_skin"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:201}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=R_skin] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-1 ~5 run summon armor_stand ~ ~ ~ {CustomNameVisible:false,CustomName:'{"text":"R2"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","R_skin"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:202}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Skin_type] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~-2 ~3 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"Skin_type"}',Tags:["doudizhu","UI","Skin_type"],Duration:2147483647}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Skin_type_name] as @e[tag=doudizhu,tag=UI,tag=Skin_type] at @s positioned ~ ~0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"牌面皮肤"}',Tags:["doudizhu","UI","Skin_type_name"],Duration:2147483647}


execute unless entity @e[tag=doudizhu,tag=UI,tag=Voice] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~ ~2 run summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"快速聊天"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","Voice"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:204}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=BGM] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~ ~3 run summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"背景音乐"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","BGM"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:204}}]}
execute unless entity @e[tag=doudizhu,tag=UI,tag=Google] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~ ~ ~4 run summon armor_stand ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"语音报牌"}',NoGravity:true,Invisible:true,Marker:true,Rotation:[90.0f,0.0f],Tags:["doudizhu","UI","Google"],ArmorItems:[{},{},{},{id:"black_dye",Count:1b,tag:{CustomModelData:204}}]}
#说明性文字：弃用，改为让玩家在6789槽位触发

#execute unless entity @e[tag=doudizhu,tag=Jiben_1] as @e[tag=doudizhu,tag=Join_game,limit=1] at @s positioned ~-4 ~1 ~-3 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"基本操作","bold":true}',Tags:["doudizhu","UI","Jiben_1"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_2] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"手持“指针”对准大厅各个按钮并按下使用键即可交互"}',Tags:["doudizhu","UI","Jiben_2"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_3] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-1 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"使用“前往牌桌/返回大厅”以在牌桌和大厅之间传送"}',Tags:["doudizhu","UI","Jiben_3"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_4] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-1.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"叫地主阶段，手持1、2、3或Pass按下使用键即可叫分"}',Tags:["doudizhu","UI","Jiben_4"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_5] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-2 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"出牌阶段，手持“指针”对准自己的牌按下使用键可选择/取消选择"}',Tags:["doudizhu","UI","Jiben_5"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_6] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-2.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"使用“放大镜”(4号位)可启用/取消放大效果"}',Tags:["doudizhu","UI","Jiben_6"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_7] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-3 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"使用“弃牌堆记牌器”(5号位)可在屏幕上方显示/隐藏各个已打出牌的数量"}',Tags:["doudizhu","UI","Jiben_7"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Jiben_8] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~-3.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"开启“玩家列表”(Tab)可查看玩家的剩余牌数"}',Tags:["doudizhu","UI","Jiben_8"],Duration:2147483647}
#
#execute unless entity @e[tag=doudizhu,tag=Kuaisu_1] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~ ~-5 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"快速操作","bold":true}',Tags:["doudizhu","UI","Kuaisu_1"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Kuaisu_2] as @e[tag=doudizhu,tag=Kuaisu_1,limit=1] at @s positioned ~ ~-0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"（操作以默认按键为准）"}',Tags:["doudizhu","UI","Kuaisu_2"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Kuaisu_3] as @e[tag=doudizhu,tag=Kuaisu_1,limit=1] at @s positioned ~ ~-1 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"（大厅）[Q]：准备/取消准备  [F]：开始游戏"}',Tags:["doudizhu","UI","Kuaisu_3"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Kuaisu_4] as @e[tag=doudizhu,tag=Kuaisu_1,limit=1] at @s positioned ~ ~-1.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"（游戏中）[Q]：Pass  [F]：出牌"}',Tags:["doudizhu","UI","Kuaisu_4"],Duration:2147483647}
#
#execute unless entity @e[tag=doudizhu,tag=Sheng_1] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~ ~-10 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"声音与快速聊天","bold":true}',Tags:["doudizhu","UI","Sheng_1"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Sheng_2] as @e[tag=doudizhu,tag=Sheng_1,limit=1] at @s positioned ~ ~-0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"启用时，打开物品栏并点击对应图标以发送快速语音聊天"}',Tags:["doudizhu","UI","Sheng_2"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Sheng_3] as @e[tag=doudizhu,tag=Sheng_1,limit=1] at @s positioned ~ ~-1 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"快速语音聊天的音量：“设置->音乐和声音->玩家”"}',Tags:["doudizhu","UI","Sheng_3"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Sheng_4] as @e[tag=doudizhu,tag=Sheng_1,limit=1] at @s positioned ~ ~-1.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"背景音乐的音量：“设置->音乐和声音->唱片机/音符盒”"}',Tags:["doudizhu","UI","Sheng_4"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Sheng_5] as @e[tag=doudizhu,tag=Sheng_1,limit=1] at @s positioned ~ ~-2 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"语音报牌的音量：“设置->音乐和声音->声音/语音”"}',Tags:["doudizhu","UI","Sheng_5"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Sheng_6] as @e[tag=doudizhu,tag=Sheng_1,limit=1] at @s positioned ~ ~-2.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"推荐启用快速语音聊天时将对应音量调至50%以下"}',Tags:["doudizhu","UI","Sheng_6"],Duration:2147483647}
#
#execute unless entity @e[tag=doudizhu,tag=Fen_1] as @e[tag=doudizhu,tag=Jiben_1,limit=1] at @s positioned ~ ~ ~-16 run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"倍数与分数计算","bold":true}',Tags:["doudizhu","UI","Fen_1"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Fen_2] as @e[tag=doudizhu,tag=Fen_1,limit=1] at @s positioned ~ ~-0.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"以所有玩家叫分总和为初始倍率"}',Tags:["doudizhu","UI","Fen_2"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Fen_3] as @e[tag=doudizhu,tag=Fen_1,limit=1] at @s positioned ~ ~-1 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"每回合结束，倍率+1"}',Tags:["doudizhu","UI","Fen_3"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Fen_4] as @e[tag=doudizhu,tag=Fen_1,limit=1] at @s positioned ~ ~-1.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"炸弹：倍率✖2； 王炸：倍率✖4"}',Tags:["doudizhu","UI","Fen_4"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Fen_5] as @e[tag=doudizhu,tag=Fen_1,limit=1] at @s positioned ~ ~-2 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"春天、反向春天：倍率✖4"}',Tags:["doudizhu","UI","Fen_5"],Duration:2147483647}
#execute unless entity @e[tag=doudizhu,tag=Fen_6] as @e[tag=doudizhu,tag=Fen_1,limit=1] at @s positioned ~ ~-2.5 ~ run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:true,CustomName:'{"text":"最终地主分数为：底分✖倍数;每个农民分数为：底分✖倍数✖1/2"}',Tags:["doudizhu","UI","Fen_6"],Duration:2147483647}




#生成结构
kill @e[type=item_frame]
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-6 ~-10 minecraft:structure_block{mode:"LOAD",name:"doudizhu:playing_room",posX:0,posY:1,posZ:0} destroy
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~12 ~-4 ~-10 minecraft:structure_block{mode:"LOAD",name:"doudizhu:lobby",posX:0,posY:1,posZ:0} destroy

#激活
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-5 ~-10 minecraft:redstone_block destroy
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~-5 ~-6 ~-10 minecraft:air
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~12 ~-3 ~-10 minecraft:redstone_block destroy
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run setblock ~12 ~-4 ~-10 minecraft:air

#中间填充air
execute as @e[tag=Center,tag=doudizhu,limit=1] at @s run fill ~2 ~1 ~2 ~-3 ~4 ~-3 minecraft:air
kill @e[type=item]

function doudizhu:upd_info

#tp 玩家
execute as @e[tag=Join_game,tag=doudizhu,limit=1] at @s run tp @a @s
gamemode adventure @a

#say 斗地主08242207
#say 斗地主0830
tellraw @a ["",{"text":"=====斗 地 主=====","bold":true,"color":"red"},{"text":"\n"},{"text":"v1.0 (2020.9.10)","italic":true,"color":"red"},{"text":"\n"},{"text":"游戏规则：","bold":true,"color":"gold"},{"text":"维基百科","underlined":true,"clickEvent":{"action":"open_url","value":"https://zh.wikipedia.org/wiki/%E9%AC%A5%E5%9C%B0%E4%B8%BB"}},{"text":"\n\n"},{"text":"制作人员名单（顺序不分先后）：","bold":true,"color":"red"},{"text":"\n"},{"text":"命令：","bold":true,"color":"gold"},{"text":"TML_104","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/1862695"}},{"text":"\n"},{"text":"牌面：","bold":true,"color":"gold"},{"text":"xwjcool","underlined":true,"clickEvent":{"action":"open_url","value":"https://www.mcbbs.net/?259064"}},{"text":","},{"text":"mc_Kevin_Creeper","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/38899104"}},{"text":"\n"},{"text":"建筑：","bold":true,"color":"gold"},{"text":"落天望月","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/26260796"}},{"text":"\n"},{"text":"测试：","bold":true,"color":"gold"},{"text":"TML_104","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/1862695"}},{"text":","},{"text":"mc_Kevin_Creeper","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/38899104"}},{"text":","},{"text":"Sunny_loy_Kyle","underlined":true,"clickEvent":{"action":"open_url","value":"https://space.bilibili.com/33229178"}},{"text":"\n"}]
