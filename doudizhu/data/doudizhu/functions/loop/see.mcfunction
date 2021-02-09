#[RT] 未在游戏中的玩家
#var:rt_temp

scoreboard players set rt_temp var 0
execute as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1] run data merge entity @s {Glowing:1b}
execute as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1] run scoreboard players set rt_temp var -1

#execute if score rt_temp var matches -1 run say -1
#准备
#原来有prepar的为1，否则为2，只是看着为-1
execute if entity @s[scores={rclick=1..},tag=Prepared] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Join_game] run scoreboard players set rt_temp var 1
execute if entity @s[scores={rclick=1..},tag=!Prepared] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Join_game] run scoreboard players set rt_temp var 2
execute if score rt_temp var matches 2 run tag @s add Prepared
execute if score rt_temp var matches 2 run tellraw @s {"text":"您已准备","bold":true,"color":"green"}
execute if score rt_temp var matches 1 run tag @s remove Prepared 
execute if score rt_temp var matches 1 run tellraw @s {"text":"您已取消准备","bold":true,"color":"red"}

#开始游戏
execute if entity @s[scores={rclick=1..}] if entity @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Start_game] as @s run function doudizhu:start_game

#调节底分
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=L_score] run scoreboard players remove #base score 100
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=R_score] run scoreboard players add #base score 100
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score #base score matches ..0 run scoreboard players set #base score 10000
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score #base score matches 10001.. run scoreboard players set #base score 100

#皮肤调节
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=L_skin] run scoreboard players remove skin_type skin 1
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=R_skin] run scoreboard players add skin_type skin 1
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score skin_type skin matches ..0 run scoreboard players set skin_type skin 3
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score skin_type skin matches 4.. run scoreboard players set skin_type skin 1

#启用/禁用voice chat
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Voice] run scoreboard players add voice_chat var 1
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score voice_chat var matches 2.. run scoreboard players set voice_chat var 0

#启用/禁用BGM
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=BGM] run scoreboard players add bgm var 1
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score bgm var matches 2.. run scoreboard players set bgm var 0
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score bgm var matches 0 if entity @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=BGM] run stopsound @a
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score bgm var matches 1 if entity @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=BGM] run scoreboard players operation time_index timer = now_time timer

#启用/禁用出牌声音
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Google] run scoreboard players add google var 1
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score google var matches 2.. run scoreboard players set google var 0

#启用/禁用抢地主模式
execute if entity @s[scores={rclick=1..}] as @e[tag=doudizhu,tag=UI,type=armor_stand,distance=..0.3,limit=1,tag=Qiang_Mode] run scoreboard players add qiang_mode var 1
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 if score qiang_mode var matches 2.. run scoreboard players set qiang_mode var 0


#更新UI显示
execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 run function doudizhu:upd_info


execute if entity @s[scores={rclick=1..}] if score rt_temp var matches -1 run scoreboard players set @s rclick 0
execute if entity @s[distance=..5] if score rt_temp var matches 0 positioned ^ ^ ^0.3 run function doudizhu:loop/see