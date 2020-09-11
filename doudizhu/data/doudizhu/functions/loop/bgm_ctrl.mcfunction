#[BC]
#var: bc_res

scoreboard players operation bc_res timer = res timer

#BGM2
execute if score bgm var matches 1 if score round var matches -1 run scoreboard players operation bc_res timer %= 700 const
execute if score bgm var matches 1 if score round var matches -1 if score bc_res timer matches 1 as @a at @s run playsound minecraft:doudizhu.bgm2 record @s

#BGM1
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches 0 run scoreboard players operation bc_res timer %= 700 const
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches 0 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm1
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches 0 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm2
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches 0 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm3
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches 0 if score bc_res timer matches 1 as @a at @s run playsound minecraft:doudizhu.bgm1 record @s

#BGM3
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches ..-1 run scoreboard players operation bc_res timer %= 700 const
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches ..-1 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm1
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches ..-1 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm2
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches ..-1 if score bc_res timer matches 1 run stopsound @a * minecraft:doudizhu.bgm3
execute if score bgm var matches 1 if score round var matches 0.. if score bomb_cnt bomb matches ..-1 if score bc_res timer matches 1 as @a at @s run playsound minecraft:doudizhu.bgm3 record @s