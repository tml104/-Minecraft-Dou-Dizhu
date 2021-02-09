#[DE2] 叫地主后给玩家帽子

#CLEAR
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] as @a[nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run clear @s leather_helmet
#地主
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player1,tag=dizhu] as @p[tag=Player1,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16701501,Name:'{"text":"地主帽子"}'}}
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player2,tag=dizhu] as @p[tag=Player2,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16701501,Name:'{"text":"地主帽子"}'}}
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player3,tag=dizhu] as @p[tag=Player3,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16701501,Name:'{"text":"地主帽子"}'}}
#农民
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player1,tag=!dizhu] as @p[tag=Player1,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16777215,Name:'{"text":"农民帽子"}'}}
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player2,tag=!dizhu] as @p[tag=Player2,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16777215,Name:'{"text":"农民帽子"}'}}
execute if entity @e[tag=doudizhu,tag=Center,tag=Phase2] if entity @e[tag=doudizhu,tag=Pos_Player3,tag=!dizhu] as @p[tag=Player3,nbt=!{Inventory:[{Slot:103b,id:"minecraft:leather_helmet"}]}] run replaceitem entity @s armor.head leather_helmet{display:{color:16777215,Name:'{"text":"农民帽子"}'}}