extends Node2D

class_name ThingV
# class Thing view node
onready var icon = $Icon
onready var brand = $Brand
onready var tip = $Tip

export(String) var alias = "thing"
export(String,MULTILINE) var description = ""

#export(Texture) var sprite_path setget _set_sprite_path

export(bool) var blocks_movement = false
export(bool) var blocks_sight = false
export(bool) var stay_visible = false

var found = false

# Thing
var thing

func init(t):
	thing = t
	thing.alias = alias
	thing.description = description
	thing.blocks_movement = blocks_movement
	thing.blocks_sight = blocks_sight


func add_tip(bbc):
	tip.bbcode_enabled = true
	tip.bbcode_text = bbc

func get_icon():
	return icon.texture
	
func get_brand():
	return brand.texture
	
func kill():
	if GameData.player != self:
		queue_free()	
		
func spawn(map,cell):
	if is_in_group("inventory"):
		remove_from_group("inventory")
	if not is_in_group("world"):
		add_to_group("world")
	map.add_child(self)
	set_map_pos(cell)
	return self
	
func set_map_pos(c):
	return GameData.map.world_to_map(position)			
	
func _ready():
	add_to_group("Things")

	
