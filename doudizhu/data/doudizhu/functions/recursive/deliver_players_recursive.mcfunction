#[DE] every player 17 cards
#input sf_i
#return:-

data modify storage doudizhu:cards player1 append from storage doudizhu:cards cards[0]
data remove storage doudizhu:cards cards[0]

data modify storage doudizhu:cards player2 append from storage doudizhu:cards cards[0]
data remove storage doudizhu:cards cards[0]

data modify storage doudizhu:cards player3 append from storage doudizhu:cards cards[0]
data remove storage doudizhu:cards cards[0]

scoreboard players remove sf_i var 1
execute if score sf_i var matches 1.. run function doudizhu:recursive/deliver_players_recursive