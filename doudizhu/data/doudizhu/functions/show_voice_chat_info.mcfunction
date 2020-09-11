#[SVCI] 显示voice chat information 并播放声音

execute if score voice_chat var matches 0 run scoreboard players set @s test_green_dye 0

execute if score @s test_green_dye matches 1 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“得”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"得✖17"}}}]
execute if score @s test_green_dye matches 2 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“赌怪”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"赌怪"}}}]
execute if score @s test_green_dye matches 3 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“陈刀仔”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":["",{"text":"当年陈刀仔他能用20块赢到3700万"},{"text":"我卢本伟用20万赢到500万不是问题"}]}}]
execute if score @s test_green_dye matches 4 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“很NB这个牌”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"很NB这个牌"}}}]
execute if score @s test_green_dye matches 5 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“阿姨你快点”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"阿姨你快点别磨磨蹭蹭的"}}}]
execute if score @s test_green_dye matches 6 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“卡布奇诺”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":["",{"text":"给阿姨倒杯茶好吧"},{"text":"给阿姨倒一杯卡布奇诺"}]}}]
execute if score @s test_green_dye matches 7 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“漂亮”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"漂亮"}}}]
execute if score @s test_green_dye matches 8 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“17张牌你能秒我？”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":{"text":"17张牌，你能秒我？你能秒杀我？"}}}]
execute if score @s test_green_dye matches 9 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“吃屏幕”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":["",{"text":"你今天能17张牌把卢本伟秒了"},{"text":"我当场就把这个电脑屏幕吃掉"}]}}]

execute if score @s test_green_dye matches 10 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“炸弹秀”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"开始你的炸弹秀"}]}}]
execute if score @s test_green_dye matches 11 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“闷声发大财”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"闷声发大财"}]}}]
execute if score @s test_green_dye matches 12 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“赢不了我”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"TA的牌赢不了我"}]}}]
execute if score @s test_green_dye matches 13 run tellraw @a ["",{"selector":"@s"},{"text":"播放了语音"},{"text":"“可是换不得”","bold":true,"color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"可是换不得"}]}}]


stopsound @a * minecraft:doudizhu.v1
stopsound @a * minecraft:doudizhu.v2
stopsound @a * minecraft:doudizhu.v3
stopsound @a * minecraft:doudizhu.v4
stopsound @a * minecraft:doudizhu.v5
stopsound @a * minecraft:doudizhu.v6
stopsound @a * minecraft:doudizhu.v7
stopsound @a * minecraft:doudizhu.v8
stopsound @a * minecraft:doudizhu.v9
stopsound @a * minecraft:doudizhu.v10
stopsound @a * minecraft:doudizhu.v11
stopsound @a * minecraft:doudizhu.v12
stopsound @a * minecraft:doudizhu.v13



execute if score @s test_green_dye matches 1 as @a at @s run playsound minecraft:doudizhu.v1 player @s
execute if score @s test_green_dye matches 2 as @a at @s run playsound minecraft:doudizhu.v2 player @s
execute if score @s test_green_dye matches 3 as @a at @s run playsound minecraft:doudizhu.v3 player @s
execute if score @s test_green_dye matches 4 as @a at @s run playsound minecraft:doudizhu.v4 player @s
execute if score @s test_green_dye matches 5 as @a at @s run playsound minecraft:doudizhu.v5 player @s
execute if score @s test_green_dye matches 6 as @a at @s run playsound minecraft:doudizhu.v6 player @s
execute if score @s test_green_dye matches 7 as @a at @s run playsound minecraft:doudizhu.v7 player @s
execute if score @s test_green_dye matches 8 as @a at @s run playsound minecraft:doudizhu.v8 player @s
execute if score @s test_green_dye matches 9 as @a at @s run playsound minecraft:doudizhu.v9 player @s

execute if score @s test_green_dye matches 10 as @a at @s run playsound minecraft:doudizhu.v10 player @s
execute if score @s test_green_dye matches 11 as @a at @s run playsound minecraft:doudizhu.v11 player @s
execute if score @s test_green_dye matches 12 as @a at @s run playsound minecraft:doudizhu.v12 player @s
execute if score @s test_green_dye matches 13 as @a at @s run playsound minecraft:doudizhu.v13 player @s