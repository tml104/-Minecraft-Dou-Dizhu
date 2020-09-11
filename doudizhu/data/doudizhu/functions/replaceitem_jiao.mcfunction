#[RJ] 叫地主时，替换玩家物品栏
#调用对象：玩家

clear @s minecraft:carrot_on_a_stick
replaceitem entity @s hotbar.0 minecraft:carrot_on_a_stick{display:{Name:'{"text":"Pass"}'},CustomModelData:303}
replaceitem entity @s hotbar.1 minecraft:carrot_on_a_stick{display:{Name:'{"text":"1分"}'},CustomModelData:304}
replaceitem entity @s hotbar.2 minecraft:carrot_on_a_stick{display:{Name:'{"text":"2分"}'},CustomModelData:305}
replaceitem entity @s hotbar.3 minecraft:carrot_on_a_stick{display:{Name:'{"text":"3分"}'},CustomModelData:306}