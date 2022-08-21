extends Resource
class_name Thing

# const color for rice text label bbcode
const NOR = "[/color]"
const BLK = "[color=#000000]"
const RED = "[color=#ff0000]"
const GRN = "[color=#00ff00]"
const YEL = "[color=#ffff00]"
const BLU = "[color=#0000ff]"
const MAG = "[color=#ff00ff]"
const CYN = "[color=#00ffff]"
const WHT = "[color=#ffffff]"   
const HIR = "[color=#ff0000]"
const HIG = "[color=#00ff00]"
const HIY = "[color=#ffff00]"
const HIB = "[color=#44cef6]"
const HIM = "[color=#ff00ff]"
const HIC = "[color=#177cb0]"
const HIW = "[color=#e9e7ef]"
const BRED = "[color=#ff2121]"
const BGRN = "[color=#00e500]"
const BYEL = "[color=#ffb61e]"
const BBLU = "[color=#4b5cc4]"
const BMAG = "[color=#8d4bbb]"
const BCYN = "[color=#1685a9]"
const HBRED = "[color=#ff2121]"
const HBGRN = "[color=#40de5a]"
const HBYEL = "[color=#eacd76]"
const HBBLU = "[color=#3b2e7e]"
const HBMAG = "[color=#815463]"
const HBCYN = "[color=#00e09e]"
const HBWHT = "[color=#f0fcff]"


signal about_to_act(delta)

var map

var alias = "thing"
var description = "this is a thing"
var apperence = "thing"
#export(Texture) var sprite_path setget _set_sprite_path

var blocks_movement = false
var blocks_sight = false
var stay_visible = false

var found = false
# current map cell
var cell = Vector2() setget _set_cell, _get_cell
# status effects dictionary
var status_effects = {}
# AI
var ai
# sid
var sid = 0
# dbpath
var dbpath = ""
# get save dictionary
func get_save_dict():
	var data = {
		"sid": sid,
		"dbpath": dbpath,
		"cell": {"x":self.cell.x, "y":self.cell.y},
		"components": {},
		"status_effects": status_effects,
		"found": found
	}
	return data

func get_message_name():
	if "player" in self.components:
		return "你"
	else:
		return self.alias

func kill():
	if self.blocks_movement or self.blocks_sight:
		emit_signal("map_cell_changed", self.cell, null)

func _rpg_process(delta = 5):
	for status in self.status_effects:
		status._rpg_process(delta)
	if ai :
		ai.act(delta)


func _get_cell():
	return cell

func _set_cell(cell):
	var old = self.cell
	self.cell = cell
	self.position = map.map_to_world(cell)
	emit_signal("map_cell_changed", old, cell)

func _on_about_to_act(delta):
	_rpg_process(delta)
