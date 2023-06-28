extends TextureButton

class_name ActionV


@export var cooldown_time:=1
@export var action_id := ""

signal on_runing
signal on_do_action

var is_run = false
var action = Action.new()

var env:ObjV
var target:CharaV
var player:CharaV

func _get(property):
	if (property == "fake_property"):
		print("Getting my property!")
		return 4

func _get_property_list():
	return [
	{ "name": "fake_property", "type": TYPE_INT }
	]


func set_action(a):
	action = a

func _ready() -> void:
	$TextureProgressBar.value = 100
	$TextureProgressBar.texture_progress = texture_normal
	$Timer.wait_time = cooldown_time
	set_process(false)
	pass
	
func _process(delta: float) -> void:
	$TextureProgressBar.value = int(100 - ($Timer.time_left/cooldown_time) * 100)


func _on_timer_timeout() -> void:
	is_run = false
	$TextureProgressBar.value = 0
	set_process(false)
	pass # Replace with function body.


func _on_pressed() -> void:
	if is_run == false:
		is_run = true
		$Timer.start()
		set_process(true)
		_do_action()
		emit_signal("on_do_action")	
	pass # Replace with function body.

func _do_action():
	action.do_action(env,)
	emit_signal("on_do_action")
	pass
