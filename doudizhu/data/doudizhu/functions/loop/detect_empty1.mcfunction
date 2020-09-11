#[DE] 错位探测
#调用对象：玩家

#游戏开始前
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:0b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}]}] run scoreboard players set @s test_empty 1
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"前往牌桌/返回大厅"}'}}}]}] run scoreboard players set @s test_empty 1
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:5b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"基本操作说明"}'}}}]}] run scoreboard players set @s test_empty 1
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:6b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"快速操作说明"}'}}}]}] run scoreboard players set @s test_empty 1
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:7b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"声音与快速聊天说明"}'}}}]}] run scoreboard players set @s test_empty 1
execute if score round var matches -1 if entity @s[nbt=!{Inventory:[{Slot:8b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"倍数与分数计算说明"}'}}}]}] run scoreboard players set @s test_empty 1


#叫地主
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[nbt=!{Inventory:[{Slot:0b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pass"}'}}}]}] run scoreboard players set @s test_empty 1
#execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[scores={test_empty=1..}] run say ~1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[nbt=!{Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"1分"}'}}}]}] run scoreboard players set @s test_empty 1
#execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[scores={test_empty=1..}] run say ~2
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[nbt=!{Inventory:[{Slot:2b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"2分"}'}}}]}] run scoreboard players set @s test_empty 1
#execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[scores={test_empty=1..}] run say ~3
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[nbt=!{Inventory:[{Slot:3b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"3分"}'}}}]}] run scoreboard players set @s test_empty 1
#execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if entity @s[scores={test_empty=1..}] run say ~4

#出牌
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @s[nbt=!{Inventory:[{Slot:0b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"指针"}'}}}]}] run scoreboard players set @s test_empty 1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @s[nbt=!{Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"出牌"}'}}}]}] run scoreboard players set @s test_empty 1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @s[nbt=!{Inventory:[{Slot:2b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pass"}'}}}]}] run scoreboard players set @s test_empty 1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @s[nbt=!{Inventory:[{Slot:3b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"放大镜"}'}}}]}] run scoreboard players set @s test_empty 1
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @s[nbt=!{Inventory:[{Slot:4b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}]}] run scoreboard players set @s test_empty 1
