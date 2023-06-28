extends Action

func init():
	cd = 2
	alias = "爪击"
	description = "用利爪进行攻击"
	type = "肉体"

func _execute():
	var attack = Attack.new()
	attack.type = "slash"
	attack.hp_damage = 10
	master.hit(target,attack)
	pass
