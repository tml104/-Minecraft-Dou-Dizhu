#[SP] 展示pass AS

execute if score round var matches 0 as @e[tag=doudizhu,tag=Pos_Player1] at @s positioned ^-3 ^ ^ run summon armor_stand ~ ~-1 ~ {Tags:["doudizhu","Card","Player1","Outcard"],CustomName:'{"text":"Pass"}',CustomNameVisible:true,Invisible:true,Invulnerable:true,Marker:true}
execute if score round var matches 1 as @e[tag=doudizhu,tag=Pos_Player2] at @s positioned ^-3 ^ ^ run summon armor_stand ~ ~-1 ~ {Tags:["doudizhu","Card","Player2","Outcard"],CustomName:'{"text":"Pass"}',CustomNameVisible:true,Invisible:true,Invulnerable:true,Marker:true}
execute if score round var matches 2 as @e[tag=doudizhu,tag=Pos_Player3] at @s positioned ^-3 ^ ^ run summon armor_stand ~ ~-1 ~ {Tags:["doudizhu","Card","Player3","Outcard"],CustomName:'{"text":"Pass"}',CustomNameVisible:true,Invisible:true,Invulnerable:true,Marker:true}
