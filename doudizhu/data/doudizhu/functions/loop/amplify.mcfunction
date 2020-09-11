#[AF][loop] 放大镜
#execute as @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"放大镜"}'}}}}] run say @s
execute as @a[scores={rclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"放大镜"}'}}}}] run scoreboard players add @s amplifier 1
execute as @a run scoreboard players operation @s amplifier %= 2 const
execute as @a[scores={amplifier=1}] run effect give @s slowness 10 137 true
execute as @a[scores={amplifier=0}] run effect clear @s slowness
