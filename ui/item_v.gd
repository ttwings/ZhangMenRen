extends Panel

@export var dbase:Item = Item.new()
@onready var icon = $TextureRect
@onready var alias = $Label
@onready var color = $ColorRect
@onready var signal_bus:SignalBus

var drag_source

func _ready():
	update()
	pass

func update():
	icon.texture = dbase.texture
	alias.text = dbase.alias
	color.color = dbase.color


func _get_drag_data(at_position):
	var drag_node = self.duplicate()
	drag_node.drag_source = self
#	drag_node.size = Vector2(64,64)
	set_drag_preview(drag_node)
	return drag_node

func _can_drop_data(at_position, data):
	return data and data.get("dbase") is Item
	
	
func _drop_data(at_position, data):
	_swap_dbase(self,data.drag_source)
	self.update()
	data.drag_source.update()
	pass
	
func _swap_dbase(a,b):
	var temp = a.dbase
	a.dbase = b.dbase
	b.dbase = temp
