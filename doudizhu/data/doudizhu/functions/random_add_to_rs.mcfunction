#Test use function
function doudizhu:get_random
execute store result storage doudizhu:cards temp int 1 run scoreboard players get rd_x var
data modify storage doudizhu:cards rs append from storage doudizhu:cards temp

scoreboard players remove sf_i var 1
execute if score sf_i var matches 1.. run function doudizhu:random_add_to_rs