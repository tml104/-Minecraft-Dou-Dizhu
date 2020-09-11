#[SF] recursively summon 54 AEC
#input:sf_i
#return:54 aec with tags "Shuffle_used_aec" and score "card_id"

execute at @e[type=area_effect_cloud,tag=doudizhu,tag=Center,limit=1] run summon area_effect_cloud ~ ~ ~ {Tags:["doudizhu","Shuffle_used_aec","need_score"],Duration:2147483647}
scoreboard players operation @e[type=area_effect_cloud,tag=doudizhu,tag=Shuffle_used_aec,tag=need_score,limit=1] card_id = sf_i var
tag @e[type=area_effect_cloud,tag=doudizhu,tag=Shuffle_used_aec,tag=need_score,limit=1] remove need_score
scoreboard players remove sf_i var 1
execute if score sf_i var matches 1.. run function doudizhu:recursive/shuffle_recursive