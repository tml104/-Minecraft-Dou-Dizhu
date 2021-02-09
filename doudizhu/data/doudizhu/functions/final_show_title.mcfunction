#[FST] 游戏结束时，给玩家展示胜利或失败title, 同时播放音效

title @a times 10 40 20
#地主胜利
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run title @a[tag=dizhu,tag=Playing] subtitle [{"text":"+","bold":true,"color":"gold"},{"score":{"name":"#base1","objective":"score"},"bold":true,"color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run title @a[tag=!dizhu,tag=Playing] subtitle [{"text":"-","bold":true,"color":"red"},{"score":{"name":"#base2","objective":"score"},"bold":true,"color":"red"}]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run title @a[tag=dizhu,tag=Playing] title {"text":"地主胜利","color":"yellow"}
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] run title @a[tag=!dizhu,tag=Playing] title {"text":"农民失败","color":"gray"}
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] as @e[tag=doudizhu,tag=Center,limit=1] at @s run playsound minecraft:doudizhu.win voice @a[tag=dizhu,tag=Playing]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=dizhu] as @e[tag=doudizhu,tag=Center,limit=1] at @s run playsound minecraft:doudizhu.lose voice @a[tag=!dizhu,tag=Playing]

#农民胜利
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run title @a[tag=dizhu,tag=Playing] subtitle [{"text":"-","bold":true,"color":"gold"},{"score":{"name":"#base1","objective":"score"},"bold":true,"color":"gold"}]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run title @a[tag=!dizhu,tag=Playing] subtitle [{"text":"+","bold":true,"color":"red"},{"score":{"name":"#base2","objective":"score"},"bold":true,"color":"red"}]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run title @a[tag=dizhu,tag=Playing] title {"text":"地主失败","color":"gray"}
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] run title @a[tag=!dizhu,tag=Playing] title {"text":"农民胜利","color":"red"}
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] as @e[tag=doudizhu,tag=Center,limit=1] at @s run playsound minecraft:doudizhu.win voice @a[tag=!dizhu,tag=Playing]
execute if entity @e[tag=doudizhu,tag=Pos_Player,tag=Finished,tag=!dizhu] as @e[tag=doudizhu,tag=Center,limit=1] at @s run playsound minecraft:doudizhu.lose voice @a[tag=dizhu,tag=Playing]