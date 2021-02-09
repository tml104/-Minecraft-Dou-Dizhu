#[RB] 游戏开始前，替换玩家物品栏

clear @s minecraft:carrot_on_a_stick
replaceitem entity @s hotbar.0 minecraft:carrot_on_a_stick{display:{Name:'{"text":"指针"}'},CustomModelData:301}
replaceitem entity @s hotbar.1 minecraft:carrot_on_a_stick{display:{Name:'{"text":"前往牌桌/返回大厅"}'},CustomModelData:302}
replaceitem entity @s hotbar.4 minecraft:carrot_on_a_stick{display:{Name:'{"text":"欢迎文字"}'},CustomModelData:310}
replaceitem entity @s hotbar.5 minecraft:carrot_on_a_stick{display:{Name:'{"text":"基本操作说明"}'},CustomModelData:310}
replaceitem entity @s hotbar.6 minecraft:carrot_on_a_stick{display:{Name:'{"text":"快速操作说明"}'},CustomModelData:310}
replaceitem entity @s hotbar.7 minecraft:carrot_on_a_stick{display:{Name:'{"text":"声音与快速聊天说明"}'},CustomModelData:310}
replaceitem entity @s hotbar.8 minecraft:carrot_on_a_stick{display:{Name:'{"text":"倍数与分数计算说明"}'},CustomModelData:310}

