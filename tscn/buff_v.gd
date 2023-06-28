extends TextureRect

var cooldown_time = 2
@export var buff_str = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	$Label.text = buff_str
	size.x = $Label.get_total_character_count() * 32
	print_debug(size.x)
	$TextureProgressBar.texture_progress = texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = buff_str
	$TextureProgressBar.value = int(($Timer.time_left/cooldown_time)*100)
	pass


func _on_timer_timeout() -> void:
#	queue_free()
	pass # Replace with function body.
