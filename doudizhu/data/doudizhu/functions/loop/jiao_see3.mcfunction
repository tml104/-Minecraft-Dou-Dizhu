#[JS]叫地主阶段的叫分判定

execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"1分"}'}}}},scores={rclick=1..}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen 1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"2分"}'}}}},scores={rclick=1..}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen 2
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"3分"}'}}}},scores={rclick=1..}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen 3
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pass"}'}}}},scores={rclick=1..}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen -1
#Q键
execute as @s[scores={test_q=1..,rclick=0,test_f=0,test_empty=0}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen -1
execute if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches -1 as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":不叫"}]
execute if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 1 as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":"},{"text":"1","color":"dark_aqua"},{"text":"分"}]
execute if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 2 as @s run tellraw @a ["",{"selector":"@s","bold":true},{"text":":"},{"text":"2","color":"red"},{"text":"分"}]
execute if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 3 as @s run tellraw @a ["",{"selector":"@s","bold":true},{"text":":"},{"text":"3","color":"gold"},{"text":"分"}]


execute as @e[tag=doudizhu,tag=Pos_Player3] unless score @s jiaofen matches 0 run function doudizhu:jiao_end_judge