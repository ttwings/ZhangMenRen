extends TextureButton

@export var cooldown_time:=1
@export var skill_id := ""

signal on_runing
signal on_use_skill

var is_run = false


func _ready() -> void:
	$Label.hide()
	$TextureProgressBar.value = 0
	$TextureProgressBar.texture_progress = texture_normal
	$Timer.wait_time = cooldown_time
	set_process(false)
	pass
	
func _process(delta: float) -> void:
	$Label.text = "%0.1f" % $Timer.time_left
	$TextureProgressBar.value = int(($Timer.time_left/cooldown_time) * 100)
	pass


func _on_timer_timeout() -> void:
	is_run = false
	$Label.hide()
	$TextureProgressBar.value = 0
	set_process(false)
	pass # Replace with function body.


func _on_pressed() -> void:
	if is_run == false:
		is_run = true
		$Label.show()
		$Timer.start()
		use_skill()
		set_process(true)	
	pass # Replace with function body.

# 使用技能
func use_skill():
	emit_signal("on_use_skill")
	pass
