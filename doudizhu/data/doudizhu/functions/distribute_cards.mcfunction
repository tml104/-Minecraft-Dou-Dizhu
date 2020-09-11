#[DE] Deliver cards to face-down cards, players1, 2 and 3.
#return:-

data merge storage doudizhu:cards {facedown:[],player1:[],player2:[],player3:[],player1_copy:[],player2_copy:[],player3_copy:[],facedown_copy:[]}

scoreboard players set sf_i var 3
function doudizhu:recursive/deliver_face_recursive

scoreboard players set sf_i var 17
function doudizhu:recursive/deliver_players_recursive

#sort...
data modify storage doudizhu:cards rs set from storage doudizhu:cards facedown
function doudizhu:radix_sort
data modify storage doudizhu:cards facedown set from storage doudizhu:cards rs

data modify storage doudizhu:cards rs set from storage doudizhu:cards player1
function doudizhu:radix_sort
data modify storage doudizhu:cards player1 set from storage doudizhu:cards rs

data modify storage doudizhu:cards rs set from storage doudizhu:cards player2
function doudizhu:radix_sort
data modify storage doudizhu:cards player2 set from storage doudizhu:cards rs

data modify storage doudizhu:cards rs set from storage doudizhu:cards player3
function doudizhu:radix_sort
data modify storage doudizhu:cards player3 set from storage doudizhu:cards rs

#copy
data modify storage doudizhu:cards player1_copy set from storage doudizhu:cards player1
data modify storage doudizhu:cards player2_copy set from storage doudizhu:cards player2
data modify storage doudizhu:cards player3_copy set from storage doudizhu:cards player3
data modify storage doudizhu:cards facedown_copy set from storage doudizhu:cards facedown

