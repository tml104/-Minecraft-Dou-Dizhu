#[LH] 离开游戏的提示

execute as @a[scores={ddz_leavegame=1..},tag=Player1] run tellraw @s {"text":"注意：你在游戏过程中意外退出了游戏。如果原斗地主游戏仍在进行，请继续游戏，否则请输入/reload重置整个原版模组。若如此做，你的分数将不会消失。","color":"red"}
execute as @a[scores={ddz_leavegame=1..},tag=Player2] run tellraw @s {"text":"注意：你在游戏过程中意外退出了游戏。如果原斗地主游戏仍在进行，请继续游戏，否则请输入/reload重置整个原版模组。若如此做，你的分数将不会消失。","color":"red"}
execute as @a[scores={ddz_leavegame=1..},tag=Player3] run tellraw @s {"text":"注意：你在游戏过程中意外退出了游戏。如果原斗地主游戏仍在进行，请继续游戏，否则请输入/reload重置整个原版模组。若如此做，你的分数将不会消失。","color":"red"}

execute as @a[scores={ddz_leavegame=1..}] run scoreboard players set @s ddz_leavegame 0