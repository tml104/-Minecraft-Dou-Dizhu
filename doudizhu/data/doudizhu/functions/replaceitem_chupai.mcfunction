#[RCH] 出牌时，替换玩家物品栏
#调用对象：玩家

clear @s minecraft:carrot_on_a_stick
replaceitem entity @s hotbar.0 minecraft:carrot_on_a_stick{display:{Name:'{"text":"指针"}'},CustomModelData:301}
replaceitem entity @s hotbar.1 minecraft:carrot_on_a_stick{display:{Name:'{"text":"出牌"}'},CustomModelData:307}
replaceitem entity @s hotbar.2 minecraft:carrot_on_a_stick{display:{Name:'{"text":"Pass"}'},CustomModelData:303}
replaceitem entity @s hotbar.3 minecraft:carrot_on_a_stick{display:{Name:'{"text":"放大镜"}'},CustomModelData:308}
replaceitem entity @s hotbar.4 minecraft:carrot_on_a_stick{display:{Name:'{"text":"显示/隐藏弃牌堆记牌器"}'},CustomModelData:309}