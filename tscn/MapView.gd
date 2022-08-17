extends TileMap

# 当actors 变化时

var map
onready var map_fog = get_node("%Fog")
onready var map_floor = get_node("%Floor")
onready var map_wall = get_node("%Wall")


func _ready():
	pass # Replace with function body.

func _init(map):
	self.map = map
	# 链接信号
	map.connect()
