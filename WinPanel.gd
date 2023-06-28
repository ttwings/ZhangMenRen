extends Panel 

class_name WinPanel

var _reset_position = Vector2() 
var _previous_mouse_position = Vector2() 
var _is_dragging = false 
signal on_open 
signal on_closed 
func _ready(): 
	_reset_position = position 

func _process(delta):
	if _is_dragging:
		var mouse_delta = _previous_mouse_position - get_local_mouse_position()
		position -= mouse_delta 

func _gui_input(event): 
		if event.is_action_pressed("ui_select"): 
			_is_dragging = true 
			_bring_to_front()
			_previous_mouse_position = get_local_mouse_position() 
		if event.is_action_released("ui_select"): 
			_is_dragging = false 
		
func _bring_to_front():
	if get_parent() != null:
		get_parent().move_child(self, get_parent().get_child_count() - 1)			
