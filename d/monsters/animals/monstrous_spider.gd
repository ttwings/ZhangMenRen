extends Race

func _init():
    race = "蜘蛛"
    alias = "变种小蜘蛛"
    body = "超小型"
    Hp_dice = 8
    speed = 4
    armor_class = 15
    attacks = {"1" : Attack.new("啮咬",5,1,1,4,"毒素")}