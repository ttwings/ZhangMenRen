# 行动类
class_name Action

# 行动前、行动、行动完成
signal on_cd_ready()
signal on_started()
signal on_executed()
signal on_finished()

# 所有

# 行动名称
var alias:String
# 类别
var type:String
# 行动描述
var description:String
# 行动cd
var cd
# 目前cd
var cd_now
# 行动者
var master:Chara
# 目标单位
var target:Chara
# 环境
var env:Obj
# 行动是否准备好
var dec

func is_cd_ready() -> bool:
	if cd_now >= cd:
		emit_signal("on_cd_ready")
		return true
	return false
	
func update(delta):
	cd_now += delta
	pass	

func execute() -> void:
	emit_signal("on_executed")
	cd_now = 0
	_execute()
	finished()

func finished():
	emit_signal("on_finished")
	_finished()

func _finished() -> void:
	pass

func _execute() -> void:
	pass

func do_action():
	pass
