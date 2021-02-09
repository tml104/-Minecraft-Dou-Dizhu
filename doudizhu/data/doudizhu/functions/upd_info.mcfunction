#[UI] 更新UI上的有关信息

#解析用木板
execute as @e[tag=doudizhu,tag=Center,limit=1] at @s positioned ~ 1 ~ run setblock ~ ~ ~ minecraft:oak_sign replace

#更新Base_score信息
execute as @e[tag=doudizhu,tag=Center,limit=1] at @s positioned ~ 1 ~ run data modify block ~ ~ ~ Text1 set value '{"score":{"name":"#base","objective":"score"},"bold":true,"color":"light_purple"}'
execute as @e[tag=doudizhu,tag=Center,limit=1] at @s positioned ~ 1 ~ run data modify entity @e[tag=doudizhu,tag=UI,tag=Base_score,limit=1] CustomName set from block ~ ~ ~ Text1

#更新Skin_type信息
execute if score skin_type skin matches 1 run data modify entity @e[tag=doudizhu,tag=UI,tag=Skin_type,limit=1] CustomName set value '{"text":"Full screen (by KC)","bold":true,"color":"aqua"}'
execute if score skin_type skin matches 2 run data modify entity @e[tag=doudizhu,tag=UI,tag=Skin_type,limit=1] CustomName set value '{"text":"Clover (by xwjcool)","bold":true,"color":"dark_green"}'
execute if score skin_type skin matches 3 run data modify entity @e[tag=doudizhu,tag=UI,tag=Skin_type,limit=1] CustomName set value '{"text":"Clover 牌背分离版 (by xwjcool)","bold":true,"color":"dark_green"}'

#更新switch
execute if score voice_chat var matches 1 run data modify entity @e[tag=doudizhu,tag=UI,tag=Voice,limit=1] ArmorItems[3].tag.CustomModelData set value 204
execute if score voice_chat var matches 0 run data modify entity @e[tag=doudizhu,tag=UI,tag=Voice,limit=1] ArmorItems[3].tag.CustomModelData set value 203
execute if score bgm var matches 1 run data modify entity @e[tag=doudizhu,tag=UI,tag=BGM,limit=1] ArmorItems[3].tag.CustomModelData set value 204
execute if score bgm var matches 0 run data modify entity @e[tag=doudizhu,tag=UI,tag=BGM,limit=1] ArmorItems[3].tag.CustomModelData set value 203
execute if score google var matches 1 run data modify entity @e[tag=doudizhu,tag=UI,tag=Google,limit=1] ArmorItems[3].tag.CustomModelData set value 204
execute if score google var matches 0 run data modify entity @e[tag=doudizhu,tag=UI,tag=Google,limit=1] ArmorItems[3].tag.CustomModelData set value 203
execute if score qiang_mode var matches 1 run data modify entity @e[tag=doudizhu,tag=UI,tag=Qiang_Mode,limit=1] ArmorItems[3].tag.CustomModelData set value 204
execute if score qiang_mode var matches 0 run data modify entity @e[tag=doudizhu,tag=UI,tag=Qiang_Mode,limit=1] ArmorItems[3].tag.CustomModelData set value 203
