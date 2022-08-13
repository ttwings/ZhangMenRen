# 行动类
class_name Action

signal finished()
signal started()

signal trigger_event_called(name, args)

# 行动名称
var alias:String
# 行动描述
var description:String
# 行动所需要的能量
var action_energy:int = 100
# 当前行动积累的能量
var current_energy:int = 0
# 行动后剩余的能量
var remain_energy:int = 0
# 演员
var actor
# 战场
var battle_field
# 是否可以行动
func has_enough_energy() -> bool:
	return current_energy >= action_energy
	
# 动作执行
func execute() -> void:
	emit_signal("started")
	remain_energy = current_energy - action_energy
	_execute()

func trigger_event(event: String, args := []) -> void:
	emit_signal("trigger_event_called", event, args)

func _finished() -> void:
	emit_signal("finished")

func _execute() -> void:
	assert(false)
