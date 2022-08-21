extends TileMap

var x0 = 0
var y0 = 0
var x1 = -10
var x2 = 10
var y1 = -10
var y2 = 10
var effect_cells = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_cell(x0,y0))
	get_effect_cells(x1,y1,x2,y2)
	pass # Replace with function body.

func get_effect_cells(x1,y1,x2,y2):
	for i in range(x1,x2):
		for j in range(y1,y2):
			if get_cell(i,j) != -1 :
				effect_cells.append(Vector2(i,j))
				print(Vector2(i,j))
				
func get_target_cell(x1,y1,x2,y2):
	for i in range(x1,x2):
		for j in range(y1,y2):
			if get_cell(i,j) == 1 :
				print(get_cell(i,j))
				return Vector2(i,j)
