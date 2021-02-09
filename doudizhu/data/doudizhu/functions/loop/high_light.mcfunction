#[HL] 高亮正在出牌玩家，并且显示按键提示

execute if score round var matches -1 run effect give @e[tag=Prepared] glowing 1 0 true
execute if score round var matches 0 run effect give @p[tag=Player1] glowing 1 0 true
execute if score round var matches 1 run effect give @p[tag=Player2] glowing 1 0 true
execute if score round var matches 2 run effect give @p[tag=Player3] glowing 1 0 true


#游戏开始前
execute if score round var matches -1 run title @a actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": 准备/取消准备 ","color":"gold"},{"text":"[F]","bold":true,"color":"gold"},{"text":": 开始游戏","color":"gold"}]
#叫地主
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 0 as @p[tag=Player1] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 1 as @p[tag=Player2] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase1] if score round var matches 2 as @p[tag=Player3] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]

execute if entity @e[tag=doudizhu,tag=Center,tag=Phase3] if score round var matches 0 as @p[tag=Player1] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase3] if score round var matches 1 as @p[tag=Player2] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase3] if score round var matches 2 as @p[tag=Player3] run title @s actionbar ["",{"text":"[Q]","bold":true,"color":"gold"},{"text":": Pass","color":"gold"}]
#出牌（第一个）
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 if score sum last_outcards matches 0 as @p[tag=Player1] run title @s actionbar [{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 if score sum last_outcards matches 0 as @p[tag=Player2] run title @s actionbar [{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌","color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 if score sum last_outcards matches 0 as @p[tag=Player3] run title @s actionbar [{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌","color":"gold"}]
#出牌
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 0 if score sum last_outcards matches 1.. as @p[tag=Player1] run title @s actionbar ["",{"text":"[","color":"gold"},{"text":"Q","bold":true,"color":"gold"},{"text":"]: Pass   ","color":"gold"},{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌   ","color":"gold"},{"text":"当前牌型长度：","bold":true,"color":"red"},{"score":{"name":"sum","objective":"last_outcards"},"color":"red"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 1 if score sum last_outcards matches 1.. as @p[tag=Player2] run title @s actionbar ["",{"text":"[","color":"gold"},{"text":"Q","bold":true,"color":"gold"},{"text":"]: Pass   ","color":"gold"},{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌   ","color":"gold"},{"text":"当前牌型长度：","bold":true,"color":"red"},{"score":{"name":"sum","objective":"last_outcards"},"color":"red"}]
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if score round var matches 2 if score sum last_outcards matches 1.. as @p[tag=Player3] run title @s actionbar ["",{"text":"[","color":"gold"},{"text":"Q","bold":true,"color":"gold"},{"text":"]: Pass   ","color":"gold"},{"text":"[","color":"gold"},{"text":"F","bold":true,"color":"gold"},{"text":"]: 出牌   ","color":"gold"},{"text":"当前牌型长度：","bold":true,"color":"red"},{"score":{"name":"sum","objective":"last_outcards"},"color":"red"}]
