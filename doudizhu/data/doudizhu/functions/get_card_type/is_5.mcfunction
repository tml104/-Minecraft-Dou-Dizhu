#[CT] 三带二
#input: scb -> outcards (1,2,...,15,sum) card_cnt
#var: temp
#return: card_type max_card

#找主元
execute if score 1 outcards matches 3 run scoreboard players set max_card outcards 1
execute if score 2 outcards matches 3 run scoreboard players set max_card outcards 2
execute if score 3 outcards matches 3 run scoreboard players set max_card outcards 3
execute if score 4 outcards matches 3 run scoreboard players set max_card outcards 4
execute if score 5 outcards matches 3 run scoreboard players set max_card outcards 5
execute if score 6 outcards matches 3 run scoreboard players set max_card outcards 6
execute if score 7 outcards matches 3 run scoreboard players set max_card outcards 7
execute if score 8 outcards matches 3 run scoreboard players set max_card outcards 8
execute if score 9 outcards matches 3 run scoreboard players set max_card outcards 9
execute if score 10 outcards matches 3 run scoreboard players set max_card outcards 10
execute if score 11 outcards matches 3 run scoreboard players set max_card outcards 11
execute if score 12 outcards matches 3 run scoreboard players set max_card outcards 12
execute if score 13 outcards matches 3 run scoreboard players set max_card outcards 13
#找带牌
scoreboard players set temp var 0
execute if score max_card outcards matches 1.. if score 1 outcards matches 2 run scoreboard players set temp var 1
execute if score max_card outcards matches 1.. if score 2 outcards matches 2 run scoreboard players set temp var 2
execute if score max_card outcards matches 1.. if score 3 outcards matches 2 run scoreboard players set temp var 3
execute if score max_card outcards matches 1.. if score 4 outcards matches 2 run scoreboard players set temp var 4
execute if score max_card outcards matches 1.. if score 5 outcards matches 2 run scoreboard players set temp var 5
execute if score max_card outcards matches 1.. if score 6 outcards matches 2 run scoreboard players set temp var 6
execute if score max_card outcards matches 1.. if score 7 outcards matches 2 run scoreboard players set temp var 7
execute if score max_card outcards matches 1.. if score 8 outcards matches 2 run scoreboard players set temp var 8
execute if score max_card outcards matches 1.. if score 9 outcards matches 2 run scoreboard players set temp var 9
execute if score max_card outcards matches 1.. if score 10 outcards matches 2 run scoreboard players set temp var 10
execute if score max_card outcards matches 1.. if score 11 outcards matches 2 run scoreboard players set temp var 11
execute if score max_card outcards matches 1.. if score 12 outcards matches 2 run scoreboard players set temp var 12
execute if score max_card outcards matches 1.. if score 13 outcards matches 2 run scoreboard players set temp var 13
execute if score max_card outcards matches 1.. if score 14 outcards matches 2 run scoreboard players set temp var 14
execute if score max_card outcards matches 1.. if score 15 outcards matches 2 run scoreboard players set temp var 15

execute if score max_card outcards matches 1.. if score temp var matches 1.. run scoreboard players set card_type outcards 5
execute if score card_type outcards matches 0 run scoreboard players set max_card outcards 0
