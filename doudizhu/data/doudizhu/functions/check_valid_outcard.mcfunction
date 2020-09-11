#[CVO] 检查出牌是否合法
#input:last_outcards, outcards记分板
#var: cvo_max_card cvo_last_max_card
#return: cvo (0不合法，1合法)

#这里将最大牌标号重新编排：
#3~13 对应3~K
#14：A 
#15：2
#16：joker
#17：JOKER

scoreboard players set cvo var 0
scoreboard players operation cvo_max_card var = max_card outcards
scoreboard players operation cvo_last_max_card var = max_card last_outcards

execute if score max_card outcards matches 1 run scoreboard players set cvo_max_card var 14
execute if score max_card outcards matches 2 run scoreboard players set cvo_max_card var 15
execute if score max_card outcards matches 14 run scoreboard players set cvo_max_card var 16
execute if score max_card outcards matches 15 run scoreboard players set cvo_max_card var 17

execute if score max_card last_outcards matches 1 run scoreboard players set cvo_last_max_card var 14
execute if score max_card last_outcards matches 2 run scoreboard players set cvo_last_max_card var 15
execute if score max_card last_outcards matches 14 run scoreboard players set cvo_last_max_card var 16
execute if score max_card last_outcards matches 15 run scoreboard players set cvo_last_max_card var 17


#第一个出牌
execute if score cvo_last_max_card var matches 0 if score card_type outcards matches 1.. run scoreboard players set cvo var 1

#王炸
execute if score card_type outcards matches 13 run scoreboard players set cvo var 1

#炸弹
execute if score card_type outcards matches 12 if score card_type last_outcards matches ..11 run scoreboard players set cvo var 1
execute if score card_type outcards matches 12 if score card_type last_outcards matches 12 if score sum outcards = sum last_outcards if score cvo_max_card var > cvo_last_max_card var run scoreboard players set cvo var 1

#其他牌型
execute if score card_type outcards matches 1.. if score card_type outcards = card_type last_outcards if score sum outcards = sum last_outcards if score cvo_max_card var > cvo_last_max_card var run scoreboard players set cvo var 1
