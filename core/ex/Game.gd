extends Node
class_name Game

# 战场
var battle_field
# 选择点
var hovered_location : Location
var selected_location : Location


func _ready():
	battle_field = $BattleFiled

# 下一回合
func next_turn():
	battle_field.next_turn()
	pass
