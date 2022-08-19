extends TileMap
# 战场类
class_name Battlefield
# 信号
signal on_next_turn
signal on_weather_changed
# 天气类
var weather : Weather
# 地图
var map:TileMap
var tileszie = 64
var size = Vector2(40,30)
var locations = {}

func _ready():
	pass
	

func next_turn():
	emit_signal("on_next_turn")
	battle_loop()
	pass	

# 战场更新
func battle_loop():
	for cell in locations:
		if locations[cell] and locations[cell].actor:
			locations[cell].actor.tack_turn()
# 添加演员sprite
func add_actor(actor:Actor):
	locations[actor.cell] = Location.new()
	locations[actor.cell].actor = actor
	actor.battlefield = self
# 移除演员
func remove_actor(actor:Actor):
	locations.erase(actor.call)


func set_location(cell:Vector2,location:Location):
	locations[cell] = location

func get_location(cell:Vector2):
	return locations[cell]

# 战场上的物品动画管理

# 按方向移动
func r_thing_move_dir(thing_path,dir):
	var new_v = dir*64
	Anima.begin(self)\
	.then(Anima.Node(thing_path).anima_position(new_v,0.3))\
	.play()

# 跳跃动画
func r_thing_jump_dir(thing_path,dir):
	pass
	
# 冲锋
func r_thing_charge_dir(thing_path,dir):
	pass	
	
