#[TM] 高频更新当前时间戳

execute store result score now_time timer run time query gametime
scoreboard players operation res timer = now_time timer
scoreboard players operation res timer -= time_index timer
