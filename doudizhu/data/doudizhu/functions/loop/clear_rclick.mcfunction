#[-] 最后清空所有玩家的点击记分板、杀物品实体

kill @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:green_dye"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_helmet"}}]

scoreboard players set @a rclick 0
scoreboard players set @a test_f 0
scoreboard players set @a test_q 0
scoreboard players set @a test_empty 0
scoreboard players set @a test_green_dye 0

