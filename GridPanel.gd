extends Control

@onready var panel = $Panel 
@onready var grid = $Panel/GridContainer

var panel_width 
var grid_width
var column_count

func _ready():
	panel_width = panel
	panel_width = panel.size.x
	grid_width = grid.size.x
	column_count = grid.columns

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == event.BUTTON_LEFT:
		var drag_start = event.position
		var drag_end
		var drag_vec
		var new_width
		var new_column_count  
		
		if event.pressed:
			drag_start = event.position
			
		else: 
			drag_end = event.position
			drag_vec = drag_end - drag_start
			new_width = drag_vec.x + panel_width
			new_column_count = int(new_width / grid_width)
			panel.rect_size.x = new_width
			grid.columns = new_column_count 
