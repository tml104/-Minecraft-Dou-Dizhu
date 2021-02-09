#[PLE] 在doudizhu,Center处，播放爆炸效果

execute as @e[tag=doudizhu,tag=Center] at @s run summon tnt ~ ~ ~ {Fuse:100}
execute as @e[tag=doudizhu,tag=Center] at @s run schedule function doudizhu:play_explosion2 2s append