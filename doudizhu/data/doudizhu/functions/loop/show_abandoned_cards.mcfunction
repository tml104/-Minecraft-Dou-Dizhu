#[SAC][loop] 展示或隐藏记牌器

execute as @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}}] run scoreboard players add @s abandoned_cards 1
execute as @a run scoreboard players operation @s abandoned_cards %= 2 const

execute if entity @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}}] run bossbar set show_abandoned_cards players
execute if entity @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}}] run bossbar set show_abandoned_cards players @a[scores={abandoned_cards=1}]

#execute if entity @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}}] run bossbar set show_abandoned_cards2 players
#execute if entity @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'}}}}] run bossbar set show_abandoned_cards2 players @a[scores={abandoned_cards=1}]
