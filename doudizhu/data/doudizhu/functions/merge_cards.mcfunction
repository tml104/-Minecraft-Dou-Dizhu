#[MC] 合并卡牌
#input:round(var)表示轮到谁出牌
#var:i(剩余牌数)


scoreboard players set i var 20
#execute if score round var matches 0 as @e[tag=doudizhu,tag=Pos_Player1] at @s run scoreboard players operation i var = @s remain_cards
#execute if score round var matches 0 run scoreboard players operation i var -= card_cnt outcards
execute if score round var matches 0 as @e[tag=doudizhu,tag=Pos_Player1] at @s positioned ^ ^ ^-3 run function doudizhu:recursive/merge_cards_recursive1

#execute if score round var matches 1 as @e[tag=doudizhu,tag=Pos_Player2] at @s run scoreboard players operation i var = @s remain_cards
#execute if score round var matches 1 run scoreboard players operation i var -= card_cnt outcards
execute if score round var matches 1 as @e[tag=doudizhu,tag=Pos_Player2] at @s positioned ^ ^ ^-3 run function doudizhu:recursive/merge_cards_recursive1

#execute if score round var matches 2 as @e[tag=doudizhu,tag=Pos_Player3] at @s run scoreboard players operation i var = @s remain_cards
#execute if score round var matches 2 run scoreboard players operation i var -= card_cnt outcards
execute if score round var matches 2 as @e[tag=doudizhu,tag=Pos_Player3] at @s positioned ^ ^ ^-3 run function doudizhu:recursive/merge_cards_recursive1

