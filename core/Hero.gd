extends Resource

class_name Hero

var player_id = "ttwings"

# 种族的基本属性
export(Resource) var race
# 战斗属性、动作
export(Resource) var fighter
# 接收控制
export(Resource) var controller

var map

func Grap():
	var items = []
	for ob in map.get_objects_in_cell(fighter.get_map_pos()):
		if ob.item:
			items.append(ob)
		
