#[QSP] 按Q准备或者取消准备
#调用：玩家
#var: qsp_temp


execute if entity @s[tag=!Prepared] run scoreboard players set qsp_temp var 1
execute if entity @s[tag=Prepared] run scoreboard players set qsp_temp var 2

execute if score qsp_temp var matches 1 run tellraw @s {"text":"您已准备","bold":true,"color":"green"}
execute if score qsp_temp var matches 1 run tag @s add Prepared
execute if score qsp_temp var matches 2 run tellraw @s {"text":"您已取消准备","bold":true,"color":"red"}
execute if score qsp_temp var matches 2 run tag @s remove Prepared