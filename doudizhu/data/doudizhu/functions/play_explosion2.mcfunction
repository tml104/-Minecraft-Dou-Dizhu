#[PLE] 在doudizhu,Center处，播放爆炸效果

execute as @e[tag=doudizhu,tag=Center] at @s run kill @e[type=tnt,limit=1,distance=..10]
execute as @e[tag=doudizhu,tag=Center] at @s run playsound entity.generic.explode block @a ~ ~ ~
execute as @e[tag=doudizhu,tag=Center] at @s run particle minecraft:explosion_emitter ~ ~1 ~ .5 .5 .5 1 1

#say @s