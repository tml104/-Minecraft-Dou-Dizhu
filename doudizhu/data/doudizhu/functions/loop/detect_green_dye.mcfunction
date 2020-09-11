#[DGD] 检测玩家使用voice chat（green_dye）

execute if entity @s[nbt=!{Inventory:[{Slot:9b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 1
execute if entity @s[nbt=!{Inventory:[{Slot:10b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 2
execute if entity @s[nbt=!{Inventory:[{Slot:11b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 3
execute if entity @s[nbt=!{Inventory:[{Slot:12b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 4
execute if entity @s[nbt=!{Inventory:[{Slot:13b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 5
execute if entity @s[nbt=!{Inventory:[{Slot:14b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 6
execute if entity @s[nbt=!{Inventory:[{Slot:15b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 7
execute if entity @s[nbt=!{Inventory:[{Slot:16b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 8
execute if entity @s[nbt=!{Inventory:[{Slot:17b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 9

execute if entity @s[nbt=!{Inventory:[{Slot:18b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 10
execute if entity @s[nbt=!{Inventory:[{Slot:19b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 11
execute if entity @s[nbt=!{Inventory:[{Slot:20b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 12
execute if entity @s[nbt=!{Inventory:[{Slot:21b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 13


#阻止刚进入的玩家播放语音
execute if entity @s[nbt=!{Inventory:[{Slot:17b,id:"minecraft:green_dye"}]}] if entity @s[nbt=!{Inventory:[{Slot:16b,id:"minecraft:green_dye"}]}] run scoreboard players set @s test_green_dye 114514
#execute if entity @s[nbt=!{Inventory:[{Slot:0b,id:"minecraft:carrot_on_a_stick"},{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] run scoreboard players set @s test_green_dye 114514
#execute if score res timer matches 0 run scoreboard players set @s test_green_dye 114514
#execute if score @s test_green_dye matches 13 if entity @s[nbt=!{Inventory:[{Slot:17b,id:"minecraft:green_dye"}]}] 

#tellraw @a {"score":{"name":"@s","objective":"test_green_dye"}}