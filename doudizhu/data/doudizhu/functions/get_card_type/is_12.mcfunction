#[CT] 炸弹（四条）
#input: scb -> outcards (1,2,...,15,sum) card_cnt
#return: card_type max_card


execute if score 1 outcards matches 4 run scoreboard players set max_card outcards 1
execute if score 2 outcards matches 4 run scoreboard players set max_card outcards 2
execute if score 3 outcards matches 4 run scoreboard players set max_card outcards 3
execute if score 4 outcards matches 4 run scoreboard players set max_card outcards 4
execute if score 5 outcards matches 4 run scoreboard players set max_card outcards 5
execute if score 6 outcards matches 4 run scoreboard players set max_card outcards 6
execute if score 7 outcards matches 4 run scoreboard players set max_card outcards 7
execute if score 8 outcards matches 4 run scoreboard players set max_card outcards 8
execute if score 9 outcards matches 4 run scoreboard players set max_card outcards 9
execute if score 10 outcards matches 4 run scoreboard players set max_card outcards 10
execute if score 11 outcards matches 4 run scoreboard players set max_card outcards 11
execute if score 12 outcards matches 4 run scoreboard players set max_card outcards 12
execute if score 13 outcards matches 4 run scoreboard players set max_card outcards 13

execute if score max_card outcards matches 1.. run scoreboard players set card_type outcards 12
execute if score card_type outcards matches 0 run scoreboard players set max_card outcards 0
