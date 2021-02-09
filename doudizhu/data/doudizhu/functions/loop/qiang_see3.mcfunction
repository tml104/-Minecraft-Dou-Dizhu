#[QS] 抢地主阶段的叫分判定(player3)

scoreboard players set qs_temp var 0
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"Pass"}'}}}},scores={rclick=1..}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen -1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"叫分"}'}}}},scores={rclick=1..}] run scoreboard players add @e[tag=doudizhu,tag=Pos_Player3] jiaofen 1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"叫分"}'}}}},scores={rclick=1..}] run scoreboard players add jiaofen_times jiaofen 1
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},scores={rclick=1..}] run scoreboard players set qs_temp var 1
#Q
execute as @s[scores={test_q=1..,rclick=0,test_f=0,test_empty=0}] run scoreboard players set @e[tag=doudizhu,tag=Pos_Player3] jiaofen -1
execute as @s[scores={test_q=1..,rclick=0,test_f=0,test_empty=0}] run scoreboard players set qs_temp var 1

execute if score qs_temp var matches 1 if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches -1 if score jiaofen_times jiaofen matches 0 as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":不叫"}]
execute if score qs_temp var matches 1 if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches -1 if score jiaofen_times jiaofen matches 1.. as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":不抢"}]
execute if score qs_temp var matches 1 if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 1.. if score jiaofen_times jiaofen matches 1 as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":叫地主"}]
execute if score qs_temp var matches 1 if score @e[tag=doudizhu,tag=Pos_Player3,limit=1] jiaofen matches 1.. if score jiaofen_times jiaofen matches 2.. as @s run tellraw @a [{"selector":"@s","bold":true},{"text":":抢地主"}]

execute as @e[tag=doudizhu,tag=Pos_Player3] unless score qs_temp var matches 0 run function doudizhu:qiang_end_judge