#[DE] face 3 cards
#input sf_i
#return:-

data modify storage doudizhu:cards facedown append from storage doudizhu:cards cards[0]
data remove storage doudizhu:cards cards[0]
scoreboard players remove sf_i var 1
execute if score sf_i var matches 1.. run function doudizhu:recursive/deliver_face_recursive