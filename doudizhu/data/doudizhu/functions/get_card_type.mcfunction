#[CT]
#input: scb -> outcards (1,2,...,15,sum)
#var:card_type max_card card_cnt
#return: card_type max_card card_cnt

scoreboard players set card_type outcards 0
scoreboard players set max_card outcards 0
scoreboard players operation card_cnt outcards = sum outcards

#固定长度牌型
execute if score card_type outcards matches 0 if score card_cnt outcards matches 1 run function doudizhu:get_card_type/is_1
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]
execute if score card_type outcards matches 0 if score card_cnt outcards matches 2 run function doudizhu:get_card_type/is_2
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]
execute if score card_type outcards matches 0 if score card_cnt outcards matches 3 run function doudizhu:get_card_type/is_3
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 4 run function doudizhu:get_card_type/is_12
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 2 run function doudizhu:get_card_type/is_13
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 4 run function doudizhu:get_card_type/is_4
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 5 run function doudizhu:get_card_type/is_5
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 6 run function doudizhu:get_card_type/is_6
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]
#四带二的8张牌形式
execute if score card_type outcards matches 0 if score card_cnt outcards matches 8 run function doudizhu:get_card_type/is_6

#不定长牌型
execute if score card_type outcards matches 0 if score card_cnt outcards matches 6.. run function doudizhu:get_card_type/is_7
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 5.. run function doudizhu:get_card_type/is_8
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 6.. run function doudizhu:get_card_type/is_9
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 8.. run function doudizhu:get_card_type/is_10
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]

execute if score card_type outcards matches 0 if score card_cnt outcards matches 10.. run function doudizhu:get_card_type/is_11
#tellraw @a [{"score": {"name": "card_type","objective": "outcards"}},{"score": {"name": "max_card","objective": "outcards"}},{"score": {"name": "card_cnt","objective": "outcards"}}]


#DEBUG
#execute if score card_type outcards matches 1 run say 单牌
#execute if score card_type outcards matches 2 run say 一对
#execute if score card_type outcards matches 3 run say 三条
#execute if score card_type outcards matches 4 run say 三带一
#execute if score card_type outcards matches 5 run say 三带二
#execute if score card_type outcards matches 6 run say 四带二
#execute if score card_type outcards matches 7 run say 连对
#execute if score card_type outcards matches 8 run say 顺子
#execute if score card_type outcards matches 9 run say 飞机不带翼
#execute if score card_type outcards matches 10 run say 飞机带单翼
#execute if score card_type outcards matches 11 run say 飞机带双翼
#execute if score card_type outcards matches 12 run say 炸弹
#execute if score card_type outcards matches 13 run say 王炸
#execute if score card_type outcards matches 1 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 单牌"}]
#execute if score card_type outcards matches 2 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 一对"}]
#execute if score card_type outcards matches 3 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三条"}]
#execute if score card_type outcards matches 4 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三带一"}]
#execute if score card_type outcards matches 5 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 三带二"}]
#execute if score card_type outcards matches 6 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 四带二"}]
#execute if score card_type outcards matches 7 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 连对"}]
#execute if score card_type outcards matches 8 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 顺子"}]
#execute if score card_type outcards matches 9 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
#execute if score card_type outcards matches 10 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
#execute if score card_type outcards matches 11 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 飞机"}]
#execute if score card_type outcards matches 12 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 炸弹"}]
#execute if score card_type outcards matches 13 run tellraw @a ["",{"selector":"@s","bold":true},{"text":": 王炸"}]