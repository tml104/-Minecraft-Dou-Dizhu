#[DE] 生成牌实体，并且将统计信息保存在Pos_Player1(2,3)里
#return:-

#summon AS
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player1,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as1
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player2,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as2
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Player3,limit=1] positioned ^ ^ ^-3 run function doudizhu:recursive/distribute_summon_as3
execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Pos_Facedown,limit=1] positioned ^ ^ ^-2 run function doudizhu:recursive/distribute_summon_as4

scoreboard players set @e[tag=Pos_Player1,tag=doudizhu] remain_cards 17
scoreboard players set @e[tag=Pos_Player2,tag=doudizhu] remain_cards 17
scoreboard players set @e[tag=Pos_Player3,tag=doudizhu] remain_cards 17
function doudizhu:upd_remain_cards