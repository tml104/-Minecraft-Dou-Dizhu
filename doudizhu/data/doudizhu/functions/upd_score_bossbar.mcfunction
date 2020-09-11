#[USB] 更新倍率和底分记分板的bossbar信息


bossbar set show_score_and_scale visible true
bossbar set show_score_and_scale name ["",{"text":"底分：","bold":true,"color":"light_purple"},{"score":{"name":"#base","objective":"score"},"bold":true,"color":"light_purple"},{"text":"      "},{"text":"倍率：","bold":true,"color":"red"},{"score":{"name":"#scale","objective":"score"},"bold":true,"color":"red"}]