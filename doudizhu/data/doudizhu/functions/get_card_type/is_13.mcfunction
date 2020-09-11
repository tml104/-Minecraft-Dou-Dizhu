#[CT] 王炸
#input: scb -> outcards (1,2,...,15,sum) card_cnt
#return: card_type max_card


execute if score 14 outcards matches 1 if score 15 outcards matches 1 run scoreboard players set max_card outcards 15

execute if score max_card outcards matches 1.. run scoreboard players set card_type outcards 13
execute if score card_type outcards matches 0 run scoreboard players set max_card outcards 0
