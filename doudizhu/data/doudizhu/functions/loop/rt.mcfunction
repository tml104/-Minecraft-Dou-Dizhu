#[RT][loop] 对右键（Q、F）的各种探测操作
#注：按键提示在high light函数里

#重设盔甲架Glowing
execute as @e[type=armor_stand,tag=doudizhu] run data merge entity @s {Glowing:0b}
#execute as @e[type=armor_stand,tag=doudizhu,team=Selected] run data merge entity @s {Glowing:1b}
#检测Q
execute if score round var matches -1 as @a[scores={test_q=1..}] run function doudizhu:replaceitem_beforestart
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] as @a[scores={test_q=1..}] run function doudizhu:replaceitem_jiao
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] as @a[scores={test_q=1..}] run function doudizhu:replaceitem_chupai
#检测F
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick"}]}] run scoreboard players set @s test_f 1
execute if score round var matches -1 as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick"}]}] run function doudizhu:replaceitem_beforestart
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick"}]}] run function doudizhu:replaceitem_jiao
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick"}]}] run function doudizhu:replaceitem_chupai
#检测错位
execute as @a run function doudizhu:loop/detect_empty1
execute if score round var matches -1 as @a[scores={test_empty=1..}] run function doudizhu:replaceitem_beforestart
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] as @a[scores={test_empty=1..}] run function doudizhu:replaceitem_jiao
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] as @a[scores={test_empty=1..}] run function doudizhu:replaceitem_chupai
#检测green_dye
execute as @a run function doudizhu:loop/detect_green_dye
execute as @a[scores={test_green_dye=1..}] at @s run function doudizhu:replaceitem_green_dye
execute as @a[scores={test_green_dye=1..13}] run function doudizhu:show_voice_chat_info
#帽子检测
execute as @a run function doudizhu:loop/detect_empty2

#execute as @a[scores={test_q=1..}] run say @s Q
#execute as @a[scores={test_f=1..}] run say @s F
#execute as @a[scores={test_empty=1..}] run say @s 错位
#execute as @a[scores={test_q=1..,test_empty=1..}] run say @s Q错位

#游戏未开始时的选项选择
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3] at @s positioned ~ ~1.8 ~ run function doudizhu:loop/see
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"前往牌桌/返回大厅"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3,scores={rclick=1..}] at @s run function doudizhu:tp_between
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"基本操作说明"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3,scores={rclick=1..}] at @s run tellraw @s ["",{"text":"====基本操作====","bold":true,"color":"red"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"手持"},{"text":"“指针”","bold":true,"color":"aqua"},{"text":"对准大厅各个按钮并按下使用键即可交互"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"使用"},{"text":"“前往牌桌/返回大厅”","bold":true,"color":"aqua"},{"text":"以在牌桌和大厅之间传送"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"叫地主阶段，手持"},{"text":"1、2、3","bold":true,"color":"aqua"},{"text":"或"},{"text":"Pass","bold":true,"color":"aqua"},{"text":"并按下使用键即可叫分"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"使用"},{"text":"“放大镜”（4号位）","bold":true,"color":"aqua"},{"text":"可启用/取消放大效果"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"使用"},{"text":"“弃牌堆记牌器”（5号位）","bold":true,"color":"aqua"},{"text":"可在屏幕上方显示/隐藏各个已打出牌的数量"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"开启"},{"text":"“玩家列表”","bold":true,"color":"red"},{"text":"可查看玩家的剩余牌数"},{"text":"\n"}]
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"快速操作说明"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3,scores={rclick=1..}] at @s run tellraw @s ["",{"text":"====快速操作====","bold":true,"color":"red"},{"text":"\n"},{"text":"（操作以默认按键为准）"},{"text":"\n"},{"text":"大厅：","bold":true,"color":"gold"},{"text":"[Q]：准备/取消准备  [F]：开始游戏"},{"text":"\n"},{"text":"游戏中","bold":true,"color":"gold"},{"text":"[Q]：Pass  [F]：出牌"},{"text":"\n"}]
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"声音与快速聊天说明"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3,scores={rclick=1..}] at @s run tellraw @s ["",{"text":"====声音与快速聊天====","bold":true,"color":"red"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"启用时，打开物品栏并点击对应图标以发送快速语音聊天"},{"text":"\n"},{"text":"“快速语音聊天”的音量：","bold":true,"color":"gold"},{"text":"“设置->音乐和声音->玩家”"},{"text":"\n"},{"text":"“背景音乐”的音量：","bold":true,"color":"gold"},{"text":"“设置->音乐和声音->唱片机/音符盒”"},{"text":"\n"},{"text":"“语音报牌”的音量：","bold":true,"color":"gold"},{"text":"“设置->音乐和声音->声音/语音”"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"推荐启用快速语音聊天时将对应音量调至50%以下"},{"text":"\n"}]
execute if score round var matches -1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"倍数与分数计算说明"}'}}}},tag=!Player1,tag=!Player2,tag=!Player3,scores={rclick=1..}] at @s run tellraw @s ["",{"text":"====倍数与分数计算====","bold":true,"color":"red"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"以所有玩家叫分总和为初始倍率"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"每回合结束，倍率+1"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"炸弹：倍率✖2； 王炸：倍率✖4"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"春天、反向春天：倍率✖4"},{"text":"\n"},{"text":"> ","bold":true,"color":"gold"},{"text":"最终地主分数为：底分✖倍数; 每个农民分数为：底分✖倍数✖1/2"},{"text":"\n"}]

#Q准备/取消准备
execute if score round var matches -1 as @a[scores={test_q=1..}] run function doudizhu:q_switch_prepared
#F 尝试开始游戏
execute if score round var matches -1 as @a[scores={test_f=1..}] run function doudizhu:start_game

#游戏开始后
#阶段1 叫地主
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 0 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},tag=Player1] run function doudizhu:loop/jiao_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},tag=Player2] run function doudizhu:loop/jiao_see2
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 2 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},tag=Player3] run function doudizhu:loop/jiao_see3

#阶段2 出牌
#选牌
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}},tag=Player1] at @s positioned ~ ~1.8 ~ run function doudizhu:loop/see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}},tag=Player2] at @s positioned ~ ~1.8 ~ run function doudizhu:loop/see2
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}},tag=Player3] at @s positioned ~ ~1.8 ~ run function doudizhu:loop/see3
#使用其他钓竿
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pointer"}'}}}},scores={rclick=1..},tag=Player1] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pointer"}'}}}},scores={rclick=1..},tag=Player2] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pointer"}'}}}},scores={rclick=1..},tag=Player3] run function doudizhu:loop/use_other_see1
#F 
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 as @a[tag=Player1,scores={test_empty=0,test_f=1..,test_q=0}] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 as @a[tag=Player2,scores={test_empty=0,test_f=1..,test_q=0}] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 as @a[tag=Player3,scores={test_empty=0,test_f=1..,test_q=0}] run function doudizhu:loop/use_other_see1
#Q 
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 as @a[tag=Player1,scores={test_empty=0,test_f=0,test_q=1..}] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 as @a[tag=Player2,scores={test_empty=0,test_f=0,test_q=1..}] run function doudizhu:loop/use_other_see1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 as @a[tag=Player3,scores={test_empty=0,test_f=0,test_q=1..}] run function doudizhu:loop/use_other_see1

#Reset in other function
#execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},scores={rclick=1..}] run scoreboard players set @s rclick 0
