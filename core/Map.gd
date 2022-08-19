extends Resource
class_name Map

var cell_object_dict = {}

func add_object(cell,obj):
	if cell_object_dict[cell]:
		cell_object_dict[cell].append(obj)
	else:
		cell_object_dict[cell] = []
		cell_object_dict[cell].append(obj)
		
func kill_objcet(cell,obj):
	if cell_object_dict[cell] and obj in cell_object_dict[cell]:
		obj.kill()
		emit_signal("on_map_obj_killed")		

func is_cell_blocked(cell):
	var blocks = is_wall(cell)
	var objects = get_objects_in_cell(cell)
	for obj in objects:
		if obj.blocks_movement:
			blocks = obj
	return blocks
	
func get_objects_in_cell(cell):
	var list = []
	if cell_object_dict[cell]:
		list = cell_object_dict[cell]
		return list
#
#	for obj in get_tree().get_nodes_in_group("objects"):
#		if obj.get_parent() == GameData.map and obj.get_map_pos() == cell:
#			list.append(obj)
#			return list

func get_actor_in_cell(cell):
	var list = self.get_objects_in_cell(cell)
	for obj in list:
		if obj.is_in_group("actors"):
			return obj

func is_wall(cell):
	return DungeonGen.get_cell_data(cell) == 1
