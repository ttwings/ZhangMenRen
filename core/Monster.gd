extends Actor
class_name Monster
# view is MonsterV


# 攻击方式
export(Dictionary) var attacks = {}
# 目前的攻击方式
export(String) var current_attack = ""
# 防御方式
export(Dictionary) var defenses = {}
# 目前的防御方式
export(String) var current_defense = ""

func _init(r):
	race = r


	
