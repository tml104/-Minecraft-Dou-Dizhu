#[DE]
#input: de_i


execute if score de_as5dir var matches -90 run summon armor_stand ~ ~ ~ {CustomName:'{"text":"Onlyback"}',CustomNameVisible:false,NoGravity:true,Invisible:true,Marker:true,Rotation:[-90.0f,0.0f],ArmorItems: [{}, {}, {}, {id: "minecraft:blue_dye", Count: 1b,tag:{CustomModelData:555}}],Tags:["doudizhu","Onlyback","Card"]}
execute if score de_as5dir var matches 0 run summon armor_stand ~ ~ ~ {CustomName:'{"text":"Onlyback"}',CustomNameVisible:false,NoGravity:true,Invisible:true,Marker:true,Rotation:[0.0f,0.0f],ArmorItems: [{}, {}, {}, {id: "minecraft:blue_dye", Count: 1b,tag:{CustomModelData:555}}],Tags:["doudizhu","Onlyback","Card"]}
execute if score de_as5dir var matches 180 run summon armor_stand ~ ~ ~ {CustomName:'{"text":"Onlyback"}',CustomNameVisible:false,NoGravity:true,Invisible:true,Marker:true,Rotation:[180.0f,0.0f],ArmorItems: [{}, {}, {}, {id: "minecraft:blue_dye", Count: 1b,tag:{CustomModelData:555}}],Tags:["doudizhu","Onlyback","Card"]}
#execute as @e[tag=doudizhu,tag=Onlyback,tag=Card,type=armor_stand,sort=nearest,limit=1] store result entity @s Rotation[0] float 1 run scoreboard players get de_as5dir var

scoreboard players remove de_i var 1
execute if score de_i var matches 1.. positioned ^-0.01 ^ ^0.4 run function doudizhu:recursive/distribute_summon_as5
