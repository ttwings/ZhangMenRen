extends Resource
class_name Location

var id := 0

var cell := Vector2()
var position := Vector2()

var actor : Actor = null setget _set_actor
var terrain : Terrain = null

var side_number := -1
var team_name := ""

var _neighbors := []

var castle := []


func _init() -> void:
	_neighbors.resize(8)


func set_terrain(code: Array) -> void:
	# var data := []
	# # for c in code:
	# # 	data.append(Data.terrains[c])
	# terrain = Terrain.new(data)
	pass


func set_code(code: Array) -> void:
	terrain.code = code


func set_base_code(base_code: String) -> void:
	terrain.code[0] = base_code


func set_overlay_code(overlay_code: String) -> void:
	if terrain.code.size() > 1:
		terrain.code[1] = overlay_code
	elif terrain.code.size() == 1:
		terrain.code.append(overlay_code)


func remove_overlay_code() -> void:
	terrain.code.resize(1)


func add_neighbor(loc: Location, direction: int) -> void:
	_neighbors[direction] = loc


func get_neighbor(direction: int) -> Location:
	return _neighbors[direction]


func get_neighbors() -> Array:
	var neighbors := []

	for n in _neighbors:
		if n:
			neighbors.append(n)
	return neighbors


func get_all_neighbors() -> Array:
	return _neighbors


func get_all_neighbors_top_bottom() -> Array:
	return [_neighbors[0], _neighbors[-1], _neighbors[1], _neighbors[-2], _neighbors[2], _neighbors[3]]


func duplicate(subresources := false) -> Resource:
	var res = .duplicate(subresources)
	res.id = id
	res.cell = cell
	res.position = position
	res.terrain = terrain
	res.actor = actor
	res.terrain = terrain
	res.castle = castle
	res.side_number = side_number
	res.team_name = team_name
	return res


func _set_actor(_actor: Actor) -> void:
	if actor:
		actor.disconnect("died", self, "_on_unit_died")
	actor = _actor
	if actor:
		actor.connect("died", self, "_on_unit_died")


func _on_actor_died(_actor: Actor) -> void:
	actor = null
