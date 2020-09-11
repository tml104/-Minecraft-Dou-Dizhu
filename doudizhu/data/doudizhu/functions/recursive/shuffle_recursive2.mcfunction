#[SF] Pick cards
#input: empty list (in doudizhu:cards -> cards)
#var: temp (in doudizhu:cards -> temp)
#return: a list (in doudizhu:cards -> cards) containing shuffled cards

tag @e[sort=random,limit=1,tag=Shuffle_used_aec,tag=doudizhu] add Chosen
execute store result storage doudizhu:cards temp int 1 run scoreboard players get @e[limit=1,tag=Shuffle_used_aec,tag=doudizhu,tag=Chosen] card_id
data modify storage doudizhu:cards cards append from storage doudizhu:cards temp
kill @e[limit=1,tag=Shuffle_used_aec,tag=doudizhu,tag=Chosen]
scoreboard players remove sf_i var 1
execute if score sf_i var matches 1.. run function doudizhu:recursive/shuffle_recursive2