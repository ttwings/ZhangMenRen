extends Node2D

tool
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

export(String) var alias = "thing"
export(String,MULTILINE) var description = ""

export(Texture) var sprite_path setget _set_sprite_path

export(bool) var blocks_movement = false
export(bool) var blocks_sight = false
export(bool) var stay_visible = false

var found = false
# current map cell
var cell = Vector2() setget _set_cell, _get_cell
# components dictionary
var components = {}
var item
var race
var fighter
var ai
# status effects dictionary
var status_effects = {}
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
    for component in components:
        if self.components[component].has_method("get_save_dict"):
            data["components"][component] = self.components[component].get_save_dict()
    return data

func get_message_name():
    if "player" in self.components:
        return "你"
    else:
        return self.alias

func kill():
    if self.blocks_movement or self.blocks_sight:
        emit_signal("map_cell_changed", self.cell, null)
    queue_free()

func _rpg_process(delta = 5):
    for status in self.status_effects:
        status._rpg_process(delta)
    if "AI" in self.components:
        self.components["AI"].act(delta)

func _ready():
    connect("about_to_act",self,"_on_about_to_act")
    add_to_group("things")
    if self.blocks_movement:
        add_to_group("blockers")
    if self.blocks_sight:
        add_to_group("sight_blockers")

func _get_cell():
    if map is TileMap:
        return map.world_to_map(position)

func _set_cell(cell):
    var old = self.cell
    self.cell = cell
    self.position = map.map_to_world(cell)
    emit_signal("map_cell_changed", old, cell)

func _set_sprite_path(path):
    sprite_path = path
    if is_inside_tree():
        $Sprite.texture = sprite_path

func _on_about_to_act(delta):
    _rpg_process(delta)