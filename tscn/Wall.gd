extends Area3D

class_name Wall
# Called when the node enters the scene tree for the first time.
func _ready():
	## 添加到wall group
	add_to_group("wall")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
