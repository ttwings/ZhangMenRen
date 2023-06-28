extends WinPanel

var resizing = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if is_resizing_area(event.position):
					print_debug("left")
					resizing = true
#					set_process_input(true)
			else:
				resizing = false
#				set_process_input(false)

	elif event is InputEventMouseMotion:
		if resizing:
			resize_panel(event.relative)

func is_resizing_area(position: Vector2) -> bool:
	var min_size = Vector2(50, 50)
	var max_size = Vector2(800, 600)
	var resize_area_size = 10

	var panel_rect = Rect2(Vector2(), size)
	var resize_area_rect = Rect2(panel_rect.size - Vector2(resize_area_size, resize_area_size), Vector2(resize_area_size, resize_area_size))

	return resize_area_rect.has_point(position) && panel_rect.size.x >= min_size.x && panel_rect.size.y >= min_size.y && panel_rect.size.x < max_size.x && panel_rect.size.y < max_size.y

func resize_panel(relative_position: Vector2):
	var new_size = size + relative_position
	size = clamp(new_size, Vector2(50, 50), Vector2(800, 600))
