extends Label

signal time_out

@export var max_value : int
@onready var bar = $ProgressBar
@onready var color = $ColorRect

func _ready():
	bar.max_value = max_value
	bar.value = max_value
	time_out.connect(_del)
	pass
	
func _process(delta):
	bar.value -= delta * 10
	if bar.value <= 0 :
		emit_signal("time_out")
	pass
	
func _del():
	queue_free()
	pass
